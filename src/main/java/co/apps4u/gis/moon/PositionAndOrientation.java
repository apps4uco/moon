package co.apps4u.gis.moon;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class PositionAndOrientation  {
    private Integer firstNumber;

    private Integer secondNumber;

    public Integer getFirstNumber() {
        return firstNumber;
    }

    public void setFirstNumber(Integer firstNumber) {
        this.firstNumber = firstNumber;
    }

    public Integer getSecondNumber() {
        return secondNumber;
    }

    public void setSecondNumber(Integer secondNumber) {
        this.secondNumber = secondNumber;
    }

    private Integer total;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }
    
    public void calculate(){
    	setTotal(firstNumber+secondNumber);
    }
}
