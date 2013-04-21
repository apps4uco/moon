package co.apps4u.gis.moon;

import java.sql.SQLException;
import java.util.List;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import co.apps4u.gis.moon.dao.ImageDao;
import co.apps4u.gis.moon.domain.Image;

import com.sun.jersey.api.view.Viewable;

@Path("/kam/")
public class ImageResource {

	@GET
	@Produces("application/json")
	public List<Image> doGet(@QueryParam("lon") double longitude, @QueryParam("lat") double latitude, @QueryParam("d") @DefaultValue("10000") double distance,
			@QueryParam("limit") @DefaultValue("0") int limit,@QueryParam("offset") @DefaultValue("0") int offset
			) throws SQLException 
	{
		ImageDao dao=new ImageDao();
		List<Image> list=dao.queryImage(longitude, latitude, distance,limit,offset);
		return list;
	}
}
