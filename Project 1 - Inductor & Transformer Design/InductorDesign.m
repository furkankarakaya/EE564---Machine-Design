clear all
% Initial Points
Idc = 4;
Perm0 = 4*pi*1e-7;
RelatPermCore = 125;
Perm = RelatPermCore * Perm0;

% Core Specs
% Link: https://www.mag-inc.com/Media/Magnetics/Datasheets/0077620A7.pdf
AL = 394;
OD = 62e-3;
ID = 32.6e-3;
Length = 144e-3;
Area = 360e-6;
Height = 25e-3;

%Flux Density vs AmperTurn/cm fit parameters
a = 1.414e-2;
b = 2.851e-2;
c = 1.135e-3;
d = 7.55e-2;
e = 1.088e-3;
x = 1.274;
%B = ((a + b*H + c*H^2)/(1 + d*H + e*H^2))^x;

%Initial Permeability vs AmperTurn/cm fit paramters
a1 = 0.01;
b1 = 6.345e-5;
c1 = 1.462;
% InitialPermPerc = 1/(a1 + b1 * (AT/(Length))^c1);


%% Core Graph
j = 0;
for NI = 15:1:800
    j = j + 1;
    H(j) = NI/(Length*100); %Amper-Turn/cm
    B(j) = ((a + b*H(j) + c*H(j)^2)/(1 + d*H(j) + e*H(j)^2))^x;
    RelPerm (j) = (B(j)/(H(j)*100))/Perm0;
    InitialPermPerc(j) = 1/(a1 + b1 * H(j)^c1);
    RelPerm_InitialCalc (j) = InitialPermPerc(j) * 125 / 100;
    B_InitialCalc (j) = RelPerm_InitialCalc(j) * Perm0 * H(j)*100;
