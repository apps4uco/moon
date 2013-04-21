var status;
	
	var testRectangle = function (event) {
                        el=event.srcElement;
                        //el.setAttribute('size', '0.5 0.5');
                        //el.setAttribute('subdivision', '2 2');
                        el.setAttribute('emissiveColor', '1 0 0');
        };
        
        
        function set_body_height()
        {
            var wh = $(window).height();
            $('body').attr('style', 'height:' + wh + 'px;');
            $('X3D').attr('style', 'height:' + wh + 'px;');
        }
        
       
        
     // simplify access to the X3D element
    	var $element;
    	 var runtime = null;
    	var debug = false;
    	var pick_mode_info;
    	var nav_mode_info;
    	var ab_info;

    	function init() {
    		set_body_height();
            $(window).bind('resize', function() { set_body_height(); });
            
            /*
            function send() {
                var requestUrl =
                    "kam/?lat="+ $('#lat').val() +"&lng=" + $('#lng').val();
                log(requestUrl); 
                $.getJSON(requestUrl,
                function(data) {
                    log(data); 
                    
                    $('#results').html("<ul/>");
                    $.each(data, function(i,kam){
                       $('#results ul').append('<li><a href target="kam" src="' + kam.image_page + '">'+ kam.id +'</a></li>');
                    });
                    //$("#firstNumber").html(data.firstNumber);
                    //$("#secondNumber").html(data.secondNumber);
                    //$("#total").html(data.total);
                });
            }
            */
            function send() {
                var requestUrl =
                    "kam/?lat="+ $('#lat').val() +"&lng=" + $('#lng').val();
                log(requestUrl); 
                
              $.ajax({
                type: "GET",
                url: requestUrl,
                dataType: "json",
                cache: false,
                contentType: "application/json",
                success: function(data) {

                	//log(data); 
                    
                    $('#results').html('<ul/>');
                    $.each(data, function(i,kam){
                       log(kam);
                       link=kam.image_link.replace('&', '&amp;');
                       log("Link: "+link);
                       el='<li><a target="kam" href="'+link+'">'+kam.id+'</a><a href="#" onclick="setTexture(\'image'+i+'\',\''+link+'\');return false;">3d</a></li>';
                       log("El: "+el);
                       
                    	$('#results ul').append(el); 
                    	//'<li><a target="kam" href="'+kam.image_page+'">'+kam.id+'</a></li>' OK
                    	//  <a target="kam" href="'+kam.image_link+'">raw</a>
                    });

                     //initBinding();
                },
                error: function(xhr, status, error) {
                  alert(xhr.status);
                }
             });
            }
            
            $('#search').click(send);
            /*
            // Create the sliders
            $(".slider").slider({min: 0, max: 1, step: 0.01, slide: function(e, ui) {
                var newCol =   $("#redSlider").slider('option', 'value') + " " 
                             + $("#greenSlider").slider('option', 'value') + " "  
                             + $("#blueSlider").slider('option', 'value');              
                $("Material[DEF='MOONMATERIAL']").attr("diffuseColor", newCol);
            }});
            */
            $element =document.getElementById('x3d');
            runtime=$element.runtime;
    		updateAbInfo('Viewpoint');
    		updateInfo();
    	}
    	
    	function log(message)
    	{
    		if (console) console.log(message);
    	}
    	
    	function updateInfo() {
    		if (runtime){
    			$('#nav_mode_info').html(runtime.navigationType());
    			$('#speed').html(runtime.speed());
    		}
    	}

    	function updateAbInfo(typeName) {
    		if (runtime){
    			var bindable = runtime.getActiveBindable(typeName);
    			$('#ab_info').html(bindable.tagName + " / " + bindable.getAttribute('description'));
    		}
    	}
    	
    	function toggleStats(link) {
    		if (runtime)
    		{
	    		stats = runtime.statistics();
	    		if (stats) {
	    			runtime.statistics(false);
	    			link.innerHTML = 'Show statistics';
	    		} else {
	    			runtime.statistics(true);
	    			link.innerHTML = 'Hide statistics';
	    		}
    		}
    	}
    	
    	function toggleDebug(link) {
    		if (debug) {
    			runtime.debug(false);
    			link.innerHTML = 'Show debug';
    		} else {
    			runtime.debug(true);
    			link.innerHTML = 'Hide debug';
    		}
    		debug = !debug
    	}
    	
    	function toDegrees(radians)
    	{
    		return radians*180/Math.PI;	
    	}
    	
    	function incSpeed(inc)
    	{
    		speed=runtime.speed();
    		speed+=inc;
    		if (speed > 0)
    		{
    			runtime.speed(speed);
    			updateInfo();
    		}
    	}
    	
    	function setView(viewname)
    	{
    		view=document.getElementById(viewname);
    		if (view)
    		{
    			view.setAttribute('set_bind','true');	
    		}
    		else
    		{
    			alert("View "+viewname+" does not exist");	
    		}
    	}
    	 var rubberBandTest = false; //TODO
        
         var pos1, pos2;
         var startPosX, startPosY;
         var rb = null;
         var drag = false;
         
         function start(event) 
         {
             if (rubberBandTest && !drag) {
                 drag = true;
                 startPosX = event.pageX;
                 startPosY = event.pageY;
                 
                 pos1 = runtime.mousePosition(event);
                 
                 rb.style.visibility = "visible";
                 rb.style.left = startPosX + "px";
                 rb.style.top = startPosY + "px";
                 rb.style.width = "1px";
                 rb.style.height = "1px";
             }
         }
         
         //
         // ACHTUNG: Rubber-Band Darstellung ist nur ein HACK und lässt sich 
         // derzeit nur von *links oben* nach *rechts unten* aufziehen!!!
         //
         function move(event) 
         {
             if (drag) {
                 var pos = runtime.mousePosition(event);
                 
                 rb.style.left = startPosX + "px";
                 rb.style.top = startPosY + "px";
                 rb.style.width = Math.abs(event.pageX-startPosX) + "px";
                 rb.style.height = Math.abs(event.pageY-startPosY) + "px";
             }
             else
            {
            		 //updatePos(event); 
            }
         }
         
         function stop(event)
         {
             if (drag) {
                 drag = false;
                 
                 pos2 = runtime.mousePosition(event);
                 
                 rb.style.visibility = "hidden";
             
                 var objs = runtime.pickRect(pos1[0], pos1[1], pos2[0], pos2[1]);
             
                 var str = "";
                 for (var i=0; i<objs.length; i++) {
                     str += objs[i].getAttribute('DEF') + ", ";
                 }
                 x3dom.debug.logInfo(str);
             }
         }
    	
    	function moonClick(point)
    	{
    		var text="Moon click "+point;//+" "+Object.getOwnPropertyNames($element.runtime)
    		y=point[0];
    		z=point[1];
    		x=point[2];
    		
    		r=Math.sqrt(x*x+y*y+z*z);
    		lat=toDegrees(Math.asin(z/r));
    		lng=toDegrees(Math.atan2(y,x));
    		
    		$('#lat').val(lat);
    		$('#lng').val(lng);
    		
    		
    		//alert("Moon click: x "+point.x + " y "+point.y+ " z "+point.z+ "  win "+$('#status'));
    		$('#status').html(text);
    	}
    	
    	function updatePos(event)
        {
    		// TypeError: event.worldX is undefined
            $('#pos').html(event.worldX.toFixed(4) + ", " + 
                                                          event.worldY.toFixed(4) + ", " + 
                                                          event.worldZ.toFixed(4) + " | " + 
                                                          event.normalX.toFixed(4) + ", " + 
                                                          event.normalY.toFixed(4) + ", " + 
                                                     event.normalZ.toFixed(4));
        }
    	
        function updateStuff(event)
        {  
            var l = document.getElementById('cpnt');
            var t = document.getElementById('bar');
            
            var norm = new x3dom.fields.SFVec3f(event.normalX, event.normalY, event.normalZ);
            
            l.setAttribute('point', event.worldX+' '+event.worldY+' '+event.worldZ+', '+
                            (event.worldX+2.5*norm.x)+' '+(event.worldY+2.5*norm.y)+' '+(event.worldZ+2.5*norm.z));
            
            var qDir = x3dom.fields.Quaternion.rotateFromTo(new x3dom.fields.SFVec3f(0, 1, 0), 
                                                            norm);
                                                            //new x3dom.fields.SFVec3f(0, 0, -1));
            var rot = qDir.toAxisAngle();
            
            //x3dom.debug.logWarning(rot);  
            t.setAttribute('rotation', rot[0].x+' '+rot[0].y+' '+rot[0].z+' '+rot[1]);
            //t.setAttribute('translation', (event.worldX+norm.x)+' '+(event.worldY+norm.y)+' '+(event.worldZ+norm.z));
            t.setAttribute('translation', event.worldX+' '+event.worldY+' '+event.worldZ);
        }
    	
    	var setView2 = function(evt) {
			var e = document.getElementById("boxes");
			e.runtime.resetExamin();
			//e.runtime.canvas.doc._viewarea._scene.getViewpoint().setView(mat);
			//return;
			
        	document.getElementById('aView').setAttribute(
        				'position', pos.x+' '+pos.y+' '+pos.z);
        	document.getElementById('aView').setAttribute(
        				'orientation', rot[0].x+' '+rot[0].y+' '+rot[0].z+' '+rot[1]);
        };
        
        function setTexture(appearanceId,url)
        {
	        genId=appearanceId+'Tex';
	        if (url) {
	            var t = document.createElement("ImageTexture");
	            t.setAttribute("id", genId);
	            t.setAttribute("url", url);
	            document.getElementById(appearanceId).appendChild(t);
	        }
	        else {
	            var ot = document.getElementById(appearanceId);
	            ot.removeChild(document.getElementById(genId));
	        }
        }