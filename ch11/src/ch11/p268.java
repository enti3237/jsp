package ch11;

import java.util.HashMap;
import java.util.Map;

public class p268 {
	
	private Map<String, Double> locationCelsuisMap = new HashMap<String, Double>();
	
	public void setCelsius(String location, Double value) {
		locationCelsuisMap.put(location, value);
	}
	
	public Double getCelsius(String location) {
		return locationCelsuisMap.get(location);
	}
	
	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		if(celsius == null) {
			return null;
		}
		return celsius.doubleValue()*1.8+32.0;
	}

	public String getInfo() {
		return "�µ��� ��ȯ�� 1.1";
	}
}
