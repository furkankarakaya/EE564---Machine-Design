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
RatedSpeed = 742; %rpm
Phase = 3;
%% Design
%Dimensions
Bpeak = 0.7; %T
Arms = 55e3; %Amperes
PF = 0.85;
Stress = Arms*Bpeak*PF/sqrt(2); %Pa
To = Po/(RatedSpeed*2*pi/60); %Nm
Volume = To/2/Stress; %m^3
D2Lprime = 4*Volume/pi;
AspectRatio = 0.35;%pi/PoleNumber * PolePair^(1/3);
BoreDiameter = round((D2Lprime / AspectRatio)^(1/3),3); %m
Lprime = BoreDiameter * AspectRatio; %m
AirGap = 0.18 + 0.006*Po^(0.4); %mm
AirGap = round(AirGap * 1e-3,4); %m
AxialLength = round(Lprime - 2*AirGap,4);
RotorDiameter = BoreDiameter - 2*AirGap;
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
ToothFluxDensity = 1.5; %T
bd = round(Lprime * SlotPitch * Bpeak / (kFE * AxialLength * ToothFluxDensity),4) * 1e3; %mm
b4 = SlotPitch*1e3 - bd;
%Windings
SlotAngle = 2*pi/(Qs/PolePair); %rad
for i=1:11
    k_p(i) = round(sin(i*pi/2));
    k_d(i) = sin(i*q*SlotAngle/2)/(q*sin(i*SlotAngle/2));
    k_w(i) = k_p(i) * k_d(i);
end
FluxPerPole = (Bpeak*2/pi)*pi*BoreDiameter*Lprime/PoleNumber; %Wb
Nphase = (LineVoltage/sqrt(2) *0.8) / (4.44*FluxPerPole*k_w(1)*Freq);
Nslot = Nphase * 2 /(Qs/Phase);

J = 7; %Arms/mm^2 - Fan cooled
Eff = 0.95;
S = Po/PF/Eff; %VA
Irms = S/(sqrt(3)*LineVoltage); %Arms
Awire = round(Irms/J,1); % mm^2
AvailableWireArea = 6.63; %mm^2 - 9 AWG
AvailableWireDia = sqrt(AvailableWireArea/pi) * 2;%mm
InsulationThickness = 0.5; %mm
ParallelConductors = round(Awire/AvailableWireArea);
TotalWireArea = 10*pi*(InsulationThickness + AvailableWireDia/2)^2; %mm
FillFactor = 0.6;
SlotArea = round(Nslot)*TotalWireArea/FillFactor; %mm^2
h4 = SlotArea/b4; %% mm

YokeFluxDensity = 1.5; %T
hys = round(FluxPerPole / (2*kFE*AxialLength*YokeFluxDensity),3); %m
OuterDiameter = BoreDiameter + 2*hys + 2*h4*1e-3; %m
b1 = round(2*AvailableWireDia); %mm
h1 = b1/2; %mm

StatorMass = 7700 * AxialLength * (OuterDiameter^2/4 - BoreDiameter^2/4) * pi;
RotorMass = 7700 * AxialLength * (RotorDiameter^2/4 - 0.25^2/4) * pi;
kh = 265.1;
kc = 0.168;
ke = 6.37;
CoreLoss = (AxialLength *pi* OuterDiameter^2 /4)*(kh*Freq + kc*Freq^2 + ke*Freq^1.5);
%% Inductances and Resistances
Mu0 = 4*pi*1e-7;
AirGap_mm = AirGap * 1e3; %mm
K = b1/AirGap_mm / (5 + b1/AirGap_mm);
kc = SlotPitch*1e3 / (SlotPitch*1e3 - K*b1);
AirGapEff = AirGap_mm * kc; %mm
Hpeak = Bpeak / Mu0;
MMFpeak = Hpeak * AirGapEff * 1e-3;
MagnetizingCurrent = (MMFpeak/sqrt(2)) *(2*pi*PoleNumber) / (Phase * 4 * k_w(1) * Nphase); %RMS
Lm_ph = 2*Mu0*BoreDiameter * Lprime * (k_w(1) * Nphase)^2 / (pi * PolePair^2 * AirGapEff * 1e-3); %H
Lm_total = Phase * Lm_ph /2; %H
Lu = Mu0 * Lprime * Nslot^2 *(h4/(3*b4) + h1/4); %H
Lu_ph = Qs*Lu / (ParallelConductors^2 * Phase); %H
R_ph = Nphase * (2*AxialLength + BoreDiameter/PoleNumber*pi*2) /(5.96*1e7 * ParallelConductors * AvailableWireArea *1e-6); %ohm
CopperLoss = 3*Irms^2*R_ph;
CopperMass = 3*Nphase*(2*AxialLength + BoreDiameter/PoleNumber*pi*2)*ParallelConductors*AvailableWireArea*1e-6 * 8940;

