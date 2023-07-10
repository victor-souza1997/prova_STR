-- reservoir_control.adb

with Ada.Text_IO; use Ada.Text_IO;
with AuxLibrary; use AuxLibrary;
with SensorReading; use SensorReading;
with Ada.Real_Time; use Ada.Real_Time;

package body Reservoir_Control is

   procedure ControlReservoir(SetP: in SetPoint) is
      Temp: SensorReading.Temperature;
      Press: SensorReading.Pressure;
      Start_Time: Time;
      End_Time: Time;
      Elapsed_Time: Time_Span;
   begin
      -- Ler os valores dos sensores
      Start_Time := Clock;
      SensorReading.ReadSensor(Temp, Press);
      End_Time := Clock;
      Elapsed_Time := End_Time - Start_Time;

      -- Verificar se os valores dos sensores são válidos
      if Temp >= 0.0 and Press >= 0.0 and Elapsed_Time <= Timeout then
         -- Calcular a pressão desejada com base nos valores dos sensores e no setpoint
         CalculatedPressure := CalculatePressure(Float(Temp), Float(Press));

         -- Definir a pressão no reservatório
         SetPressure(CalculatedPressure);

      else
         Put_Line("Tempo limite passou ou temperatura ou valores sao negativos");
      end if;
   end ControlReservoir;

end Reservoir_Control;
