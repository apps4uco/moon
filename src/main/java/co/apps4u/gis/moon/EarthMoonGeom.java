package co.apps4u.gis.moon;

public class EarthMoonGeom {
	private EarthMoonGeom(){};
	public static final double earthRadius=6371.0087714;
	public static final double moonRadius=1738;
	
	public static double toEarth(double moonDistanceOnSurface)
	{
		return moonDistanceOnSurface*earthRadius/moonRadius; //circum 2*pi*r
	}
	
	public static double toMoon(double earthDistanceOnSurface)
	{
		return earthDistanceOnSurface*moonRadius/earthRadius; //circum 2*pi*r
	}
}
