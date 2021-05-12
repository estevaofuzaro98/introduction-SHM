%% INTRODUCTION TO SHM (2021/1) - HOMEWORK #1
% Professor: Samuel da Silva
% Student: Estevao Fuzaro de Almeida
% Date: 11/05/2021
clc; clear; close all
mySeed = 17041998;
rng_stream = RandStream('mt19937ar', 'Seed', mySeed);
RandStream.setGlobalStream(rng_stream);

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');
txtsize = 18;           % Text Size of Plots
marker = 8;             % Marker Size
reduction = 0.01;      % Reduction in percentage for stiffness

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
reduc = reduction;
kd = [(1-reduc)*k (1-2*reduc)*k (1-3*reduc)*k (1-4*reduc)*k (1-5*reduc)*k];
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
plot(t,squeeze(yd(4,:,1)),'r','linewidth', 1)
plot(t,squeeze(yd(4,:,2)),'k','linewidth', 1) 
plot(t,squeeze(yd(4,:,3)),'g','linewidth', 1)
plot(t,squeeze(yd(4,:,4)),'c','linewidth', 1)
plot(t,squeeze(yd(4,:,5)),'m','linewidth', 1)
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
axis([PSDfreq(170) PSDfreq(210) 1e-5 1e-1])

%% COMPUTING FEATURES
% VARIANCE, KURTOSIS, NORM, SKEWNESS, RMS AND GAMMA
ref = var(y);
for k = 1:rep
    Varh(k) = var(squeeze(yh(k,:))); %#ok<*SAGROW>
    Kurth(k) = kurtosis(squeeze(yh(k,:)));
    Skewh(k) = skewness(squeeze(yh(k,:)));
    RMSh(k) = rms(squeeze(yh(k,:)));
    Gammah(k) = Varh(k)./ref;
    for i = 1:length(kd)        % Computing for each damage kd(i)
        Vard(i,k) = var(squeeze(yd(k,:,i)));        % Line: Damage
        Kurtd(i,k) = kurtosis(squeeze(yd(k,:,i)));  % Column: Each 100 Data
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

% THRESHOLD
% USING IQL RULE
M = median(Disth);
X = sort(Disth);
aux1 = [];
aux2 = [];
for i=1:length(Disth)
    if X(i)<M
    aux1 = [aux1 X(i)];     %#ok<*AGROW>
    end
    if X(i)>M
        aux2 = [aux2 X(i)];
    end
end
Q1 = median(aux1); 
Q3 = median(aux2);
IQR = Q3-Q1;
UCL = Q1+1.5*IQR;

% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
yline(max(Disth),'--k','linewidth',2.5)
yline(UCL,'k-.','linewidth', 2.5)
yline((UCL+max(Disth))/2,'m:','linewidth', 2.5)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('Variance')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation Data','Empirical Threshold','UCL (IQR Rule)','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% CONFUSION MATRIX
% BASED ON UCL (IQR)
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>UCL
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<UCL
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('\n\n \t\t\t VARIANCE\n')
fprintf('PROBABILITY OF DETECTION (UCL IQR): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (UCL IQR): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (UCL IQR): %.1f%% \n\n',pfp)

% BASED ON EMPIRICAL THRESHOLD
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>max(Disth)
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<max(Disth)
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (Empirical): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (Empirical): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (Empirical): %.1f%% \n\n',pfp)

% PROPOSED BY AUTHOR
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>(UCL+max(Disth))/2
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<(UCL+max(Disth))/2
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (by Author): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (by Author): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (by Author): %.1f%% \n\n',pfp)

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

% THRESHOLD
% USING IQL RULE
M = median(Disth);
X = sort(Disth);
aux1 = [];
aux2 = [];
for i=1:length(Disth)
    if X(i)<M
    aux1 = [aux1 X(i)];     %#ok<*AGROW>
    end
    if X(i)>M
        aux2 = [aux2 X(i)];
    end
end
Q1 = median(aux1); 
Q3 = median(aux2);
IQR = Q3-Q1;
UCL = Q1+1.5*IQR;

% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
yline(max(Disth),'--k','linewidth',2.5)
yline(UCL,'k-.','linewidth', 2.5)
yline((UCL+max(Disth))/2,'m:','linewidth', 2.5)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('RMS')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation Data','Empirical Threshold','UCL (IQR Rule)','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% CONFUSION MATRIX
% BASED ON UCL (IQR)
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>UCL
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<UCL
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('\n\n \t\t\t RMS\n')
fprintf('PROBABILITY OF DETECTION (UCL IQR): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (UCL IQR): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (UCL IQR): %.1f%% \n\n',pfp)

% BASED ON EMPIRICAL THRESHOLD
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>max(Disth)
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<max(Disth)
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (Empirical): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (Empirical): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (Empirical): %.1f%% \n\n',pfp)

% PROPOSED BY AUTHOR
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>(UCL+max(Disth))/2
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<(UCL+max(Disth))/2
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (by Author): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (by Author): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (by Author): %.1f%% \n\n',pfp)

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

% THRESHOLD
% USING IQL RULE
M = median(Disth);
X = sort(Disth);
aux1 = [];
aux2 = [];
for i=1:length(Disth)
    if X(i)<M
    aux1 = [aux1 X(i)];     %#ok<*AGROW>
    end
    if X(i)>M
        aux2 = [aux2 X(i)];
    end
end
Q1 = median(aux1); 
Q3 = median(aux2);
IQR = Q3-Q1;
UCL = Q1+1.5*IQR;

% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
yline(max(Disth),'--k','linewidth',2.5)
yline(UCL,'k-.','linewidth', 2.5)
yline((UCL+max(Disth))/2,'m:','linewidth', 2.5)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('Gamma')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation Data','Empirical Threshold','UCL (IQR Rule)','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% CONFUSION MATRIX
% BASED ON UCL (IQR)
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>UCL
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<UCL
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('\n\n \t\t\t GAMMA\n')
fprintf('PROBABILITY OF DETECTION (UCL IQR): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (UCL IQR): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (UCL IQR): %.1f%% \n\n',pfp)

% BASED ON EMPIRICAL THRESHOLD
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>max(Disth)
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<max(Disth)
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (Empirical): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (Empirical): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (Empirical): %.1f%% \n\n',pfp)

% PROPOSED BY AUTHOR
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>(UCL+max(Disth))/2
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<(UCL+max(Disth))/2
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (by Author): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (by Author): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (by Author): %.1f%% \n\n',pfp)

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

% THRESHOLD
% USING IQL RULE
M = median(Disth);
X = sort(Disth);
aux1 = [];
aux2 = [];
for i=1:length(Disth)
    if X(i)<M
    aux1 = [aux1 X(i)];     %#ok<*AGROW>
    end
    if X(i)>M
        aux2 = [aux2 X(i)];
    end
end
Q1 = median(aux1); 
Q3 = median(aux2);
IQR = Q3-Q1;
UCL = Q1+1.5*IQR;

% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
yline(max(Disth),'--k','linewidth',2.5)
yline(UCL,'k-.','linewidth', 2.5)
yline((UCL+max(Disth))/2,'m:','linewidth', 2.5)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('Kurtosis')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation Data','Empirical Threshold','UCL (IQR Rule)','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% CONFUSION MATRIX
% BASED ON UCL (IQR)
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>UCL
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<UCL
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('\n\n \t\t\t KURTOSIS\n')
fprintf('PROBABILITY OF DETECTION (UCL IQR): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (UCL IQR): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (UCL IQR): %.1f%% \n\n',pfp)

% BASED ON EMPIRICAL THRESHOLD
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>max(Disth)
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<max(Disth)
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (Empirical): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (Empirical): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (Empirical): %.1f%% \n\n',pfp)

% PROPOSED BY AUTHOR
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>(UCL+max(Disth))/2
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<(UCL+max(Disth))/2
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (by Author): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (by Author): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (by Author): %.1f%% \n\n',pfp)

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

% THRESHOLD
% USING IQL RULE
M = median(Disth);
X = sort(Disth);
aux1 = [];
aux2 = [];
for i=1:length(Disth)
    if X(i)<M
    aux1 = [aux1 X(i)];     %#ok<*AGROW>
    end
    if X(i)>M
        aux2 = [aux2 X(i)];
    end
