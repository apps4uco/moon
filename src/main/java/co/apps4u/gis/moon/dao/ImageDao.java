package co.apps4u.gis.moon.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.tomcat.jdbc.pool.DataSource;

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

		double longitude = 0;
		double latitude = 0;
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
		List<Image> list=dao.queryImage(longitude, latitude, earthDist,0,0);
		for (Image image : list) {
			System.out.println(image);
		}
	}
	
	public ImageDao(){
		
	}
	
	public QueryRunner getRunner() throws SQLException
	{
		DataSource dataSource = DbHandler.getDataSource();
		QueryRunner runner = new QueryRunner(dataSource);
		return runner;
	}

	public List<Image> queryImage(double longitude, double latitude, double dist,int limit,int offset) throws SQLException {
		QueryRunner runner=getRunner();
		double earthDist = EarthMoonGeom.toEarth(dist);
		String sqlFragment = String
				.format("from image where st_dwithin(nadir,ST_GeogFromText('SRID=4326;POINT(%f %f)'),%f) order by st_distance(nadir,ST_GeogFromText('SRID=4326;POINT(%f %f)'))",
						longitude, latitude, earthDist,longitude, latitude);
		String sql = "select * " + sqlFragment;
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
						new DbHandler.ModelProcessor())));
		
		return list;
	}
}
