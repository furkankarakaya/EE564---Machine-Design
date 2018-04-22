% EE564- Project 2 @ Middle East Technical University
% Furkan Karakaya - 1937051
clear all;
%% Design Inputs
% Selected Lamination: 1
% Link for the lamination: https://github.com/odtu/ee564-2018/blob/master/Project2/ks(1).pdf
Bore_Diameter = 115e-3;
Axial_Length = 150e-3;
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
Bpeak = 0.40;
Bavg = Bpeak*2/pi;
N_phase = round(V_LineNeut/(Freq*k_w(1)*4.44*Bavg*A_pole));
N_slot = round(2*N_phase/(q*Pole_Number));
A_slot = 93.3;
Fill_factor = 0.75;
A_wire = A_slot*Fill_factor/N_slot;
D_wire = 2*sqrt(A_wire/pi);
Electric_Loading_Peak = 35e3;
Electric_Loading_RMS = Electric_Loading_Peak / sqrt(2);
I_stator = Electric_Loading_RMS*pi*Bore_Diameter / (Slot_Number*N_slot);
Sin = 3*V_LineNeut*I_stator;
Efficiency = 0.89;
Power_Factor = 0.88;
Pout = Sin*Efficiency*Power_Factor;
Stress = Electric_Loading_Peak * Bpeak * Power_Factor / 2;
Rotor_Volume = pi*(Bore_Diameter/2)^2 *Axial_Length;
Tout = 2*Stress*Rotor_Volume;
n_shaft = Pout/Tout * 30/pi;
n_synch = 120*Freq/Pole_Number;
slip = (n_synch - n_shaft)/n_synch;
%Circuit parameters and loss estimation
Temp = 75;
rho = (1 + 38e-4*(Temp - 20))*1.68e-8;
Rph = N_phase * rho * 2*(Axial_Length + pi*Bore_Diameter/4) / (A_wire*1e-6);

N_pole = Slot_Number/Pole_Number * N_slot;
Flux_PolePair = Bavg*A_pole*2;
Mutual_Inductance = N_pole * Flux_PolePair / I_stator;
Mutual_Impedance = 2*pi*Freq*Mutual_Inductance;

%% Windings - MMFs
A = [0 1 1 1 0 0 0 0 0 0 -1 -1 -1 0 0 0 0 0 0];
B = [0 0 0 0 -1 -1 -1 0 0 0 0 0 0 1 1 1 0 0 0];
C = [-1 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 -1 -1 -1];

% for Ia = 1, Ib = -0.5 , Ic = -0.5, N = 1
Ia = 1;
Ib = -0.5;
Ic = -0.5;
for i=1:18
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
for i=1:18
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
ax.XTick = [0:20:180];
bar(0:10:170, MMF,'LineWidth',3.0,'FaceColor','g');
hold off
% saveas(f1, 'B vs H.jpg');
% for Ia = -0.5, Ib = 1 , Ic = -0.5, N = 1
clear MMF;
Ia = -0.5;
Ib = 1;
Ic = -0.5;
for i=1:18
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
for i=1:18
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
ax.XTick = [0:20:180];
bar(0:10:170, MMF,'LineWidth',3.0,'FaceColor','y');
hold off

% for Ia = -0.5, Ib = -0.5 , Ic = 1, N = 1
clear MMF;
Ia = -0.5;
Ib = -0.5;
Ic = 1;
for i=1:18
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
for i=1:18
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
ax.XTick = [0:20:180];
bar(0:10:170, MMF,'LineWidth',3.0,'FaceColor','c');
hold off