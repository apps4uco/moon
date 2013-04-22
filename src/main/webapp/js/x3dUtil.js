var status;
var  autosearch=true;
var earthRadius=6.378;
var moonRadius=1.738;

function setHeadlight(on)
{
	var nav=document.getElementById('nav');
	nav.setAttribute('headlight',on);
}


function toggleAnim()
{
	var button = document.getElementById("anim");
	var ts = document.getElementById("TS");
	var val = ts.getAttribute("enabled");
	log("Animation "+val);
	
	if (val === "true") {
        ts.setAttribute("enabled", "false");
        button.value = "Start Animation";
    }
    else {
        ts.setAttribute("enabled", "true");
        button.value = "Stop Animation";
    }
	
	return false;
}


function setSunlight(on)
{
	var nav=document.getElementById('sunlight');
	nav.setAttribute('on',on?"TRUE":"FALSE");
	log("Sun "+on);
}

function viewFunc(evt)
{
    // show viewpoint values
    if (evt)
    {
    	var pos = evt.position;
    	var rot = evt.orientation;
		var mat = evt.matrix;
	
        var camPos = pos.x.toFixed(4)+' '+pos.y.toFixed(4)+' '+pos.z.toFixed(4);
        var camRot = rot[0].x.toFixed(4)+' '+rot[0].y.toFixed(4)+' '+rot[0].z.toFixed(4)+' '+rot[1].toFixed(4);
        log("Pos "+camPos);
        log("Rot "+camRot);
        document.getElementById("viewMat").innerHTML = "&ltViewpoint position='" + 
                                                        camPos + "' orientation='" + camRot + "'&gt";
    }
}

