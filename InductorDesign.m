clear all
% Initial Points
Idc = 4;
Perm0 = 4*pi*1e-7;

% Core Specs
% Link: https://www.mag-inc.com/Media/Magnetics/Datasheets/0077620A7.pdf
AL = 394;
OD = 62e-3;
ID = 32.6e-3;
Length = 144e-3;
Area = 360e-6;
Height = 25e-3;

%AmperTurn vs AL fit parameters
p1 = -0.4457;
p2 = 400.6; %% AL(nH/T^2) = p1*AT + p2; Perm = Length*(p1*AT+p2)*1e-9/Area
%Calculations
HomogReluct = 1e9/AL; % Homogenous Reluctance
Perm = Length/(HomogReluct*Area);
RelatPerm = Perm/Perm0;
AL_zerocurr = p1*0 + p2;
AL_limit = 0.8*AL_zerocurr; % 80% is the limit for saturation begin
AT_limit = (AL_limit - p2)/p1;
N_limit = round(AT_limit/Idc);


%% Linear Core
% Homogenous
j = 0;
for N = 10:5:100
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
for N = 10:5:100
    j=j+1;
    Ind_NonHomog(j) = N.^2/EquivReluct;
end


%% NonLinear Core
% Homogenous
j = 0;
for N= 10:5:100
    j = j + 1;
    Ind_NonLinHomog(j) = N^2/(1e9/(p1*N*Idc + p2));
end
% Nonhomogeous
StepNumber = 40;
StepLength = (OD/2 - ID/2)/(StepNumber-1); %increase as radius
j = 0;
for N= 10:5:100
    i = 0;
    j = j + 1;
    clear NonHomogReluct;
for InnerRadius = ID/2:StepLength:(OD/2-StepLength)
    i = i + 1;
    OuterRadius = InnerRadius + StepLength;
    MiddleLength = pi*(OuterRadius + InnerRadius);
    CrossArea = Height * StepLength;
    Perm_NH = Length*(p1*N*Idc+p2)*1e-9/Area;
    NonHomogReluct(i) = MiddleLength / (Perm_NH*CrossArea);
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
plot(10:5:100, 1e3*Ind_NonHomog,'LineWidth',3.0,'Color','b');
plot(10:5:100, 1e3*Ind_NonLinHomog,'LineWidth',3.0,'Color','g');
plot(10:5:100, 1e3*Ind_NonLinNonHomog,'LineWidth',3.0,'Color','c');
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
    Ind_NonLinHomog(j) = N_limit^2/(1e9/(p1*N_limit*I + p2));
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
    Perm_NH = Length*(p1*N_limit*I+p2)*1e-9/Area;
    NonHomogReluct(i) = MiddleLength / (Perm_NH*CrossArea);
end
EquivReluct = 1./sum(1./(NonHomogReluct(:)));
Ind_NonLinNonHomog(j) = N_limit.^2/EquivReluct;
end

%% Figure I vs Inductance
f2 = figure;
hold all
grid on
ax = gca;
title('Inductance vs Excitation Current (N = 45)','FontSize',12,'FontWeight','bold','Color','k');
xlabel('Current(A)','FontSize',12,'FontWeight','bold','Color','k');
ylabel('Inductance(mH)','FontSize',12,'FontWeight','bold','Color','k');
ax.FontSize = 12;
%ax.XTick = [t1:0.1e-7:t2];
plot(0.5:0.25:8, 1e3*Ind_Homog,'LineWidth',3.0,'Color','r');
plot(0.5:0.25:8, 1e3*Ind_NonHomog,'LineWidth',3.0,'Color','b');
plot(0.5:0.25:8, 1e3*Ind_NonLinHomog,'LineWidth',3.0,'Color','g');
plot(0.5:0.25:8, 1e3*Ind_NonLinNonHomog,'LineWidth',3.0,'Color','c');
legend('Linear Homogenous','Linear NonHomogenous','NonLinear Homogenous','NonLinear NonHomogenous','Location','SouthWest');
hold off
saveas(f2, 'Inductance vs Current.jpg');

%% Gapped Core
%No fringing
TotReluct = (Length - 2e-3)/(Perm*Area) + (2e-3)/(Perm0*Area);
Ind_GapNoFring = N_limit.^2/TotReluct;
%Fringing Exists
% The method seen in the Mohan's book Ch.30 p.758 is applied
AreaGap = Height * ((OD - ID)/2 + 2e-3);
TotReluct = (Length - 2e-3)/(Perm*Area) + (2e-3)/(Perm0*AreaGap);
Ind_GapFringExis = N_limit.^2/TotReluct;
