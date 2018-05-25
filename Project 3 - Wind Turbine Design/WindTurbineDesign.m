% EE564 - Project 3 @ Middle East Technical University
% Furkan Karakaya - 1937051
clear all;
clc;
%% Inputs
Po = 250e3; %W
WindSpeed = 14; %m/s
TurbineSpeed = 24.3; %rpm
GearRatio = 31.2;
PolePair = 4;
PoleNumber = PolePair *2;
LineVoltage = 400; %V
Freq = 50; %Hz
RatedSpeed = 758; %rpm
Phase = 3;
%% Design
%Dimensions
Bpeak = 0.9; %T
Arms = 45e3; %Amperes
PF = 0.85;
Stress = Arms*Bpeak*PF/sqrt(2); %Pa
To = Po/(RatedSpeed*2*pi/60); %Nm
Volume = To/2/Stress; %m^3
D2Lprime = 4*Volume/pi;
AspectRatio = pi/PoleNumber * PolePair^(1/3);
BoreDiameter = (D2Lprime / AspectRatio)^(1/3); %m
Lprime = BoreDiameter * AspectRatio; %m
AirGap = 0.18 + 0.006*Po^(0.4); %mm
AirGap = AirGap * 1e-3; %m
AxialLength = Lprime - 2*AirGap;

%Slot Numbers
for q = 1:6
    Qs(q) = q*PoleNumber*Phase;
    SlotPitch(q) = pi*BoreDiameter / Qs(q) * 1e3; %mm
end
Table = [1:6;Qs(1:6);SlotPitch(1:6)];
q = 2;
Qs = q*PoleNumber*Phase;
SlotPitch = pi*BoreDiameter / Qs; %m
kFE = 0.96; %Stacking Factor
ToothFluxDensity = 1.8; %T
ToothWidth = Lprime * SlotPitch * Bpeak / (kFE * AxialLength * ToothFluxDensity); %m

%Windings
SlotAngle = 2*pi/(Qs/PolePair); %rad
for i=1:11
    k_p(i) = round(sin(i*pi/2));
    k_d(i) = sin(i*q*SlotAngle/2)/(q*sin(i*SlotAngle/2));
    k_w(i) = k_p(i) * k_d(i);
end
FluxPerPole = (Bpeak*2/pi)*pi*BoreDiameter*Lprime/PoleNumber; %Wb-average
Nphase = (LineVoltage/sqrt(2) *0.9) / (4.44*FluxPerPole*k_w(1)*Freq);
Nslot = round(Nphase * 2 /(Qs/Phase));

J = 7; %Arms/mm^2 - Fan cooled
Eff = 0.9;
S = Po/PF/Eff; %VA
Irms = S/(sqrt(3)*LineVoltage); %Arms
Awire = Irms/J; % mm^2
%AvailableWire = ?; %mm^2 - ? AWG