%% Windings - MMFs
A = [1 1 0 0 0 0 -1 -1 0 0 0 0];
B = [0 0 0 0 1 1 0 0 0 0 -1 -1];
C = [0 0 -1 -1 0 0 0 0 1 1 0 0];

% for Ia = 1, Ib = -0.5 , Ic = -0.5, N = 1
Ia = 1;
Ib = -0.5;
Ic = -0.5;
for i=1:12
    if i~=1
    MMF(i) = Ia*A(i) + Ib*B(i) + Ic*C(i) + MMF(i-1);
    else
    MMF(i) = Ia*A(i) + Ib*B(i) + Ic*C(i);
    end
end
MMF_max = max(MMF);
MMF_min = min(MMF);
MMF_peak = (MMF_max - MMF_min)/2;
MMF_shift = MMF_peak - MMF_max;
for i=1:12
    MMF(i) = MMF(i) + MMF_shift;
end
f1 = figure;
hold all
grid on
ax = gca;
%set(gca, 'XScale', 'log');
title('MMF for I_A = 1, I_B = -0.5, I_C = -0.5 and N=1','FontSize',12,'FontWeight','bold','Color','k');
ylabel('MMF(Amperes)','FontSize',12,'FontWeight','bold','Color','k');
xlabel('Electrical Degree','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
ax.XTick = [0:60:360];
bar(0:30:330, MMF,'LineWidth',3.0,'FaceColor','g');
hold off
% saveas(f1, 'B vs H.jpg');
% for Ia = -0.5, Ib = 1 , Ic = -0.5, N = 1
clear MMF;
Ia = -0.5;
Ib = 1;
Ic = -0.5;
for i=1:12
    if i~=1
    MMF(i) = Ia*A(i) + Ib*B(i) + Ic*C(i) + MMF(i-1);
    else
    MMF(i) = Ia*A(i) + Ib*B(i) + Ic*C(i);
    end
end
MMF_max = max(MMF);
MMF_min = min(MMF);
MMF_peak = (MMF_max - MMF_min)/2;
MMF_shift = MMF_peak - MMF_max;
for i=1:12
    MMF(i) = MMF(i) + MMF_shift;
end
f1 = figure;
hold all
grid on
ax = gca;
%set(gca, 'XScale', 'log');
title('MMF for I_A = -0.5, I_B = 1, I_C = -0.5 and N=1','FontSize',12,'FontWeight','bold','Color','k');
ylabel('MMF(Amperes)','FontSize',12,'FontWeight','bold','Color','k');
xlabel('Electrical Degree','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
ax.XTick = [0:60:360];
bar(0:30:330, MMF,'LineWidth',3.0,'FaceColor','y');
hold off

% for Ia = -0.5, Ib = -0.5 , Ic = 1, N = 1
clear MMF;
Ia = -0.5;
Ib = -0.5;
Ic = 1;
for i=1:12
    if i~=1
    MMF(i) = Ia*A(i) + Ib*B(i) + Ic*C(i) + MMF(i-1);
    else
    MMF(i) = Ia*A(i) + Ib*B(i) + Ic*C(i);
    end
end
MMF_max = max(MMF);
MMF_min = min(MMF);
MMF_peak = (MMF_max - MMF_min)/2;
MMF_shift = MMF_peak - MMF_max;
for i=1:12
    MMF(i) = MMF(i) + MMF_shift;
end
f1 = figure;
hold all
grid on
ax = gca;
%set(gca, 'XScale', 'log');
title('MMF for I_A = -0.5, I_B = -0.5, I_C = 1 and N=1','FontSize',12,'FontWeight','bold','Color','k');
ylabel('MMF(Amperes)','FontSize',12,'FontWeight','bold','Color','k');
xlabel('Electrical Degree','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
ax.XTick = [0:60:360];
bar(0:30:330, MMF,'LineWidth',3.0,'FaceColor','c');
hold off
