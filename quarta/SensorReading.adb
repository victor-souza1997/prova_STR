-- sensorReading.adb

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

package body SensorReading is
   procedure ReadSensor(Temp: out Temperature; Press: out Pressure) is
      TempValue: Float;
      PressValue: Float;
      Start_Time: Time;
      End_Time: Time;
      Elapsed_Time: Time_Span;
      Valid_Reading: Boolean := True;
   begin
      Start_Time := Clock;
      
      -- Le temperatura
      TempValue := ReadTemperature;
      -- Le temperatura
      PressValue := ReadPressure;
      
      End_Time := Clock;
      Elapsed_Time := End_Time - Start_Time;
      -- Checa se o intervalo de leitura eh aceitavel
      if Elapsed_Time > Timeout then
         Valid_Reading := False;
      end if;

      -- Se o intervalo de leitura for aceitavel, o valor eh assinado as variaveis
      if Valid_Reading then
         Temp := Temperature(TempValue);
         Press := Pressure(PressValue);    
      else
         -- Caso contrario, atribui-se o valor de -1
        Temp := -1;
        Press := -1;
      end if;
   end ReadSensor;

end SensorReading;
