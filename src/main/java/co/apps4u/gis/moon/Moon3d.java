package co.apps4u.gis.moon;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

import com.sun.jersey.api.view.Viewable;

@Path("/moon.xhtml")
public class Moon3d {

	@GET
	public Viewable doGet() 
	{
		return new Viewable("/moon3d.jsp","Hello World");
	}
}
