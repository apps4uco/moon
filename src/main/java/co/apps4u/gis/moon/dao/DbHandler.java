package co.apps4u.gis.moon.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.vecmath.Matrix4d;
import javax.vecmath.Vector3d;

import org.apache.commons.dbutils.BeanProcessor;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryLoader;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.joda.time.DateTime;
import org.postgis.PGgeometry;
import org.postgis.jts.JtsGeometry;
import org.postgresql.util.PGobject;

import com.vividsolutions.jts.geom.Geometry;

public class DbHandler {
	
	private static String url;
	private static DataSource dataSource;
	private static QueryLoader queryLoader;
	private static Map<String, String> map;
	
	static {
		String driverClass;
		
		//DbUtils.loadDriver(driverClass);
		Properties properties;
		
		File file=new File("jdbc.properties");
		InputStream in;
		try {
			in = new FileInputStream(file);
			properties=new Properties();
			properties.load(in);
			
			System.out.println(properties);
			
			driverClass=properties.getProperty("driverClass").trim();
			url=properties.getProperty("url").trim();
						
			//DbUtils.loadDriver(driverClass);
			dataSource=new DataSource();
			dataSource.setDriverClassName(driverClass);
			dataSource.setDbProperties(properties);
			dataSource.setUrl(url);
			
			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		queryLoader=QueryLoader.instance();
	}
	
	public static DataSource getDataSource() throws SQLException
	{
		
		return dataSource;
	}
	
	public static String getSql(String name) throws IOException
	{
		if (map==null)
		{
			map=queryLoader.load("/co/apps4u/moon/sql.properties");
		}
		return map.get(name);
	}
	
	public static class ModelProcessor extends BeanProcessor{
		
		private static Map<String, String> map;
		
		static
		{
			map=new HashMap<String, String>();
			//map.put("car","carTransform");
			//map.put("triangle_id","id");
		}
		
		public ModelProcessor()
		{
			super(map);
		}
		
		@Override
		protected Object processColumn(ResultSet rs, int index,
				Class<?> propType) throws SQLException {
			Object object=rs.getObject(index);
			if (object instanceof Timestamp)
			{
				long time=((Timestamp)object).getTime();
				object=new DateTime(time);
			}
			else if (object instanceof Array)
			{
				Array array=(Array)object;
				Object objectArray = array.getArray();
				if (propType.equals(Vector3d.class))
				{
					if (objectArray instanceof Number[])
					{
						Number[]doubleArray=(Number [])objectArray;
						object=new Vector3d(doubleArray[0].doubleValue(),doubleArray[1].doubleValue(),doubleArray[2].doubleValue());
					}
					else
					{
						object=objectArray;
					}
				}
				else if (propType.equals(Matrix4d.class))
				{
					if (objectArray instanceof Number[])
					{
						Number[]doubleArray=(Number [])objectArray;
						
						double primitiveArray[]=new double[doubleArray.length];
						for (int i=0;i<doubleArray.length;i++)
						{
							primitiveArray[i]=doubleArray[i].doubleValue();
						}
						Matrix4d matrix = new Matrix4d(primitiveArray);
						//doubleArray[0].doubleValue(),doubleArray[1].doubleValue(),doubleArray[2].doubleValue());
						object=matrix;
					}
				}
				else
				{
					object=objectArray;
				}
			}
			else if (object instanceof JtsGeometry)
			{
				JtsGeometry jtsGeometry=(JtsGeometry)object;
				Geometry geometry = jtsGeometry.getGeometry();
				object=geometry;
			}
			else if (object instanceof PGobject)
			{
				PGobject pgO=(PGobject) object;
				PGgeometry geo=new PGgeometry(pgO.getValue());
				org.postgis.Geometry point = geo.getGeometry();
				object=point;
			}
			return object;
		}
	}
}
