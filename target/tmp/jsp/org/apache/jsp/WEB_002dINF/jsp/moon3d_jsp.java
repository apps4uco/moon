package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import static java.lang.Math.*;

public final class moon3d_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("application/xhtml+xml; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n");
      out.write("        \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("\t<head>\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"chrome=1\" />\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />\n");
      out.write("\t\t<title>Moon</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/x3dom.css\" />\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" type=\"//code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css\" />\n");
      out.write("        <style>\n");
      out.write("        \n");
      out.write("        html,body{height:100%;}\n");
      out.write("        \n");
      out.write("        #x3d {\n");
      out.write("    max-height: 100%;\n");
      out.write("    height: 100%;\n");
      out.write("\t/* width: auto\\9; IE7-8 need help adjusting responsive images */\n");
      out.write("\tmax-width: auto; \n");
      out.write("\t\n");
      out.write("\tvertical-align: middle;\n");
      out.write("\tborder: 0;\n");
      out.write("    margin: 0 auto;\n");
      out.write("    position: relative;\n");
      out.write("/*  background:#000 url(http://www.x3dom.org/x3dom/example/texture/solarSystem/starsbg.png); */\n");
      out.write("}\n");
      out.write("\n");
      out.write("#controls {\n");
      out.write("\tfloat:left;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#X3dElementToggler {\n");
      out.write("    position: absolute;\n");
      out.write("    float: left;\n");
      out.write("    z-index: 1;\n");
      out.write("    top: 0px;\n");
      out.write("    left: 0px;\n");
      out.write("    height: 2em;\n");
      out.write("    border: none;\n");
      out.write("    background-color: #202021;\n");
      out.write("    color: #ccc;\n");
      out.write("}\n");
      out.write("#X3dElementToggler:hover {\n");
      out.write("    background-color:blue;\n");
      out.write("}\n");
      out.write("\n");
      out.write(" #sliderContainer div { float:left; width: 200px; }\n");
      out.write("        #sliderContainer li { height: 25px; }\n");
      out.write("        #sliderContainer ul { clear: both; list-style-type: none; margin: 20px 0 10px 0; padding: 0; }\n");
      out.write("        </style>\n");
      out.write("\t</head>\n");
      out.write("       <!--  data from http://nssdc.gsfc.nasa.gov/planetary/factsheet/moonfact.html \n");
      out.write("       units 1000km -->\n");
      out.write("<body onload=\"init()\">\n");
      out.write("\n");
      out.write("  <!-- lock axis  this._rotMat = this._rotMat.mult(x3dom.fields.SFMatrix4f.translation(center)).mult(mat.inverse()).mult(my).mult(mat).mult(x3dom.fields.SFMatrix4f.translation(center.negate())); -->\n");
      out.write("\t<div id=\"controls\">\n");
      out.write("\t\t\n");
      out.write("\t\t<form>\n");
      out.write("\t\t<div>\n");
      out.write("\t\t<label for=\"lat\">Latitude</label><input type=\"text\" name=\"lat\" id=\"lat\"/>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div>\n");
      out.write("\t\t<label for=\"lng\">Longitude</label><input type=\"text\" name=\"lng\" id=\"lng\"/>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<input type=\"button\" id=\"search\" value=\"Search\"/>\n");
      out.write("\t\t</form>\n");
      out.write("\t\t<div id=\"results\">Results</div>\n");
      out.write("\t\t<span id=\"status\">Status</span>\n");
      out.write("\t\t<span id=\"nav_mode_info\">Nav mode</span>\n");
      out.write("\t\t<span id=\"ab_info\">View</span>\n");
      out.write("\t\t<span id=\"speed\">Speed</span>\n");
      out.write("\t\tPosition <span id=\"pos\">Pos</span>\n");
      out.write("\t\t");
      out.write("\n");
      out.write("        <input type=\"button\" value=\"Front\" onclick=\"setView('front')\"/>\n");
      out.write("        <input type=\"button\" value=\"Back\" onclick=\"setView('back')\"/>\n");
      out.write("        <input type=\"button\" value=\"Left\" onclick=\"setView('left')\"/>\n");
      out.write("        <input type=\"button\" value=\"Right\" onclick=\"setView('right')\"/>\n");
      out.write("        <input type=\"button\" value=\"North Pole\" onclick=\"setView('north')\"/>\n");
      out.write("        <input type=\"button\" value=\"South Pole\" onclick=\"setView('south')\"/>\n");
      out.write("        \n");
      out.write("         <button id=\"prevView\" class=\"button\" onclick=\"$element.runtime.nextView();updateAbInfo('Viewpoint');updateInfo();return false;\">&lt;&lt;</button>\n");
      out.write("     <button id=\"nextView\" class=\"button\" onclick=\"$element.runtime.nextView();updateAbInfo('Viewpoint');updateInfo();return false;\">&gt;&gt;</button>\n");
      out.write("     <button id=\"decVel\" class=\"button\" onclick=\"incSpeed(-1);return false;\">-</button>\n");
      out.write("     <button id=\"incVel\" class=\"button\" onclick=\"incSpeed(1);return false;\">+</button>\n");
      out.write("\t</div>\n");
      out.write("\t    <!-- Use the same \"x\", \"y\", \"width\" and \"height\" attributes as SVG.\n");
      out.write("             Optionally support the \"viewBox\" and \"preserveAspectRatio\" just like SVG    x=\"0px\" y=\"0px\" width=\"800px\" height=\"600px\"  -->\n");
      out.write("\t\t<X3D xmlns=\"http://www.web3d.org/specifications/x3d-namespace\" showLog=\"false\" dashboard=\"true\" id=\"x3d\" \n");
      out.write("\t\t onmousedown=\"start(event);\" onmouseup=\"stop(event);\" onmousemove=\"move(event);\"\n");
      out.write("\t\t>\n");
      out.write("\t\n");
      out.write("\t<!-- \t <param name=\"PrimitiveQuality\" value=\"High\"></param>\n");
      out.write("\t\t<param name=\"showStat\" value=\"false\" ></param>\n");
      out.write("    <param name=\"showLog\" value=\"false\" ></param>\n");
      out.write("    <param name=\"showProgress\" value=\"bar\" ></param>\n");
      out.write("    <param name=\"disableDoubleClick\" value=\"true\" ></param>\n");
      out.write("     -->\n");
      out.write("    <button id=\"X3dElementToggler\"  class=\"button\"></button>\n");
      out.write("    \n");
      out.write("     \n");
      out.write("<Scene>\n");
      out.write("<WorldInfo info='\"Moon Explorer\"' title='Moon'/>\n");
      out.write("<NavigationInfo speed=\"1\" type=\"&#34;FLY&#34; &#34;ANY&#34;\" headlight='false'/>\n");
      out.write("<Background skyColor='0 0 0'/>\n");
      out.write("<Viewpoint id=\"front\" description='Front' orientation='0 1 0 3.14159' position='0 0 -5'/>\n");
      out.write("<Viewpoint id=\"back\" description='Back' orientation='0 1 0 ");
      out.print(toRadians(0) );
      out.write("' position='0 0 5'/>\n");
      out.write("<Viewpoint id=\"right\" description='Right' orientation='0 1 0 ");
      out.print(toRadians(270) );
      out.write("' position='-5 0 0'/>\n");
      out.write("<Viewpoint id=\"left\" description='Left' orientation='0 1 0 ");
      out.print(toRadians(90) );
      out.write("' position='5 0 0'/>\n");
      out.write("<Viewpoint id=\"north\" description='North Pole' orientation='0 1 0 3.14159' position='0 5 -0'/>\n");
      out.write("<Viewpoint id=\"south\" description='South Pole' orientation='0 1 0 3.14159' position='0 -5 0'/>\n");
      out.write("\n");
      out.write("<!-- OrbitalTimeInterval ROUTE:  [from fraction_changed to SpinThoseThings.set_fraction ] -->\n");
      out.write("<TimeSensor DEF='OrbitalTimeInterval' cycleInterval='20.0' loop='true'/>\n");
      out.write("<!-- SpinThoseThings ROUTEs:  [from OrbitalTimeInterval.fraction_changed to set_fraction ] [from value_changed to EarthCoordinateSystem.rotation ] -->\n");
      out.write("<OrientationInterpolator DEF='SpinThoseThings' key='0.00 0.25 0.50 0.75 1.00' keyValue='0 1 0 0 0 1 0 1.57079 0 1 0 3.14159 0 1 0 4.7123889 0 1 0 6.2831852'/>\n");
      out.write("<ROUTE fromNode='OrbitalTimeInterval' fromField='fraction_changed' toNode='SpinThoseThings' toField='set_fraction'/>\n");
      out.write("<!-- EarthCoordinateSystem ROUTE:  [from SpinThoseThings.value_changed to rotation ] -->\n");
      out.write("<DirectionalLight on='TRUE' intensity='1' ambientIntensity='0.1' color='1 1 1' direction='-1 0 1' />\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Star Background - Image from http://maps.jpl.nasa.gov/stars.html -->\n");
      out.write("<!-- \n");
      out.write("<Transform DEF='Stars' rotation='1 0 0 .3' scale='100 100 100' translation='0 0 0'>\n");
      out.write("<Shape>\n");
      out.write("<Appearance>\n");
      out.write("<ImageTexture url='/image/tycho2.jpeg'/> \n");
      out.write("</Appearance>\n");
      out.write("<Sphere/>\n");
      out.write("</Shape>\n");
      out.write("</Transform>\n");
      out.write(" -->\n");
      out.write("<Transform DEF='EarthCoordinateSystem'>\n");
      out.write("<Group DEF='MiniWorld'>\n");
      out.write("<Shape>\n");
      out.write("<Appearance>\n");
      out.write("<Material DEF=\"MOONMATERIAL\" diffuseColor='0.5 0.5 0.5'/>\n");
      out.write("<ImageTexture url='/image/MoonMap_2500x1250.jpg'/>\n");
      out.write("\n");
      out.write("</Appearance>\n");
      out.write("\n");
      out.write("<Sphere DEF=\"MOON\" radius=\"1.738\" onclick=\"moonClick(event.hitPnt);\"/>\n");
      out.write("</Shape>\n");
      out.write("\n");
 double moonRad=1.738;
