#include <Wire.h>
#include <LM75.h>

LM75 sensor;  // initialize an LM75 object
// You can also initiate with another address as follows:
//LM75 sensor(LM75_ADDRESS | 0b001);  // if A0->GND, A1->GND and A2->Vcc

void setup()
{
  Wire.begin();
  Serial.begin(9600);
}

void loop()
{
  // get temperature from sensor
  Serial.print("Current temp: ");
  Serial.print(sensor.temp());
  Serial.println(" C");
  
  // Tos Set-point
  sensor.tos(47.5); // set at 47.5'C
  Serial.print("Tos set at ");
  Serial.print(sensor.tos());
  Serial.println(" C");
  
  // Thyst Set-point
  sensor.thyst(42); // set at 42'C
  Serial.print("Thyst set at ");
  Serial.print(sensor.thyst());
  Serial.println(" C");
  
  // shutdown the sensor and wait a while
  sensor.shutdown(true);
  delay(3000);
  // wake up sensor for next time around
  sensor.shutdown(false);
  
  Serial.println();
}
