-- sensorReading.ads

package SensorReading is

subtype Temperature is Float range 0.0 ... 1250.0;
subtype Pressure is Float range 0.0 ... 25.0;


procedure ReadSensor (Temp: out Temperature; Press:out Pressure); end

end SensorReading;
