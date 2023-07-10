-- reservoir_control.adb

with Ada.Text_IO; use Ada.Text_IO;
with AuxLibrary; use AuxLibrary;
with SensorReading; use SensorReading;

package body Reservoir_Control is

   procedure ControlReservoir(SetP: in SetPoint) is
      Temp: SensorReading.Temperature;
      Press: SensorReading.Pressure;
   begin
      -- Ler os valores dos sensores
      SensorReading.ReadSensor(Temp, Press);

      -- Verificar se os valores dos sensores são válidos
      if Temp >= 0.0 and Press >= 0.0 then
         -- Calcular a pressão desejada com base nos valores dos sensores e no setpoint
         CalculatedPressure := CalculatePressure(Float(Temp), Float(Press));

         -- Definir a pressão no reservatório
         SetPressure(CalculatedPressure);

      
      else
         Put_Line("Pressao invalida");
      end if;
   end ControlReservoir;

end Reservoir_Control;