double rad=moonRad+0.002;
int n=8;

      out.write('\n');
      out.write("\n");
      out.write("                 \n");
      out.write("   \n");
      out.write("\n");
for (int i=0;i<n;i++){ 
	double ang=toRadians(360*i/n); 
	double rotAng=toRadians(90)-ang; 
	
	
      out.write("\n");
      out.write("<Transform rotation='0 1 0 ");
      out.print(rotAng);
      out.write("' translation=\"");
      out.print(rad*cos(ang));
      out.write(" 0 ");
      out.print(rad*sin(ang));
      out.write("\">\n");
      out.write("                  <Shape>\n");
      out.write("                    <Appearance id=\"image");
      out.print(i);
      out.write("\">\n");
      out.write("                      <Material  emissiveColor='1 1 0'/>                      \n");
      out.write("                    </Appearance>\n");
      out.write("                  \n");
      out.write("\t\t\t\t    <IndexedFaceSet coordIndex=\"0 1 2 3\" onmouseover=\"testRectangle();\">\n");
      out.write("\t\t\t\t      <Coordinate point=\"-0.1 -0.1 0  0.1 -0.1 0  0.1 0.1 0  -0.1 0.1 0\"/>\n");
      out.write("\t\t\t\t    </IndexedFaceSet>               \n");
      out.write("                  </Shape>               \n");
      out.write("                </Transform>\n");
 } 
      out.write("     \n");
      out.write("\n");
      out.write("                <!-- rotation='1 1 0 ");
      out.print(toRadians(90) );
      out.write("'\n");
      out.write("                  <Sphere radius=\".1\"/> \n");
      out.write("                   \n");
      out.write("                   <Rectangle2D id=\"testRectangle\" size='2 2' subdivision='1 1' solid='TRUE' onmouseover=\"testRectangle();\"></Rectangle2D>\n");
      out.write("                    -->\n");
      out.write("</Group>\n");
      out.write("\n");
      out.write("<Transform DEF='SimpleGeoStationarySatellite' rotation='1 0 0 .3' translation='");
      out.print( 378*sin(toRadians(30)) );
      out.write(" 0 ");
      out.print( 378*cos(toRadians(30)) );
      out.write("'>\n");
      out.write("<Shape>\n");
      out.write("<Appearance>\n");
      out.write("<!-- <Material diffuseColor='0.9 0.1 0.1'/> -->\n");
      out.write("<Material diffuseColor='0 0 1'/>\n");
      out.write("<ImageTexture url='/image/land_ocean_ice_2048.jpg'/>\n");
      out.write("</Appearance>\n");
      out.write("<Sphere DEF=\"EARTH\" radius=\"6.378\"/>\n");
      out.write("</Shape>\n");
      out.write("</Transform>\n");
      out.write("</Transform>\n");
      out.write("\n");
      out.write("<!-- wikipedia\n");
      out.write("<Transform DEF='sun' translation=\"149600 0 0\">\n");
      out.write("                  <Shape>\n");
      out.write("                    <Appearance>\n");
      out.write("                      <Material diffuseColor='0.8 0.8 0.2' specularColor='0 0 0.5'/>                    \n");
      out.write("                    </Appearance>\n");
      out.write("                    <Sphere radius=\"1392\"/>\n");
      out.write("                  </Shape>\n");
      out.write("                </Transform>\n");
      out.write(" -->\n");
      out.write("<!-- \n");
      out.write("<ROUTE fromNode='SpinThoseThings' fromField='value_changed' toNode='EarthCoordinateSystem' toField='rotation'/>\n");
      out.write(" -->\n");
      out.write("</Scene> \n");
      out.write("</X3D>\n");
      out.write("\t\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/x3dom-full.js\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/x3domExtra.js\"></script>\n");
      out.write("\t\n");
      out.write("\t<!-- Load jquery from CDN -->\n");
      out.write("\t<script type=\"text/javascript\" src=\"//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("\t<script type=\"text/javascript\" src=\"//code.jquery.com/ui/1.10.2/jquery-ui.js\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/x3dUtil.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
