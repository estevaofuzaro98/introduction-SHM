%% INTRODUCTION TO SHM (2021/1) - HOMEWORK #1
% Professor: Samuel da Silva
% Student: Estevao Fuzaro de Almeida
% Date: 11/05/2021
clc; clear; close all
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');

%% HEALTHY MODEL
m = 1;               % Mass [kg]
k = 1000;            % Stiffness [N/m]
wn = sqrt(k/m);      % Natural Frequency [rad/s]
Fn = wn/(2*pi);      % Natural Frequency [Hz]
H = tf(1,[m 0 k]);   % Transfer Function

%% NUMERICAL SIMULATION PARAMETERS
Fs = 10*Fn;             % Sampling Frequency [Hz]
dt = 1/Fs;              % Time Increment [s]
N = 8*1024;             % Number of Samples
t = 0:dt:(N-1)*dt;      % Time Vector [s]
u = randn(N,1);         % Random Excitation [N]

%% HEALTHY TIME RESPONSE
y = lsim(H,u,t);        % Displacement [m]

%% PLOTTING OF HEALTHY DATA
% TIME RESPONSE
txtsize = 18;           % Text Size of Plots
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
subplot(2,1,1)
plot(t,u,'b','linewidth',2)
xlabel('Time [s]')
ylabel('u [N]')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
grid on, grid minor
xlim([0 t(N)])
subplot(2,1,2)
plot(t,y,'b','linewidth',2)
xlabel('Time [s]')
ylabel('y [m]')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
xlim([0 t(N)])
grid on, grid minor

% POWER SPECTRAL DENSITY OF RESPONSE SIGNAL VIA WELCH METHOD
[Y,PSDfreq] = pwelch(y,hanning(N/4),N/8,N/4,Fs);   % WINDOW|OVERLAP|NFFT|Fs
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
semilogy(PSDfreq,Y,'b','linewidth',3)
grid on, grid minor
xlabel('Frequency [Hz]')
ylabel('Y [m$^2$/Hz]')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
xlim([0 Fs/2])

%% FREQUENCY RESPONSE FUNCTION (FRF)
[mag,phase,w]= bode(H,2*pi*PSDfreq);
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
semilogy(PSDfreq,squeeze(mag(1,1,:)),'b','linewidth',3)
grid on, grid minor
xlabel('Frequency [Hz]')
ylabel('H [m/N]')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
xlim([0 Fs/2])

%% DAMAGE SIMULATION [REDUCTION OF STIFFNESS]
kd = [0.99*k 0.98*k 0.97*k 0.96*k 0.95*k];  % 1% Reduction
rep = 100;                                  % Number of signals 
for st=1:rep
    u = randn(N,1);
    yh(st,:) = lsim(H,u,t);                 % [rep] of healthy signals
    for i=1:length(kd)
        Hd = tf(1,[m 0 kd(i)]);
        u = randn(N,1);                     % Random Excitation [N]
        yd(st,:,i) = lsim(Hd,u,t);          % [rep] number of damaged signals for each kd(i)
        [aux,PSDfreq] = pwelch(squeeze(yd(st,:,i)),hanning(N/4),N/8,N/4,Fs);
        Yd(st,:,i) = aux;                   % PSD for each yd
    end
end

%% PLOTTING ARBITRARY DATA
% Temporal Signals
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
plot(t,squeeze(yh(4,:)),'b','linewidth',2), hold on     % Analysis of arbitrary signal
plot(t,squeeze(yd(4,:,1)), 'r','linewidth', 1)
plot(t,squeeze(yd(4,:,2)), 'k','linewidth', 1) 
plot(t,squeeze(yd(4,:,3)), 'g','linewidth', 1)
plot(t,squeeze(yd(4,:,4)), 'c','linewidth', 1)
plot(t,squeeze(yd(4,:,5)), 'm','linewidth', 1)
xlabel('Time [s]')
ylabel('y [m]')
grid on, grid minor
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
legend('Healthy', 'D1', 'D2','D3', 'D4','D5','location','northeast','fontsize',txtsize)
xlim([0 t(N)])
% Plotting PSD
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
semilogy(PSDfreq,Y,'b','linewidth',2), hold on
semilogy(PSDfreq,squeeze(Yd(4,:,1)), 'r','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,2)), 'k','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,3)), 'g','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,4)), 'c','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,5)), 'm','linewidth', 2)
xlabel('Frequency [Hz]')
ylabel('Y [m$^2$/Hz]')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
legend('Healthy', 'D1', 'D2','D3', 'D4','D5','location','northwest','fontsize',txtsize);
grid on, grid minor
xlim([0 10])
annotation('arrow',[0.5294 0.5819],[0.8298 0.8116])
axes('Position',[0.5992 0.538 0.2884 0.3516]); box on
semilogy(PSDfreq,Y,'b','linewidth',2), hold on
semilogy(PSDfreq,squeeze(Yd(4,:,1)), 'r','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,2)), 'k','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,3)), 'g','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,4)), 'c','linewidth', 2)
semilogy(PSDfreq,squeeze(Yd(4,:,5)), 'm','linewidth', 2)
xlabel('Frequency [Hz]')
ylabel('Y [m$^2$/Hz]')
set(gca,'fontsize',14,'XColor','k','YColor','k','ZColor','k','GridColor','k')
grid on, grid minor
axis([4.8 5.1 1e-4 1e-1])

