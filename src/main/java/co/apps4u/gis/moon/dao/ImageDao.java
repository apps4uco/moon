package co.apps4u.gis.moon.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

import co.apps4u.gis.moon.EarthMoonGeom;
import co.apps4u.gis.moon.domain.Image;

public class ImageDao {
	public static void main(String[] args) throws SQLException, IOException {
		
		ImageDao dao=new ImageDao();
		
//		String sql = DbHandler.getSql("countImage");
//		long n = runner.query(sql, new ScalarHandler<Long>());
//		System.out.println(n);
//
//		sql = DbHandler.getSql("countImageBetween");
//		n = runner.query(sql, new ScalarHandler<Long>(), new Timestamp(0),
//				new Timestamp(new Date().getTime()));
//		System.out.println(n);
//
//		sql = "select count(*)  from image where st_dwithin(nadir,ST_GeogFromText('SRID=4326;POINT(0 0)'),100000);";
//		n = runner.query(sql, new ScalarHandler<Long>());
//		System.out.println(n);

		Double longitude = null;
		Double latitude = null;
		double dist = 10000;
		double earthDist = EarthMoonGeom.toEarth(dist);
		
		// List<Object[]> list = runner.query(sql,new ArrayListHandler());
		// for (Object []row:list)
		// {
		// for (int i=0;i<row.length;i++)
		// {
		// Object o=row[i];
		// if (o instanceof PGobject)
		// {
		// PGobject pgO=(PGobject) o;
		// System.out.println("Type "+pgO.getType());
		// System.out.println("Value "+pgO.getValue().getClass());
		// PGgeometry geo=new PGgeometry(pgO.getValue());
		// System.out.println(geo);
		// }
		// System.out.printf("%s (%s)%n",o,o!=null?o.getClass():null);
		// }
		// System.out.println();
		// }
		DateTimeFormatter fmt = ISODateTimeFormat.dateTime();
		
		DateTime start=new DateTime(2012,4,18,0,0,0);
		start=fmt.parseDateTime("2012-03-10T02:00:00.00Z");
		DateTime end=new DateTime(2012,6,13,0,0,0);//fmt.parseDateTime("20121018");
		
		List<Image> list=dao.queryImage(longitude, latitude, earthDist,start,end,10,0);
		for (Image image : list) {
			System.out.println(image);
		}
		
		long count=dao.countImage(longitude, latitude, earthDist,start,end,0,0);
		
		System.out.printf("Results %d of %d%n",list.size(),count);
	}
	
	public ImageDao(){
		
	}
	
	public QueryRunner getRunner() throws SQLException
	{
		DataSource dataSource = DbHandler.getDataSource();
		QueryRunner runner = new QueryRunner(dataSource);
		return runner;
	}

	public List<Image> queryImage(Double longitude, Double latitude, Double dist,DateTime start, DateTime end, int limit,int offset) throws SQLException {
		QueryRunner runner=getRunner();
		double earthDist = EarthMoonGeom.toEarth(dist);
		
		//TODO This looks safe from sql injection as the parameters have already been converted to dates or numbers but it should be checked to make sure there is no possibility of sql injection
		String sql = "select *";
		String sqlOrder=" order by";
		
		sql+=" from image where camera_dir='nadir'";
		if (latitude!=null && longitude!=null)
		{
			sql+= String
				.format(" and st_dwithin(nadir,ST_GeogFromText('SRID=4326;POINT(%f %f)'),%f)",
						longitude, latitude, earthDist);
		
			sqlOrder+= String
				.format(" st_distance(nadir,ST_GeogFromText('SRID=4326;POINT(%f %f)')) ,",longitude, latitude);
		}
		
		sqlOrder+=" taken_utc";
		
		List<Object> params=new ArrayList<Object>();
		if (start!=null)
		{
			sql+=" and taken_utc>= ?";
			params.add(new Timestamp(start.getMillis()));
		}
		
		if (end!=null)
		{
			sql+=" and taken_utc<= ?";
			params.add(new Timestamp(end.getMillis()));
		}
		
		sql+=sqlOrder;
		
		if (limit!=0)
		{
			sql+=" LIMIT "+limit;
		}
		if (offset!=0)
		{
			sql+=" OFFSET "+offset;
		}

		System.out.println(sql);
		List<Image> list = runner.query(sql, new BeanListHandler<Image>(
				Image.class, new BasicRowProcessor(
						new DbHandler.ModelProcessor())),params.toArray());
		
		return list;
	}
	
	//TODO this is a quick hack (copy paste of above code) it should be refactored
	public long countImage(Double longitude, Double latitude, Double dist,DateTime start, DateTime end, int limit,int offset) throws SQLException {
		QueryRunner runner=getRunner();
		double earthDist = EarthMoonGeom.toEarth(dist);
		
		//TODO This looks safe from sql injection as the parameters have already been converted to dates or numbers but it should be checked to make sure there is no possibility of sql injection
		String sql = "select count(*)";
		String sqlOrder=" order by";
		
		sql+=" from image where camera_dir='nadir' and corner1 is not null and corner2 is not null and corner3 is not null and corner4 is not null ";
		if (latitude!=null && longitude!=null)
		{
			sql+= String
				.format(" and st_dwithin(nadir,ST_GeogFromText('SRID=4326;POINT(%f %f)'),%f)",
						longitude, latitude, earthDist);
		
			sqlOrder+= String
				.format(" st_distance(nadir,ST_GeogFromText('SRID=4326;POINT(%f %f)')) ,",longitude, latitude);
		}
		
		sqlOrder+=" taken_utc";
		
		List<Object> params=new ArrayList<Object>();
		if (start!=null)
		{
			sql+=" and taken_utc>= ?";
			params.add(new Timestamp(start.getMillis()));
		}
		
		if (end!=null)
		{
			sql+=" and taken_utc<= ?";
			params.add(new Timestamp(end.getMillis()));
		}
		
		//no point ordering sql+=sqlOrder;

		System.out.println(sql);
		long count = runner.query(sql, new ScalarHandler<Long>(),params.toArray());
		
		return count;
	}
	
	public Date[] getTimeRange() throws SQLException
	{
		QueryRunner runner=getRunner();
		String sql="select min(taken_utc), max(taken_utc) from image where taken_utc is not null";
		Object[] row = runner.query(sql,new ArrayHandler());
		Date[] dates=new Date[2];
		if (row!=null)
		{
			dates[0]=(Date)row[0];
			dates[1]=(Date)row[1];
		}
		return dates;
	}
}
