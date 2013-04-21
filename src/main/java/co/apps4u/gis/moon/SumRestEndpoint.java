package co.apps4u.gis.moon;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

@Path("/sum")
public class SumRestEndpoint {
    
    @GET
    @Produces("application/json")
    public PositionAndOrientation sum(
            @QueryParam("firstNumber") int firstNumber,
            @QueryParam("secondNumber") int secondNumber) {
        	PositionAndOrientation result = new PositionAndOrientation();
        result.setFirstNumber(firstNumber);
        result.setSecondNumber(secondNumber);
        result.calculate();
        return result;
    }
        /*
         * ISS position
         * curl -v "http://open-notify-api.herokuapp.com/iss-now.json?callback=jQuery17206664403894083459_1366461482646&_=1366461524552
         * 
         * jQuery17206664403894083459_1366461482646({
  "message": "success", 
  "data": {
    "timestamp": 1366461546, 
    "iss_position": {
      "latitude": 51.49051486954335, 
      "longitude": 80.27418195659519
    }
  }

         */
}