%% COMPUTING FEATURES
% VARIANCE, KURTOSIS, NORM, SKEWNESS, RMS AND GAMMA
ref = var(y);
for k = 1:rep
    Varh(k) = var(squeeze(yh(k,:))); %#ok<*SAGROW>
    Kurth(k) = kurtosis(squeeze(yh(k,:)));
    Normh(k) = norm(squeeze(yh(k,:)));
    Skewh(k) = skewness(squeeze(yh(k,:)));
    RMSh(k) = rms(squeeze(yh(k,:)));
    Gammah(k) = Varh(k)./ref;
    for i = 1:length(kd)        % Computing for each damage kd(i)
        Vard(i,k) = var(squeeze(yd(k,:,i)));        % Line: Damage
        Kurtd(i,k) = kurtosis(squeeze(yd(k,:,i)));  % Column: Each 100 Data
        Normd(i,k) = norm(squeeze(yd(k,:,i)));
        Skewd(i,k) = skewness(squeeze(yd(k,:,i)));
        RMSd(i,k) = rms(squeeze(yd(k,:,i)));
        Gammad(i,k) = Vard(i,k)./ref;
    end
end
% NATURAL FREQUENCY
% Healthy
for k =1:rep
    NatFreqh(k) = Fn + 0.01*randn*Fn;   % Adding some variability
end
% Damaged
for k=1:rep                                 % Number of signals
    for i=1:length(kd)                      % For each damage type
        for j=1:length(PSDfreq)             % For each frequency increment
            if Yd(k,j,i)==max(Yd(k,:,i))    % Taking the higher PSD value of each signal
                NatFreqd(k,i)= PSDfreq(j)+0.01*randn*PSDfreq(j); % Taking the corresponding frequency added of variability
            end
        end
    end
end

