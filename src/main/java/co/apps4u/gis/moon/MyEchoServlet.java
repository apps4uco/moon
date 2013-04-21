package co.apps4u.gis.moon;

import org.eclipse.jetty.websocket.servlet.WebSocketServlet;
import org.eclipse.jetty.websocket.servlet.WebSocketServletFactory;

public class MyEchoServlet extends WebSocketServlet
 {
     @Override
     public void configure(WebSocketServletFactory factory)
     {
         // set a 10 second idle timeout
         factory.getPolicy().setIdleTimeout(10000);
         // register my socket
         factory.register(EchoBean.class);
     }
 }