function send() {
    var requestUrl =
        "kam/?lat="+ $('#lat').val() +"&lng=" + $('#lng').val()+"&d=" + $('#d').val()+"&limit=" + $('#limit').val()+"&offset=" + $('#offset').val();
    log(requestUrl); 
    
//  $.ajax({
//    type: "GET",
//    url: requestUrl,
//    dataType: "json",
//    cache: false,
//    contentType: "application/json",
//    success: 
    	$.getJSON(requestUrl,
    	function(data) {

    	//log(data); 
        
        $('#results').html('<ul/>');
        $.each(data, function(i,kam){
           //log(kam);
           link=kam.image_link.replace('&', '&amp;');
           //The link supplied does not work for the texture it produces a format error
           //So had to redirect via local server
           //log("Link: "+link); // '+i+'
           el='<li><a target="kam" href="'+link+'">'+kam.id+ ' '+ new Date(kam.taken_utc).toUTCString()+' ('+kam.nadir.lat+', '+kam.nadir.lng +')</a></li>';
           //log("El: "+el);
           //<a href="#" onclick="setTexture(\'image'+i+'\',\'/kam/'+kam.itemId+'.jpg\');return false;">3d</a>
           
        	$('#results ul').append(el); 
        	
        	//addSphere($('#object').val(),kam.corner1.lat,kam.corner1.lng,'1 0 0');
        	//addSphere($('#object').val(),kam.corner2.lat,kam.corner2.lng,'0 1 0');
        	//addSphere($('#object').val(),kam.corner3.lat,kam.corner3.lng,'0 0 1');
        	//addSphere($('#object').val(),kam.corner4.lat,kam.corner4.lng,'1 1 0');
        	
        	
        	addNode($('#object').val(),kam.corner3,kam.corner2,kam.corner1,kam.corner4,'/kam/'+kam.itemId+'.jpg');
        	
        	//'<li><a target="kam" href="'+kam.image_page+'">'+kam.id+'</a></li>' OK
        	//  <a target="kam" href="'+kam.image_link+'">raw</a>
        });//end each
    	}//end function
        );//end getJson
        

         //initBinding();
//    },
//    error: function(xhr, status, error) {
//      alert(xhr.status);
//    }
// });
}

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
                       $('#results ul').append('<li><a href target="kam" src="' + kam.image_page + '">'+ kam.id + ' '+ kam.taken_utc +'</a></li>');
                    });
                    //$("#firstNumber").html(data.firstNumber);
                    //$("#secondNumber").html(data.secondNumber);
                    //$("#total").html(data.total);
                });
            }
            */
            
           // function parseDate()
            
           
            
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
            //This appears to be doing the opposite $("#headlight").attr('checked', false);
            //Not used $("#sunlightCheckbox").attr('checked', false);
            
            $("#headlight").change(function() {
                setHeadlight(this.checked);              
            });
            
            $("#sunlightCheckbox").change(function() {
                setSunlight(this.checked);              
            });
            
            $element =document.getElementById('x3d');
            runtime=$element.runtime;
    		updateAbInfo('Viewpoint');
    		
    		document.getElementById('front').addEventListener('viewpointChanged', viewFunc, false);
    		
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
    	
    	function toRadians(degrees)
    	{
    		return degrees*Math.PI/180;	
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
    	
    	function doClick(object,point)
    	{
    		var text=object+" click "+point;//+" "+Object.getOwnPropertyNames($element.runtime)
    		y=point[0];
    		z=point[1];
    		x=point[2];
    		log("click X "+x);
    		log("click Y "+y);
    		log("click Z "+z);
    		
    		r=Math.sqrt(x*x+y*y+z*z);
    		lat=toDegrees(Math.asin(z/r));
    		lng=toDegrees(Math.atan2(y,x));
    		
    		log("click Lat "+lat);
    		log("click Lng "+lng);
    		
    		$('#object').val(object);
    		$('#lat').val(lat);
    		$('#lng').val(lng);
    		
    		//addSphere(object,lat,lng,'1 1 1');
    		
    		
    		//alert("Moon click: x "+point.x + " y "+point.y+ " z "+point.z+ "  win "+$('#status'));
    		//$('#status').html(text);
    		
    		if (autosearch && object=='Moon') send();
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
	        	var t = document.getElementById(genId);
	        	//attempts to handle ampersand in url in the end redirect from local server
	        	//url=url.replace('&', '\u0026');
	        	log("Changing texture of "+appearanceId+" to "+url);
	        	if (t)
	        	{
	        		t.setAttribute("url", url);
	        	}
	        	else
	        	{
	        		t = document.createElement("ImageTexture");
	            	t.setAttribute("id", genId);
	            	t.setAttribute("url", url);
	            	//t.setAttribute("repeatS",false);
	            	//t.setAttribute("repeatT",false); 
	            	document.getElementById(appearanceId).appendChild(t);
	        	}
	        }
	        else {
	            var ot = document.getElementById(appearanceId);
	            ot.removeChild(document.getElementById(genId));
	        }
        }
        
        
        function addSphere(object,lat,lng,color)
        {
        	
        	kamRadius=object=='Moon'?moonRadius+0.004:earthRadius+0.01;
        	log("add Lat "+lat);
        	log("add Lng "+lng);
        	latRad=toRadians(lat);
        	lngRad=toRadians(lng);
        	
        	z = kamRadius * Math.cos(latRad) * Math.cos(lngRad)
        	x = kamRadius * Math.cos(latRad) * Math.sin(lngRad)
        	y = kamRadius * Math.sin(latRad)
        	
        	log("add X "+x);
        	log("add Y "+y);
        	log("add Z "+z);
    //s0 = Math.random() + 0.5;
    //s1 = Math.random() + 0.5;
    //s2 = Math.random() + 0.5;

            var t = document.createElement('Transform');
            t.setAttribute("translation", x + " " + y + " " + z );
            //t.setAttribute("scale", s0 + " " + s1 + " " + s2 );
            var s = document.createElement('Shape');

    // Appearance Node
    var app = document.createElement('Appearance');

    // Material Node
    var mat = document.createElement('Material');
    mat.setAttribute('emissiveColor',color);
    app.appendChild(mat);

    s.appendChild(app);

            t.appendChild(s);
            var b = document.createElement('Sphere');
            b.setAttribute('radius',0.002);
            
            s.appendChild(b);
            
            var ot = document.getElementById('kams'+object);
            ot.appendChild(t);
            
            return false;
        };
        
        function addNode(object,p1,p2,p3,p4,url)
        {
        	log(url);
        	kamRadius=object=='Moon'?moonRadius+0.002:earthRadius+0.01;
        	//log("add Lat "+lat);
        	//log("add Lng "+lng);
        	lat1Rad=toRadians(p1.lat);
        	lng1Rad=toRadians(p1.lng);        	
        	lat2Rad=toRadians(p2.lat);
        	lng2Rad=toRadians(p2.lng);
        	lat3Rad=toRadians(p3.lat);
        	lng3Rad=toRadians(p3.lng);
        	lat4Rad=toRadians(p4.lat);
        	lng4Rad=toRadians(p4.lng);
        	
        	z1 = kamRadius * Math.cos(lat1Rad) * Math.cos(lng1Rad);
        	x1 = kamRadius * Math.cos(lat1Rad) * Math.sin(lng1Rad);
        	y1 = kamRadius * Math.sin(lat1Rad);
        	
        	z2 = kamRadius * Math.cos(lat2Rad) * Math.cos(lng2Rad);
        	x2 = kamRadius * Math.cos(lat2Rad) * Math.sin(lng2Rad);
        	y2 = kamRadius * Math.sin(lat2Rad);
        	
        	z3 = kamRadius * Math.cos(lat3Rad) * Math.cos(lng3Rad);
        	x3 = kamRadius * Math.cos(lat3Rad) * Math.sin(lng3Rad);
        	y3 = kamRadius * Math.sin(lat3Rad);
        	
        	z4 = kamRadius * Math.cos(lat4Rad) * Math.cos(lng4Rad);
        	x4 = kamRadius * Math.cos(lat4Rad) * Math.sin(lng4Rad);
        	y4 = kamRadius * Math.sin(lat4Rad);
        	
        	
        	//log("add X "+x);
        	//log("add Y "+y);
        	//log("add Z "+z);
    //s0 = Math.random() + 0.5;
    //s1 = Math.random() + 0.5;
    //s2 = Math.random() + 0.5;
        	
        	/*
        	 *  <Shape>
                    <Appearance id="image<%=i%>">
                   
                     <Material diffuseColor='1 1 1'/>
                    </Appearance>
                  
				    <IndexedFaceSet coordIndex="0 1 2 3" texCoordIndex='0 1 2 3' onmouseover="testRectangle();">
				      <Coordinate point="-0.1 -0.1 0  0.1 -0.1 0  0.1 0.1 0  -0.1 0.1 0"/>
				      <TextureCoordinate point='0 0   1 0   1 1   0 1'/> 
				    </IndexedFaceSet>               
                  </Shape>    
        	 */

            var t = document.createElement('Transform');
            //t.setAttribute("translation", x + " " + y + " " + z );
            //t.setAttribute("scale", s0 + " " + s1 + " " + s2 );
            var s = document.createElement('Shape');

    // Appearance Node
    var app = document.createElement('Appearance');
    
    image = document.createElement("ImageTexture");
	//image.setAttribute("id", genId);
	image.setAttribute("url", url);
	app.appendChild(image);
    
	
    // Material Node
    var mat = document.createElement('Material');
    app.appendChild(mat);
    s.appendChild(app);
            t.appendChild(s);
            var f = document.createElement('IndexedFaceSet');
            f.setAttribute('coordIndex',"0 1 2 3");
            f.setAttribute('texCoordIndex',"0 1 2 3");
            
            var coord = document.createElement('Coordinate');
            coord.setAttribute('coordIndex',"0 1 2 3");
            coord.setAttribute('point',x1+' '+y1+' '+z1+' '+x2+' '+y2+' '+z2+' '+x3+' '+y3+' '+z3+' '+x4+' '+y4+' '+z4);
            
            
            var texCoord = document.createElement('TextureCoordinate');
            texCoord.setAttribute('point','0 0   1 0   1 1   0 1');
            
            f.appendChild(coord);
            f.appendChild(texCoord);
            
            s.appendChild(f);

            var ot = document.getElementById('kams'+object);
            ot.appendChild(t);
            
            return false;
        };
        
        
        function removeNode(object)
        {
            var ot = document.getElementById('kams'+object);
            for (var i = 0; i < ot.childNodes.length; i++) {
             // check if we have a real X3DOM Node; not just e.g. a Text-tag
             if (ot.childNodes[i].nodeType === Node.ELEMENT_NODE) {
             ot.removeChild(ot.childNodes[i]);
       break;
       }
       }
            
            return false;
        };