%% BOXPLOT OF FEATURES
% VARIANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6])
boxplot([Varh; Vard]','Notch','on','Labels',{'H','D1','D2','D3','D4','D5'})
grid on, grid minor, box on
ylabel('Variance')
xlabel('Structural State')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','ticklabelinterpreter','latex')

% KURTOSIS
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6])
boxplot([Kurth; Kurtd]','Notch','on','Labels',{'H','D1','D2','D3','D4','D5'})
grid on, grid minor, box on
ylabel('Kurtosis')
xlabel('Structural State')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','ticklabelinterpreter','latex')

% 2-NORM
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6])
boxplot([Normh; Normd]','Notch','on','Labels',{'H','D1','D2','D3','D4','D5'})
grid on, grid minor, box on
ylabel('2-Norm')
xlabel('Structural State')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','ticklabelinterpreter','latex')

% SKEWNESS
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6])
boxplot([Skewh; Skewd]','Notch','on','Labels',{'H','D1','D2','D3','D4','D5'})
grid on, grid minor, box on
ylabel('Skewness')
xlabel('Structural State')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','ticklabelinterpreter','latex')

% RMS
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6])
boxplot([RMSh; RMSd]','Notch','on','Labels',{'H','D1','D2','D3','D4','D5'})
grid on, grid minor, box on
ylabel('RMS')
xlabel('Structural State')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','ticklabelinterpreter','latex')

% GAMMA
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6])
boxplot([Gammah; Gammad]','Notch','on','Labels',{'H','D1','D2','D3','D4','D5'})
grid on, grid minor, box on
ylabel('$\gamma$')
xlabel('Structural State')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','ticklabelinterpreter','latex')

% NATURAL FREQUENCY
figure
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6])
boxplot([NatFreqh' NatFreqd],'Notch','on','Labels',{'H','D1','D2','D3','D4','D5'})
grid on, grid minor, box on
ylabel('Natural Frequency')
xlabel('Structural State')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','ticklabelinterpreter','latex')

%% SPACE OF FEATURES [NATURAL FREQUENCY FIXED]
marker = 8;    % Marker Size

% NATURAL FREQUENCY AND VARIANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
plot(Varh,NatFreqh,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
plot(Vard',NatFreqd,'ok','MarkerSize',marker,'MarkerFaceColor','r'), hold on
grid on, grid minor
legend('Healthy','Damaged','location','northeast','fontsize',txtsize)
xlabel('Variance')
ylabel('Natural Frequency')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% NATURAL FREQUENCY AND KURTOSIS
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
plot(Kurth,NatFreqh,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
plot(Kurtd',NatFreqd,'ok','MarkerSize',marker,'MarkerFaceColor','r'), hold on
grid on, grid minor
legend('Healthy','Damaged','location','northeast','fontsize',txtsize)
xlabel('Kurtosis')
ylabel('Natural Frequency')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% NATURAL FREQUENCY AND 2-NORM
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
plot(Normh,NatFreqh,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
plot(Normd',NatFreqd,'ok','MarkerSize',marker,'MarkerFaceColor','r'), hold on
grid on, grid minor
legend('Healthy','Damaged','location','northeast','fontsize',txtsize)
xlabel('2-Norm')
ylabel('Natural Frequency')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% NATURAL FREQUENCY AND SKEWNESS
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
plot(Skewh,NatFreqh,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
plot(Skewd',NatFreqd,'ok','MarkerSize',marker,'MarkerFaceColor','r'), hold on
grid on, grid minor
legend('Healthy','Damaged','location','northeast','fontsize',txtsize)
xlabel('Skewness')
ylabel('Natural Frequency')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% NATURAL FREQUENCY AND RMS
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
plot(RMSh,NatFreqh,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
plot(RMSd',NatFreqd,'ok','MarkerSize',marker,'MarkerFaceColor','r'), hold on
grid on, grid minor
legend('Healthy','Damaged','location','northeast','fontsize',txtsize)
xlabel('RMS')
ylabel('Natural Frequency')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% NATURAL FREQUENCY AND GAMMA
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
plot(Gammah,NatFreqh,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
plot(Gammad',NatFreqd,'ok','MarkerSize',marker,'MarkerFaceColor','r'), hold on
grid on, grid minor
legend('Healthy','Damaged','location','northeast','fontsize',txtsize)
xlabel('$\gamma$')
ylabel('Natural Frequency')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

%% MAHALANOBIS DISTANCE
obs = randperm(rep);        % Arbitrary choosing of data
learn = obs(1:rep/2);       % Half data for learning
valid = obs(rep/2+1:rep);   % Half data for validation

%% NATURAL FREQUENCY & KURTOSIS
% LEARNING DATA - KURTOSIS - HEALTHY
Xh = NatFreqh(learn)';
Yh = Kurth(learn)';
% VALIDATION DATA - KURTOSIS - HEALTHY
Xhv = NatFreqh(valid)';
Yhv = Kurth(valid)';
% VALIDATION DATA - KURTOSIS - DAMAGED
K = [Kurtd(1,:) Kurtd(2,:) Kurtd(3,:) Kurtd(4,:) Kurtd(5,:)]';
F = [NatFreqd(:,1); NatFreqd(:,2); NatFreqd(:,3); NatFreqd(:,4); NatFreqd(:,5)];
% APPLYING MAHALANOBIS
Disth = mahal([Xh Yh],[Xh Yh]);         % Learning
Disthv = mahal([Xhv Yhv],[Xh Yh]);      % Healthy Validation
Distd = mahal([F K],[Xh Yh]);           % Damaged Validation
% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
semilogy(0:(rep*6),max(Disth)*ones(1,(rep*6 +1)),'--k','linewidth',2)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('KURTOSIS')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation data','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

%% NATURAL FREQUENCY & VARIANCE
% LEARNING DATA - VARIANCE - HEALTHY
Xh = NatFreqh(learn)';
Yh = Varh(learn)';
% VALIDATION DATA - VARIANCE - HEALTHY
Xhv = NatFreqh(valid)';
Yhv = Varh(valid)';
% VALIDATION DATA - VARIANCE - DAMAGED
K = [Vard(1,:) Vard(2,:) Vard(3,:) Vard(4,:) Vard(5,:)]';
F = [NatFreqd(:,1); NatFreqd(:,2); NatFreqd(:,3); NatFreqd(:,4); NatFreqd(:,5)];
% APPLYING MAHALANOBIS
Disth = mahal([Xh Yh],[Xh Yh]);         % Learning
Disthv = mahal([Xhv Yhv],[Xh Yh]);      % Healthy Validation
Distd = mahal([F K],[Xh Yh]);           % Damaged Validation
% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
semilogy(0:(rep*6),max(Disth)*ones(1,(rep*6 +1)),'--k','linewidth',2)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('VARIANCE')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation data','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

%% NATURAL FREQUENCY & 2-NORM
% LEARNING DATA - 2-NORM - HEALTHY
Xh = NatFreqh(learn)';
Yh = Normh(learn)';
% VALIDATION DATA - 2-NORM - HEALTHY
Xhv = NatFreqh(valid)';
Yhv = Normh(valid)';
% VALIDATION DATA - 2-NORM - DAMAGED
K = [Normd(1,:) Normd(2,:) Normd(3,:) Normd(4,:) Normd(5,:)]';
F = [NatFreqd(:,1); NatFreqd(:,2); NatFreqd(:,3); NatFreqd(:,4); NatFreqd(:,5)];
% APPLYING MAHALANOBIS
Disth = mahal([Xh Yh],[Xh Yh]);         % Learning
Disthv = mahal([Xhv Yhv],[Xh Yh]);      % Healthy Validation
Distd = mahal([F K],[Xh Yh]);           % Damaged Validation
% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
semilogy(0:(rep*6),max(Disth)*ones(1,(rep*6 +1)),'--k','linewidth',2)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('2-NORM')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation data','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

%% NATURAL FREQUENCY & RMS
% LEARNING DATA - RMS - HEALTHY
Xh = NatFreqh(learn)';
Yh = RMSh(learn)';
% VALIDATION DATA - RMS - HEALTHY
Xhv = NatFreqh(valid)';
Yhv = RMSh(valid)';
% VALIDATION DATA - RMS - DAMAGED
K = [RMSd(1,:) RMSd(2,:) RMSd(3,:) RMSd(4,:) RMSd(5,:)]';
F = [NatFreqd(:,1); NatFreqd(:,2); NatFreqd(:,3); NatFreqd(:,4); NatFreqd(:,5)];
% APPLYING MAHALANOBIS
Disth = mahal([Xh Yh],[Xh Yh]);         % Learning
Disthv = mahal([Xhv Yhv],[Xh Yh]);      % Healthy Validation
Distd = mahal([F K],[Xh Yh]);           % Damaged Validation
% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
semilogy(0:(rep*6),max(Disth)*ones(1,(rep*6 +1)),'--k','linewidth',2)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('RMS')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation data','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

%% NATURAL FREQUENCY & SKEWNESS
% LEARNING DATA - SKEWNESS - HEALTHY
Xh = NatFreqh(learn)';
Yh = Skewh(learn)';
% VALIDATION DATA - SKEWNESS - HEALTHY
Xhv = NatFreqh(valid)';
Yhv = Skewh(valid)';
% VALIDATION DATA - SKEWNESS - DAMAGED
K = [Skewd(1,:) Skewd(2,:) Skewd(3,:) Skewd(4,:) Skewd(5,:)]';
F = [NatFreqd(:,1); NatFreqd(:,2); NatFreqd(:,3); NatFreqd(:,4); NatFreqd(:,5)];
% APPLYING MAHALANOBIS
Disth = mahal([Xh Yh],[Xh Yh]);         % Learning
Disthv = mahal([Xhv Yhv],[Xh Yh]);      % Healthy Validation
Distd = mahal([F K],[Xh Yh]);           % Damaged Validation
% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
semilogy(0:(rep*6),max(Disth)*ones(1,(rep*6 +1)),'--k','linewidth',2)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('SKEWNESS')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation data','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

%% NATURAL FREQUENCY & GAMMA
% LEARNING DATA - GAMMA - HEALTHY
Xh = NatFreqh(learn)';
Yh = Gammah(learn)';
% VALIDATION DATA - GAMMA - HEALTHY
Xhv = NatFreqh(valid)';
Yhv = Gammah(valid)';
% VALIDATION DATA - GAMMA - DAMAGED
K = [Gammad(1,:) Gammad(2,:) Gammad(3,:) Gammad(4,:) Gammad(5,:)]';
F = [NatFreqd(:,1); NatFreqd(:,2); NatFreqd(:,3); NatFreqd(:,4); NatFreqd(:,5)];
% APPLYING MAHALANOBIS
Disth = mahal([Xh Yh],[Xh Yh]);         % Learning
Disthv = mahal([Xhv Yhv],[Xh Yh]);      % Healthy Validation
Distd = mahal([F K],[Xh Yh]);           % Damaged Validation
% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
semilogy(0:(rep*6),max(Disth)*ones(1,(rep*6 +1)),'--k','linewidth',2)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('GAMMA')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation data','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')