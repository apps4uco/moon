<%@ page contentType="application/xhtml+xml; charset=UTF-8" language="java" import="static java.lang.Math.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta http-equiv="X-UA-Compatible" content="chrome=1" />
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>Moon</title>
        <link rel="stylesheet" type="text/css" href="/css/x3dom.css" />
        
        <link rel="stylesheet" type="//code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <style>
        
        html,body{height:100%;}
        
        #x3d {
    max-height: 100%;
    height: 100%;
	/* width: auto\9; IE7-8 need help adjusting responsive images */
	max-width: auto; 
	
	vertical-align: middle;
	border: 0;
    margin: 0 auto;
    position: relative;
/*  background:#000 url(http://www.x3dom.org/x3dom/example/texture/solarSystem/starsbg.png); */
}

#controls {
	float:left;
}

#X3dElementToggler {
    position: absolute;
    float: left;
    z-index: 1;
    top: 0px;
    left: 0px;
    height: 2em;
    border: none;
    background-color: #202021;
    color: #ccc;
}
#X3dElementToggler:hover {
    background-color:blue;
}

 #sliderContainer div { float:left; width: 200px; }
        #sliderContainer li { height: 25px; }
        #sliderContainer ul { clear: both; list-style-type: none; margin: 20px 0 10px 0; padding: 0; }
        </style>
	</head>
       <!--  data from http://nssdc.gsfc.nasa.gov/planetary/factsheet/moonfact.html 
       units 1000km -->
<body onload="init()">

  <!-- lock axis  this._rotMat = this._rotMat.mult(x3dom.fields.SFMatrix4f.translation(center)).mult(mat.inverse()).mult(my).mult(mat).mult(x3dom.fields.SFMatrix4f.translation(center.negate())); -->
	<div id="controls">
		
		<form>
		<div>
		<label for="lat">Latitude</label><input type="text" name="lat" id="lat"/>
		</div>
		<div>
		<label for="lng">Longitude</label><input type="text" name="lng" id="lng"/>
		</div>
		<input type="button" id="search" value="Search"/>
		</form>
		<div id="results">Results</div>
		<span id="status">Status</span>
		<span id="nav_mode_info">Nav mode</span>
		<span id="ab_info">View</span>
		<span id="speed">Speed</span>
		Position <span id="pos">Pos</span>
		<%-- 
		 <div id="sliderContainer">
            <ul>
                <li><label>Red</label><div id="redSlider" class="slider"></div></li>
                <li><label>Green</label><div id="greenSlider" class="slider"/></li>
                <li><label>Blue</label><div id="blueSlider" class="slider"/></li>
            </ul>
        </div>
        --%>
        <input type="button" value="Front" onclick="setView('front')"/>
        <input type="button" value="Back" onclick="setView('back')"/>
        <input type="button" value="Left" onclick="setView('left')"/>
        <input type="button" value="Right" onclick="setView('right')"/>
        <input type="button" value="North Pole" onclick="setView('north')"/>
        <input type="button" value="South Pole" onclick="setView('south')"/>
        
         <button id="prevView" class="button" onclick="$element.runtime.nextView();updateAbInfo('Viewpoint');updateInfo();return false;">&lt;&lt;</button>
     <button id="nextView" class="button" onclick="$element.runtime.nextView();updateAbInfo('Viewpoint');updateInfo();return false;">&gt;&gt;</button>
     <button id="decVel" class="button" onclick="incSpeed(-1);return false;">-</button>
     <button id="incVel" class="button" onclick="incSpeed(1);return false;">+</button>
	</div>
	    <!-- Use the same "x", "y", "width" and "height" attributes as SVG.
             Optionally support the "viewBox" and "preserveAspectRatio" just like SVG    x="0px" y="0px" width="800px" height="600px"  -->
		<X3D xmlns="http://www.web3d.org/specifications/x3d-namespace" showLog="false" dashboard="true" id="x3d" 
		 onmousedown="start(event);" onmouseup="stop(event);" onmousemove="move(event);"
		>
	
	<!-- 	 <param name="PrimitiveQuality" value="High"></param>
		<param name="showStat" value="false" ></param>
    <param name="showLog" value="false" ></param>
    <param name="showProgress" value="bar" ></param>
    <param name="disableDoubleClick" value="true" ></param>
     -->
    <button id="X3dElementToggler"  class="button"></button>
    
     
<Scene>
<WorldInfo info='"Moon Explorer"' title='Moon'/>
<NavigationInfo speed="1" type="&#34;FLY&#34; &#34;ANY&#34;" headlight='false'/>
<Background skyColor='0 0 0'/>
<Viewpoint id="front" description='Front' orientation='0 1 0 3.14159' position='0 0 -5'/>
<Viewpoint id="back" description='Back' orientation='0 1 0 <%=toRadians(0) %>' position='0 0 5'/>
<Viewpoint id="right" description='Right' orientation='0 1 0 <%=toRadians(270) %>' position='-5 0 0'/>
<Viewpoint id="left" description='Left' orientation='0 1 0 <%=toRadians(90) %>' position='5 0 0'/>
<Viewpoint id="north" description='North Pole' orientation='0 1 0 3.14159' position='0 5 -0'/>
<Viewpoint id="south" description='South Pole' orientation='0 1 0 3.14159' position='0 -5 0'/>

