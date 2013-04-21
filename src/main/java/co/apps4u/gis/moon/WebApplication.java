package co.apps4u.gis.moon;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.core.Application;

public class WebApplication extends Application
{
	static Set<Class<?>> s;

	static
	{
		s = new HashSet<Class<?>>();
		s.add(Moon3d.class);
		s.add(ImageResource.class);
		//s.add(SumRestEndpoint.class);
		
		
//		s.add(co.apps4u.i2u.geoIp.GeoIp.class);	
//		s.add(co.apps4u.i2u.StartupListener.class);	
//		s.add(co.apps4u.i2u.LoginResource.class);	
//		s.add(co.apps4u.i2u.MemberResource.class);	
//		
//		if (true)
//		{
//			s.add(co.apps4u.i2u.resources.Resource.class);
//			s.add(co.apps4u.i2u.resources.RootResource.class);
//			//s.add(co.apps4u.i2u.resources.LeafResource.class);	
//			//s.add(co.apps4u.i2u.resources.KindResource.class);	
//		}
//		
//		
//		s.add(EntityWriter.class);
//		s.add(ListEntityWriter.class);
//		s.add(ListJsonWriter.class);
//		s.add(UriHandler.class);
//		s.add(RequestFilter.class);
//		s.add(PostReplaceFilter.class);
//		// s.add(NotFoundHandler.class);
//		// s.add(ExceptionHandler.class);
	}

	@Override
	public Set<Class<?>> getClasses()
	{
		return s;
	}
}
