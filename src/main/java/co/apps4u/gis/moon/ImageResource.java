package co.apps4u.gis.moon;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.eclipse.jetty.util.log.Log;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

import co.apps4u.gis.moon.dao.ImageDao;
import co.apps4u.gis.moon.domain.Image;

@Path("/kam/")
public class ImageResource {

	private static final DateTimeFormatter fmt = ISODateTimeFormat.dateTime();

	public DateTime parse(String text) {
		DateTime date = text != null ? fmt.parseDateTime(text) : null;
		return date;
	}

	@GET
	@Produces("application/json")
	public List<Image> doGet(@QueryParam("lng") Double longitude,
			@QueryParam("lat") Double latitude,
			@QueryParam("d") @DefaultValue("10000") Double distance,
			@QueryParam("start") String startText,
			@QueryParam("end") String endText,
			@QueryParam("limit") @DefaultValue("10") int limit,
			@QueryParam("offset") @DefaultValue("0") int offset)
			throws SQLException {
		ImageDao dao = new ImageDao();

		DateTime start = parse(startText);
		DateTime end = parse(endText);
		List<Image> list = dao.queryImage(longitude, latitude, distance, start,
				end, limit, offset);
		return list;
	}

	@GET
	@Path("{itemId}.jpg")
	@Produces("image/jpeg")
	public byte[] doGet(@PathParam("itemId") int itemId) throws IOException,
			URISyntaxException {
		byte[] imageData = null;
		try
		{
		
		String urlText = "http://images.moonkam.ucsd.edu/main.php?g2_view=core.DownloadItem&g2_itemId="
				+ itemId;
		//urlText="http://eoimages.gsfc.nasa.gov/images/imagerecords/57000/57730/land_ocean_ice_2048.jpg";
		URI uri = new URI(urlText);
		URL url = uri.toURL();

		//InputStream in=url.openStream();
		
		BufferedImage image = ImageIO.read(url);
		

		ByteArrayOutputStream output = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", output);
		output.close();
		imageData = output.toByteArray();
		Log.getLog().info("Image Out "+image+" bytes "+imageData.length);
		
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			
		}
		return imageData;
	}
}