<!-- OrbitalTimeInterval ROUTE:  [from fraction_changed to SpinThoseThings.set_fraction ] -->
<TimeSensor DEF='OrbitalTimeInterval' cycleInterval='20.0' loop='true'/>
<!-- SpinThoseThings ROUTEs:  [from OrbitalTimeInterval.fraction_changed to set_fraction ] [from value_changed to EarthCoordinateSystem.rotation ] -->
<OrientationInterpolator DEF='SpinThoseThings' key='0.00 0.25 0.50 0.75 1.00' keyValue='0 1 0 0 0 1 0 1.57079 0 1 0 3.14159 0 1 0 4.7123889 0 1 0 6.2831852'/>
<ROUTE fromNode='OrbitalTimeInterval' fromField='fraction_changed' toNode='SpinThoseThings' toField='set_fraction'/>
<!-- EarthCoordinateSystem ROUTE:  [from SpinThoseThings.value_changed to rotation ] -->
<DirectionalLight on='TRUE' intensity='1' ambientIntensity='0.1' color='1 1 1' direction='-1 0 1' />


<!-- Star Background - Image from http://maps.jpl.nasa.gov/stars.html -->
<!-- 
<Transform DEF='Stars' rotation='1 0 0 .3' scale='100 100 100' translation='0 0 0'>
<Shape>
<Appearance>
<ImageTexture url='/image/tycho2.jpeg'/> 
</Appearance>
<Sphere/>
</Shape>
</Transform>
 -->
<Transform DEF='EarthCoordinateSystem'>
<Group DEF='MiniWorld'>
<Shape>
<Appearance>
<Material DEF="MOONMATERIAL" diffuseColor='0.5 0.5 0.5'/>
<ImageTexture url='/image/MoonMap_2500x1250.jpg'/>

</Appearance>

<Sphere DEF="MOON" radius="1.738" onclick="moonClick(event.hitPnt);"/>
</Shape>

<% double moonRad=1.738;
double rad=moonRad+0.002;
int n=8;
%>
<%--
<Shape>
<PointSet>
                    <Coordinate point='<% for (int i=0;i<n;i++){ 
	double ang=toRadians(360*i/n); %><%=rad*cos(ang)%> 0 <%=rad*sin(ang)%> <%}%>'/>
                    <Color color='<%for (int i=0;i<n;i++){%>1 0 0 <%}%>'/>
                </PointSet>
                </Shape>
                --%>
                 
<%-- 
<%for (int i=0;i<n;i++){ 
	double ang=toRadians(360*i/n); %>
<Transform rotation='0 0 1 <%=toRadians(-ang)%>' translation="<%=rad*cos(ang)%> 0 <%=rad*sin(ang)%>">
                  <Shape>
                    <Appearance>
                      <Material  emissiveColor='1 1 0'/>                      
                    </Appearance>
                   <Rectangle2D id="testRectangle<%=n%>" size='0.1 0.1' subdivision='1 1' solid='TRUE' onmouseover="testRectangle();"></Rectangle2D>
                                
                  </Shape>
                </Transform>
<% } %>             
--%>   

<%for (int i=0;i<n;i++){ 
	double ang=toRadians(360*i/n); 
	double rotAng=toRadians(90)-ang; 
	
	%>
<Transform rotation='0 1 0 <%=rotAng%>' translation="<%=rad*cos(ang)%> 0 <%=rad*sin(ang)%>">
                  <Shape>
                    <Appearance id="image<%=i%>">
                      <Material  emissiveColor='1 1 0'/>                      
                    </Appearance>
                  
				    <IndexedFaceSet coordIndex="0 1 2 3" onmouseover="testRectangle();">
				      <Coordinate point="-0.1 -0.1 0  0.1 -0.1 0  0.1 0.1 0  -0.1 0.1 0"/>
				    </IndexedFaceSet>               
                  </Shape>               
                </Transform>
<% } %>     

                <!-- rotation='1 1 0 <%=toRadians(90) %>'
                  <Sphere radius=".1"/> 
                   
                   <Rectangle2D id="testRectangle" size='2 2' subdivision='1 1' solid='TRUE' onmouseover="testRectangle();"></Rectangle2D>
                    -->
</Group>

<Transform DEF='SimpleGeoStationarySatellite' rotation='1 0 0 .3' translation='<%= 378*sin(toRadians(30)) %> 0 <%= 378*cos(toRadians(30)) %>'>
<Shape>
<Appearance>
<!-- <Material diffuseColor='0.9 0.1 0.1'/> -->
<Material diffuseColor='0 0 1'/>
<ImageTexture url='/image/land_ocean_ice_2048.jpg'/>
</Appearance>
<Sphere DEF="EARTH" radius="6.378"/>
</Shape>
</Transform>
</Transform>

<!-- wikipedia
<Transform DEF='sun' translation="149600 0 0">
                  <Shape>
                    <Appearance>
                      <Material diffuseColor='0.8 0.8 0.2' specularColor='0 0 0.5'/>                    
                    </Appearance>
                    <Sphere radius="1392"/>
                  </Shape>
                </Transform>
 -->
<!-- 
<ROUTE fromNode='SpinThoseThings' fromField='value_changed' toNode='EarthCoordinateSystem' toField='rotation'/>
 -->
</Scene> 
</X3D>
	
	<script type="text/javascript" src="/js/x3dom-full.js"></script>
	<script type="text/javascript" src="/js/x3domExtra.js"></script>
	
	<!-- Load jquery from CDN -->
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<script type="text/javascript" src="//code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script type="text/javascript" src="/js/x3dUtil.js"></script>
</body>
</html>