end
f3 = figure;
hold all
grid on
ax = gca;
%set(gca, 'XScale', 'log');
title('B vs H curve','FontSize',12,'FontWeight','bold','Color','k');
xlabel('H(AT/cm)','FontSize',12,'FontWeight','bold','Color','k');
ylabel('B(T)','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
%ax.XTick = [t1:0.1e-7:t2];
plot(H, B,'LineWidth',3.0,'Color','r');
plot(H, B_InitialCalc,'LineWidth',3.0,'Color','b');
legend('BH Fit','Perm. Fit','Location','NorthWest');
hold off
saveas(f3, 'B vs H.jpg');

f4 = figure;
hold all
grid on
ax = gca;
%set(gca, 'XScale', 'log');
title('Relative Permeability vs H curve','FontSize',12,'FontWeight','bold','Color','k');
xlabel('H(AT/cm)','FontSize',12,'FontWeight','bold','Color','k');
ylabel('\mu_r','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
%ax.XTick = [t1:0.1e-7:t2];
plot(H, RelPerm,'LineWidth',3.0,'Color','r');
plot(H, RelPerm_InitialCalc,'LineWidth',3.0,'Color','b');
legend('B-H Fit','Perm-H Fit','Location','NorthEast');
hold off
saveas(f4, 'Relative Permeability vs H.jpg');
%% General Calculations
[~,Index] = min(abs(H-10));
H_limit = H(Index) * 100; %H_limit is in AmperTurn/Meter
HomogReluct = Length/(RelatPermCore * Perm0 * Area);
N_limit = H_limit * Length / Idc;
%% Linear Core
% Homogenous
j = 0;
for N = 10:1:100
    j=j+1;
    Ind_Homog(j) = N.^2/HomogReluct;

end
%plot(10:5:100,Ind_homog);
% Nonhomogenous
StepNumber = 40;
StepLength = (OD/2 - ID/2)/(StepNumber-1); %increase as radius
j = 0;
for InnerRadius = ID/2:StepLength:(OD/2-StepLength)
    j = j+1;
    OuterRadius = InnerRadius + StepLength;
    MiddleLength = pi*(OuterRadius + InnerRadius);
    CrossArea = Height * StepLength;
    NonHomogReluct(j) = MiddleLength / (Perm*CrossArea);
end
EquivReluct = 1./sum(1./(NonHomogReluct(:)));
j = 0;
for N = 10:1:100
    j=j+1;
    Ind_NonHomog(j) = N.^2/EquivReluct;

end


%% NonLinear Core
% Homogenous
j = 0;
for N= 10:1:100
    j = j + 1;
    H_dummy = N*Idc / (Length * 100); % in AmperTurns/cm
    Perm_dummy = 1/(a1 + b1 * H_dummy^c1);
    Reluct_dummy = Length / (Area * Perm0 * Perm_dummy * 125 /100);
    Ind_NonLinHomog(j) = N^2 / Reluct_dummy;

end
% Nonhomogeous
StepNumber = 40;
StepLength = (OD/2 - ID/2)/(StepNumber-1); %increase as radius
j = 0;
for N= 10:1:100
    i = 0;
    j = j + 1;
    clear NonHomogReluct;
for InnerRadius = ID/2:StepLength:(OD/2-StepLength)
    i = i + 1;
    OuterRadius = InnerRadius + StepLength;
    MiddleLength = pi*(OuterRadius + InnerRadius);
    CrossArea = Height * StepLength;
    H_dummy = N * Idc / (MiddleLength * 100);
    Perm_dummy = 1/(a1 + b1 * H_dummy^c1);
    NonHomogReluct(i) = MiddleLength / (Perm0 * Perm_dummy * CrossArea * 125 /100);
end
EquivReluct = 1./sum(1./(NonHomogReluct(:)));
Ind_NonLinNonHomog(j) = N.^2/EquivReluct;

end


%% Figure N vs Inductance
f1 = figure;
hold all
grid on
ax = gca;
title('Inductance vs Turn Number (I_{DC} = 4A)','FontSize',12,'FontWeight','bold','Color','k');
xlabel('Turn Number','FontSize',12,'FontWeight','bold','Color','k');
ylabel('Inductance(mH)','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
%ax.XTick = [t1:0.1e-7:t2];
plot(10:5:100, 1e3*Ind_Homog,'LineWidth',3.0,'Color','r');
plot(10:5:100, 1e3*Ind_NonHomog,'LineWidth',3.0,'Color','c');
plot(10:5:100, 1e3*Ind_NonLinHomog,'LineWidth',3.0,'Color','g');
plot(10:5:100, 1e3*Ind_NonLinNonHomog,'LineWidth',3.0,'Color','b');
legend('Linear Homogenous','Linear NonHomogenous','NonLinear Homogenous','NonLinear NonHomogenous','Location','NorthWest');
hold off
saveas(f1, 'Inductance vs Turn Number.jpg');
%% Linear Core
clear Ind_Homog
clear Ind_NonHomog
clear Ind_NonLinHomog
clear Ind_NonLinNonHomog
clear NonHomogReluct
% Homogenous
j = 0;
for I = 0.5:0.25:8
    j=j+1;
    Ind_Homog(j) = N_limit.^2/HomogReluct;
end
% Nonhomogenous
StepNumber = 40;
StepLength = (OD/2 - ID/2)/(StepNumber-1); %increase as radius
j = 0;
for InnerRadius = ID/2:StepLength:(OD/2-StepLength)
    j = j+1;
    OuterRadius = InnerRadius + StepLength;
    MiddleLength = pi*(OuterRadius + InnerRadius);
    CrossArea = Height * StepLength;
    NonHomogReluct(j) = MiddleLength / (Perm*CrossArea);
end
EquivReluct = 1./sum(1./(NonHomogReluct(:)));
j = 0;
for I = 0.5:0.25:8
    j=j+1;
    Ind_NonHomog(j) = N_limit.^2/EquivReluct;
end
%% NonLinear Core
% Homogenous
j = 0;
for I = 0.5:0.25:8
    j = j + 1;
    H_dummy = N_limit*I / (Length * 100); % in AmperTurns/cm
    Perm_dummy = 1/(a1 + b1 * H_dummy^c1);
    Reluct_dummy = Length / (Area * Perm0 * Perm_dummy * 125 /100);
    Ind_NonLinHomog(j) = N_limit^2 / Reluct_dummy;
end
% Nonhomogeous
StepNumber = 40;
StepLength = (OD/2 - ID/2)/(StepNumber-1); %increase as radius
j = 0;
for I = 0.5:0.25:8
    i = 0;
    j = j + 1;
    clear NonHomogReluct;
for InnerRadius = ID/2:StepLength:(OD/2-StepLength)
    i = i + 1;
    OuterRadius = InnerRadius + StepLength;
    MiddleLength = pi*(OuterRadius + InnerRadius);
    CrossArea = Height * StepLength;
    H_dummy = N_limit * I / (MiddleLength * 100);
    Perm_dummy = 1/(a1 + b1 * H_dummy^c1);
    NonHomogReluct(i) = MiddleLength / (Perm0 * Perm_dummy * CrossArea * 125 /100);
end
EquivReluct = 1./sum(1./(NonHomogReluct(:)));
Ind_NonLinNonHomog(j) = N_limit.^2/EquivReluct;
end

%% Figure I vs Inductance
f2 = figure;
hold all
grid on
ax = gca;
title('Inductance vs Excitation Current (N = 36)','FontSize',12,'FontWeight','bold','Color','k');
xlabel('Current(A)','FontSize',12,'FontWeight','bold','Color','k');
ylabel('Inductance(mH)','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
%ax.XTick = [t1:0.1e-7:t2];
plot(0.5:0.25:8, 1e3*Ind_Homog,'LineWidth',3.0,'Color','r');
plot(0.5:0.25:8, 1e3*Ind_NonHomog,'LineWidth',3.0,'Color','c');
plot(0.5:0.25:8, 1e3*Ind_NonLinHomog,'LineWidth',3.0,'Color','g');
plot(0.5:0.25:8, 1e3*Ind_NonLinNonHomog,'LineWidth',3.0,'Color','b');
legend('Linear Homogenous','Linear NonHomogenous','NonLinear Homogenous','NonLinear NonHomogenous','Location','SouthWest');
hold off
saveas(f2, 'Inductance vs Current.jpg');

%% Gapped Core
%No fringing
TotReluct = (Length - 2e-3)/(Perm0*110*Area) + (2e-3)/(Perm0*Area);
Ind_GapNoFring = N_limit.^2/TotReluct;
%Fringing Exists
% The method seen in the Mohan's book Ch.30 p.758 is applied
AreaGap = Height * ((OD - ID)/2 + 2e-3);
TotReluct = (Length - 2e-3)/(Perm0*110*Area) + (2e-3)/(Perm0*AreaGap);
Ind_GapFringExis = N_limit.^2/TotReluct;
