% EE564- Project 2 @ Middle East Technical University
% Furkan Karakaya - 1937051
clear all;
%% Design Inputs
% Selected Lamination: 1
% Link for the lamination: https://github.com/odtu/ee564-2018/blob/master/Project2/ks(1).pdf
Bore_Diameter = 115e-3;
Axial_Length = 200e-3;
Slot_Number = 36;
Freq = 50;
Pole_Number = 4;
Phase_Number = 3;
q = Slot_Number/(Pole_Number*Phase_Number);
Slot_Angle = 2*pi/(Slot_Number/(Pole_Number/2));
for i=1:5
    k_p(i) = round(sin(i*pi/2));
    k_d(i) = sin(i*q*Slot_Angle/2)/(q*sin(i*Slot_Angle/2));
    k_w(i) = k_p(i) * k_d(i);
end
V_LineNeut = 220;
A_pole = pi*Bore_Diameter*Axial_Length/Pole_Number;
Bavg = 0.35;
N_phase = round(V_LineNeut/(Freq*k_w(1)*4.44*Bavg*A_pole));
N_slot = round(2*N_phase/(q*Pole_Number));
A_slot = 93.3;
Fill_factor = 0.75;
A_wire = A_slot*Fill_factor/N_slot;
D_wire = 2*sqrt(A_wire/pi);
Electric_Loading_Peak = 50e3;
I_stator = (Electric_Loading_Peak/sqrt(2))*pi*Bore_Diameter / (Slot_Number*N_slot);
Sin = 3*V_LineNeut*I_stator;
Efficiency = 0.9;
Power_Factor = 0.9;
Pout = Sin*Efficiency*Power_Factor;
Stress = Electric_Loading_Peak * Bavg * pi/2 * Power_Factor / 2;
Rotor_Volume = pi*(Bore_Diameter/2)^2 *Axial_Length;
Tout = 2*Stress*Rotor_Volume;
n_shaft = Pout/Tout * 30/pi;
n_synch = 120*Freq/Pole_Number;
slip = (n_synch - n_shaft)/n_synch;
