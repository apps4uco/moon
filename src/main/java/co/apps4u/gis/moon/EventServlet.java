package co.apps4u.gis.moon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.jetty.servlets.EventSource;
import org.eclipse.jetty.servlets.EventSourceServlet;
 
@WebServlet(urlPatterns = "/talk", initParams = { @WebInitParam(name = "heartBeatPeriod", value = "5") }, asyncSupported = true)
public class EventServlet extends EventSourceServlet {
 private static final long serialVersionUID = 1L;

  
 @Override
 protected EventSource newEventSource(final HttpServletRequest req) {
	 return Events.getInstance();
 }

@Override
public void init() throws ServletException {
	super.init();
}
}