-- Reservoir_Control.ads

package Reservoir_Control is

    subtype SetPoint is Float range 0 ... 25.0;

    procedure ControlReservoir(SetP: in SetPoint); 
    
end Reservoir_Control;