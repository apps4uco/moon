package co.apps4u.gis.moon.domain;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.joda.time.DateTime;
import org.postgis.Geometry;

import co.apps4u.gis.moon.JsonCustom;

@XmlRootElement
//@JsonIgnoreProperties({ "nadir", "corner1", "corner2", "corner3", "corner4" })
public class Image {
	int id;
	long image_id;
	double altitude;
	int lens_size;
	double frame_width;
	double frame_height;
	DateTime taken_utc;
	String mission_name;
	String spacecraft;
	String camera_dir;
	int orbit_num;
	String image_page;
	String image_link;
	String  kml_link;
	String  schools;
	int itemId;
	
	@JsonSerialize(using=JsonCustom.class)
	Geometry nadir;
	@JsonSerialize(using=JsonCustom.class)
	Geometry corner1;
	@JsonSerialize(using=JsonCustom.class)
	Geometry corner2;
	@JsonSerialize(using=JsonCustom.class)
	Geometry corner3;
	@JsonSerialize(using=JsonCustom.class)
	Geometry corner4;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the image_id
	 */
	public long getImage_id() {
		return image_id;
	}
	/**
	 * @param image_id the image_id to set
	 */
	public void setImage_id(long image_id) {
		this.image_id = image_id;
	}
	/**
	 * @return the altitude
	 */
	public double getAltitude() {
		return altitude;
	}
	/**
	 * @param altitude the altitude to set
	 */
	public void setAltitude(double altitude) {
		this.altitude = altitude;
	}
	/**
	 * @return the lens_size
	 */
	public int getLens_size() {
		return lens_size;
	}
	/**
	 * @param lens_size the lens_size to set
	 */
	public void setLens_size(int lens_size) {
		this.lens_size = lens_size;
	}
	/**
	 * @return the frame_width
	 */
	public double getFrame_width() {
		return frame_width;
	}
	/**
	 * @param frame_width the frame_width to set
	 */
	public void setFrame_width(double frame_width) {
		this.frame_width = frame_width;
	}
	/**
	 * @return the frame_height
	 */
	public double getFrame_height() {
		return frame_height;
	}
	/**
	 * @param frame_height the frame_height to set
	 */
	public void setFrame_height(double frame_height) {
		this.frame_height = frame_height;
	}
	/**
	 * @return the taken_utc
	 */
	public DateTime getTaken_utc() {
		return taken_utc;
	}
	/**
	 * @param taken_utc the taken_utc to set
	 */
	public void setTaken_utc(DateTime taken_utc) {
		this.taken_utc = taken_utc;
	}
	/**
	 * @return the mission_name
	 */
	public String getMission_name() {
		return mission_name;
	}
	/**
	 * @param mission_name the mission_name to set
	 */
	public void setMission_name(String mission_name) {
		this.mission_name = mission_name;
	}
	/**
	 * @return the spacecraft
	 */
	public String getSpacecraft() {
		return spacecraft;
	}
	/**
	 * @param spacecraft the spacecraft to set
	 */
	public void setSpacecraft(String spacecraft) {
		this.spacecraft = spacecraft;
	}
	/**
	 * @return the camera_dir
	 */
	public String getCamera_dir() {
		return camera_dir;
	}
	/**
	 * @param camera_dir the camera_dir to set
	 */
	public void setCamera_dir(String camera_dir) {
		this.camera_dir = camera_dir;
	}
	/**
	 * @return the orbit_num
	 */
	public int getOrbit_num() {
		return orbit_num;
	}
	/**
	 * @param orbit_num the orbit_num to set
	 */
	public void setOrbit_num(int orbit_num) {
		this.orbit_num = orbit_num;
	}
	/**
	 * @return the image_page
	 */
	public String getImage_page() {
		return image_page;
	}
	/**
	 * @param image_page the image_page to set
	 */
	public void setImage_page(String image_page) {
		this.image_page = image_page;
	}
	/**
	 * @return the image_link
	 */
	public String getImage_link() {
		return image_link;
	}
	/**
	 * @param image_link the image_link to set
	 */
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	/**
	 * @return the kml_link
	 */
	public String getKml_link() {
		return kml_link;
	}
	/**
	 * @param kml_link the kml_link to set
	 */
	public void setKml_link(String kml_link) {
		this.kml_link = kml_link;
	}
	/**
	 * @return the schools
	 */
	public String getSchools() {
		return schools;
	}
	/**
	 * @param schools the schools to set
	 */
	public void setSchools(String schools) {
		this.schools = schools;
	}
	/**
	 * @return the nadir
	 */
	public Geometry getNadir() {
		return nadir;
	}
	/**
	 * @param nadir the nadir to set
	 */
	public void setNadir(Geometry nadir) {
		this.nadir = nadir;
	}
	/**
	 * @return the corner1
	 */
	public Geometry getCorner1() {
		return corner1;
	}
	/**
	 * @param corner1 the corner1 to set
	 */
	public void setCorner1(Geometry corner1) {
		this.corner1 = corner1;
	}
	/**
	 * @return the corner2
	 */
	public Geometry getCorner2() {
		return corner2;
	}
	/**
	 * @param corner2 the corner2 to set
	 */
	public void setCorner2(Geometry corner2) {
		this.corner2 = corner2;
	}
	/**
	 * @return the corner3
	 */
	public Geometry getCorner3() {
		return corner3;
	}
	/**
	 * @param corner3 the corner3 to set
	 */
	public void setCorner3(Geometry corner3) {
		this.corner3 = corner3;
	}
	/**
	 * @return the corner4
	 */
	public Geometry getCorner4() {
		return corner4;
	}
	/**
	 * @param corner4 the corner4 to set
	 */
	public void setCorner4(Geometry corner4) {
		this.corner4 = corner4;
	}

	public String toString()
	{
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	/**
	 * @return the itemId
	 */
	public int getItemId() {
		return itemId;
	}
	/**
	 * @param itemId the itemId to set
	 */
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
//	public String toJsonString()
//	{
//		StringWriter out = new StringWriter();
//		JsonFactory factory=new JsonFactory();
//		JsonGenerator jgen;
//		try {
//			jgen = factory.createJsonGenerator(out);
//		
//		SerializerProvider provider=null;
//		ToStringSerializer.instance.serialize(this, jgen, provider);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return out.toString();
//	}
}
