package co.apps4u.gis.moon;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;
import org.postgis.Geometry;
import org.postgis.Point;

public class JsonCustom extends JsonSerializer<Geometry> {

	@Override
	public void serialize(Geometry geom, JsonGenerator generator,
			SerializerProvider serial) throws IOException,
			JsonProcessingException {

		if (geom != null) {
			Point point = geom.getFirstPoint();
			if (point != null) {
				generator.writeStartObject();
				generator.writeNumberField("lng", point.getX());
				generator.writeNumberField("lat", point.getY());
				generator.writeEndObject();
			}
		}
	}

}