end
Q1 = median(aux1); 
Q3 = median(aux2);
IQR = Q3-Q1;
UCL = Q1+1.5*IQR;

% PLOTTING MAHALANOBIS DISTANCE
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 0.6]);
semilogy(learn,Disth,'ok','MarkerSize',marker,'MarkerFaceColor','b'), hold on
semilogy(valid,Disthv,'xk','MarkerSize',marker,'linewidth',2), hold on
semilogy(rep+1:rep+5*rep,Distd,'dk','MarkerSize',marker,'MarkerFaceColor','r')
yline(max(Disth),'--k','linewidth',2.5)
yline(UCL,'k-.','linewidth', 2.5)
yline((UCL+max(Disth))/2,'m:','linewidth', 2.5)
grid on, grid minor
xlabel('Tests') 
ylabel('$\mathcal D^2$')
title('Skewness')
legend('Healthy - Learning Data','Healthy - Validation Data','Damaged - Validation Data','Empirical Threshold','UCL (IQR Rule)','Location','southeast')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')

% CONFUSION MATRIX
% BASED ON UCL (IQR)
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>UCL
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<UCL
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('\n\n \t\t\t SKEWNESS\n')
fprintf('PROBABILITY OF DETECTION (UCL IQR): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (UCL IQR): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (UCL IQR): %.1f%% \n\n',pfp)

% BASED ON EMPIRICAL THRESHOLD
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>max(Disth)
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<max(Disth)
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (Empirical): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (Empirical): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (Empirical): %.1f%% \n\n',pfp)

% PROPOSED BY AUTHOR
fp = 0; % FALSE POSITIVE
for i=1:length(valid)
    if Disthv(i)>(UCL+max(Disth))/2
        fp = 1+fp;
    end
end
fn = 0; % FALSE NEGATIVE
for i=1:5*rep
    if Distd(i)<(UCL+max(Disth))/2
        fn = 1+fn;
    end
end
pfn = fn/(5*rep)*100;       % Rate of Error II
pfp = fp/length(valid)*100; % Rate of Error I   
tp = (5*rep)-fn;            % True Positive
tn = length(valid)-fp;      % True Negative
Pr = tp/(tp+fp);            % Precision 
Re = tp/(tp+fn);            % Recall (Probability of Detecion)
F1 = 2*(Pr*Re)/(Pr+Re);     % F1-score
FPR = fp/(fp+tn);           % False Positive Rate
TNR = tn/(fp+tn);           % True Negative Rate
fprintf('PROBABILITY OF DETECTION (by Author): %.1f%% \n',100*Re)
fprintf('FALSE NEGATIVE PERCENTAGE (by Author): %.1f%% \n',pfn)
fprintf('FALSE POSITIVE PERCENTAGE (by Author): %.1f%% \n\n',pfp)

% fprintf('\t\t\t\t CONFUSION MATRIX\n')
% fprintf('\t\t\t\t\t\t\t Actual Class\n')
% fprintf('\t\t\t\t\t\t Damaged \t Healthy\n')
% fprintf('\t\t\t\t\t\t---------------------\n')
% fprintf('\t\t\t Damaged\t|\t %i \t\t %i\n',tp,fp)
% fprintf('Predicted \t\t\t\t|\n')
% fprintf('\t\t\t Healthy\t|\t %i \t\t %i\n',fn,tn)

%% ROC CURVE
n1 = 100;
n2 = 5000;
for ii=1:n2
    thresh_0=linspace(0,n1,n2);
    y = Disthv;
    decis_h=y>thresh_0(ii);
    false_pos(ii) = sum(decis_h')/length(decis_h);
    yd = Distd;
    decis_d=yd>thresh_0(ii);
    true_detec(ii) = sum(decis_d')/length( decis_d);
end
figure
set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
plot(false_pos,true_detec,'ko-','linewidth',1,'MarkerSize',marker,'MarkerFaceColor','b')
grid on, grid minor
ylim([0 1])
ylabel('True-Detection Rate')
xlabel('False-Positive Rate')
set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')