package co.apps4u.gis.moon;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public class DateTimeParam {

	private static final DateTimeFormatter fmt = ISODateTimeFormat.dateTime();
	DateTime value;
	
	public DateTime fromString(String s) {
        if (s!=null)
        {
        	s=s.trim();
        	if (s.length()>0)
        	{
		        try {
		            value = fmt.parseDateTime(s);
		        } catch(Exception e) {
		            //date = CRAZY_FORMAT.parse(dateString);
		        }
        	}
        }
        return value;
    }
	
	public DateTime getValue()
	{
		return value;
	}
}