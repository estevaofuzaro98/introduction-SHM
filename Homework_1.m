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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reference model - healthy
nt = randi(100); % chose random test

% data structure
data = iddata(yh(nt,:)',[],dt);
order = 20;

% order model
for i=1:order
    model = ar(data,i);         % AR model
    akaike(i) = aic(model);     % Akaike's Information Criterion 
end

marcador = 15;
txtsize = 25;
figure
plot(1:order,akaike,'ob-','MarkerSize',marcador); grid minor
xlabel('order','FontSize',txtsize,'interpreter','latex'); 
ylabel('AIC','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
% saveas(gcf,'aic.eps','epsc');

na = 4; % order
model_h = ar(data,na);  % reference model
aux = pe(model_h,data);
e_ref = aux.OutputData;     % reference error
Ref = var(e_ref);
yp = predict(model_h,data,1);

figure
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
plot(t,yh(nt,:),'r', 'linewidth',2); hold on; grid minor
plot(t,yp.OutputData,'b--', 'linewidth',1);
xlim([0 t(length(t))])
xlabel('Time (s)','FontSize',txtsize,'interpreter','latex'); 
ylabel('y','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
l = legend('Experimental - healthy','AR prediction','Location','northeast');
set(l,'interpreter', 'latex')
set(l,'FontSize',txtsize);
% saveas(gcf,'predict.eps','epsc');

% damage example
datad = iddata(yd(nt,:,5)',[],dt);
yp = predict(model_h,datad,1);

figure
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
plot(t,yd(nt,:,5),'r', 'linewidth',2); hold on; grid minor
plot(t,yp.OutputData,'b--', 'linewidth',1);
xlim([0 t(length(t))])
xlabel('Time (s)','FontSize',txtsize,'interpreter','latex'); 
ylabel('y','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
l = legend('Experimental - damaged','AR prediction','Location','northeast');
set(l,'interpreter', 'latex')
set(l,'FontSize',txtsize);
% saveas(gcf,'predictd.eps','epsc');

for i =1:rep
    % prediction error using healthy data
    data = iddata(yh(i,:)',[],dt);
    aux = pe(model_h,data);
    errorh(i,:)  = aux.OutputData;           
    Gammah(i) = var(errorh(i,:))/Ref;        % damage index
    % prediction error using damaged data
    for k = 1:5
    data = iddata(yd(i,:,k)',[],dt);
    aux = pe(model_h,data);
    errord  = aux.OutputData;           
    Gammad(i,k) = var(errord)/Ref; 
    end
end

figure
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
semilogy(1:rep,Gammah,'ob','MarkerSize',marcador); grid minor; hold on
semilogy(rep+1:2*rep,Gammad(:,1),'dr','MarkerSize',marcador); 
semilogy(2*rep+1:3*rep,Gammad(:,2),'dr','MarkerSize',marcador); 
semilogy(3*rep+1:4*rep,Gammad(:,3),'dr','MarkerSize',marcador); 
semilogy(4*rep+1:5*rep,Gammad(:,4),'dr','MarkerSize',marcador); 
semilogy(5*rep+1:6*rep,Gammad(:,5),'dr','MarkerSize',marcador); 
xlabel('Tests','FontSize',txtsize,'interpreter','latex'); 
ylabel('$\gamma$','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
l = legend('Healthy','Damaged','Location','northwest');
set(l,'interpreter', 'latex')
set(l,'FontSize',txtsize);
% saveas(gcf,'gammae.eps','epsc');
%save ARfeatures Gammah Gammad

%% NATASHA - classificatioN of structurAl sTAteS maHalAnobis distance
%clc; clear; 

% Load Data - features
%load dados          % Natural frequencies
%load ARfeatures     % AR prediction error
                    
% plot - learning features
% using half of data for learning and half for validation
observation = randperm(rep);
learn = observation(1:rep/2);
valida = observation(rep/2+1:rep);

% Learning data
Xh = NatFreqh(learn)';
Yh = Gammah(learn)';
marcador = 15;
txtsize = 35;
figure
set(gcf,'Unit', 'Normalized', 'OuterPosition', [0 0 1 1]);
plot(Xh,Yh,'ob','MarkerSize',marcador); hold on; grid minor
ylabel('$\gamma$','FontSize',txtsize,'interpreter','latex'); 
xlabel('Natural Frequency','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
% saveas(gcf,'learning_features.eps','epsc');

% Validation data - healthy state
Xhv = NatFreqh(valida)';
Yhv = Gammah(valida)';

% Validation data - damaged state
G = [Gammad(:,1); Gammad(:,2); Gammad(:,3); Gammad(:,4); Gammad(:,5)];
F = [NatFreqd(:,1); NatFreqd(:,2); NatFreqd(:,3); NatFreqd(:,4); NatFreqd(:,5)];

figure
set(gcf,'Unit', 'Normalized', 'OuterPosition', [0 0 1 1]);
plot(Xhv,Yhv,'ob','MarkerSize',marcador); hold on; grid minor
plot(F,G,'ob','MarkerSize',marcador); 
ylabel('$\gamma$','FontSize',txtsize,'interpreter','latex'); 
xlabel('Natural Frequency','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
% saveas(gcf,'validation_features.eps','epsc');

% Learning a statistical model
Disth = mahal([Xh Yh],[Xh Yh]);         % learning
Disthv = mahal([Xhv Yhv],[Xh Yh]);      % healthy validation
Distd = mahal([F G],[Xh Yh]);           % damaged validation

figure
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
semilogy(learn,Disth,'ob','MarkerSize',marcador); grid minor; hold on
semilogy(valida,Disthv ,'xk','MarkerSize',marcador); 
semilogy(rep+1:rep+5*rep,Distd,'dr','MarkerSize',marcador); 
xlabel('Tests','FontSize',txtsize,'interpreter','latex'); 
ylabel('$\mathcal D^2$','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
l = legend('Healthy - learning data','Healthy - validation data','Damaged - validation data','Location','southeast');
set(l,'interpreter', 'latex')
set(l,'FontSize',txtsize);
% saveas(gcf,'Mahal.eps','epsc');

X = [Xh Yh];
Y = [Xh Yh
    Xhv Yhv;
      F  G];
D=  [Disth
    Disthv
     Distd];

figure
set(gcf,'Unit', 'Normalized', 'OuterPosition', [0 0 1 1]);
scatter(X(:,1),X(:,2),50,'.') % Scatter plot
hold on; box on;
scatter(Y(:,1),Y(:,2),600,D,'o','filled')
hb = colorbar;
ylabel(hb,'Mahalanobis Distance','FontSize',txtsize,'interpreter','latex'); 
ylabel('$\gamma$','FontSize',txtsize,'interpreter','latex'); 
xlabel('Natural Frequency','FontSize',txtsize,'interpreter','latex'); 
set(gca,'FontSize',txtsize ,'TickLabelInterpreter','latex')
% saveas(gcf,'Dist.eps','epsc');
save index Disth Disthv Distd Rep learn valida

load allfeatures
%% Fn - Var
auxfn = randperm(length(FnH));
trainfn = auxfn(1:length(auxfn)/2);
testfn = auxfn(length(auxfn)/2 + 1 : length(auxfn));
auxvar = randperm(length(varH));
trainvar = auxvar(1:length(auxvar)/2);
testvar = auxvar(length(auxvar)/2 + 1 : length(auxvar));
Xref = [FnH(trainfn)' varH(trainvar)'];
Xtest = [FnH(testfn)' varH(testvar)'];
dist_h_train = mahal(Xref,Xref);
dist_h_test = mahal(Xtest,Xref);
dist_h = [dist_h_train;dist_h_test];

ns = 100;

YD1 = [(FnD(1:ns))' (varD(1:ns))'];
dist_D1 = mahal(YD1,Xref);
YD2 = [(FnD(ns+1:2*ns))' (varD(ns+1:2*ns))'];
dist_D2 = mahal(YD2,Xref);
YD3 = [(FnD(2*ns+1:3*ns))' (varD(2*ns+1:3*ns))'];
dist_D3 = mahal(YD3,Xref);
YD4 = [(FnD(3*ns+1:4*ns))' (varD(3*ns+1:4*ns))'];
dist_D4 = mahal(YD4,Xref);
YD5 = [(FnD(4*ns+1:5*ns))' (varD(4*ns+1:5*ns))'];
dist_D5 = mahal(YD5,Xref);

dist_d = [dist_D1; dist_D2; dist_D3; dist_D4; dist_D5];
dist = [dist_h; dist_d];
save DIvar dist_D1 dist_D2 dist_D3 dist_D4 dist_D5 dist_h dist_d dist_h_train dist_h_test trainfn testfn

figure()
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
semilogy(trainfn,dist_h_train,'bo','MarkerSize',7); grid minor ; hold on
semilogy(testfn,dist_h_test,'kx','MarkerSize',7);
semilogy(ns+1:(ns*2),dist_D1,'rs','MarkerSize',7);
semilogy(0:(ns*6),max(dist_h_train)*ones(1,(ns*6 +1)),'--k','linewidth',2);
semilogy((ns*2)+1:(ns*3),dist_D2,'rs','MarkerSize',7);
semilogy((ns*3)+1:(ns*4),dist_D3,'rs','MarkerSize',7);
semilogy((ns*4)+1:(ns*5),dist_D4,'rs','MarkerSize',7);
semilogy((ns*5)+1:(ns*6),dist_D5,'rs','MarkerSize',7);
xlabel('Observations','interpreter','latex');
ylabel('$\mathcal{D}^2$','interpreter','latex');
l = legend('Healthy - training','Healthy - testing','Damaged','Threshold','Location','NorthWest');
set(l,'FontSize',20,'interpreter', 'latex')
set(gca,'FontSize',26,'TickLabelInterpreter','latex')
ylim([-100000000 100000000]);
xlim([0 600]);

%% Fn - Norm
auxfn = randperm(length(FnH));
trainfn = auxfn(1:length(auxfn)/2);
testfn = auxfn(length(auxfn)/2 + 1 : length(auxfn));
auxnorm = randperm(length(normH));
trainnorm = auxnorm(1:length(auxnorm)/2);
testnorm = auxnorm(length(auxnorm)/2 + 1 : length(auxnorm));
Xref = [FnH(trainfn)' varH(trainnorm)'];
Xtest = [FnH(testfn)' varH(testnorm)'];
dist_h_train = mahal(Xref,Xref);
dist_h_test = mahal(Xtest,Xref);
dist_h = [dist_h_train;dist_h_test];

ns = 100;

YD1 = [(FnD(1:100))' (normD(1:100))'];
dist_D1 = mahal(YD1,Xref);
YD2 = [(FnD(101:200))' (normD(101:200))'];
dist_D2 = mahal(YD2,Xref);
YD3 = [(FnD(201:300))' (normD(201:300))'];
dist_D3 = mahal(YD3,Xref);
YD4 = [(FnD(301:400))' (normD(301:400))'];
dist_D4 = mahal(YD4,Xref);
YD5 = [(FnD(401:500))' (normD(401:500))'];
dist_D5 = mahal(YD5,Xref);

dist_d = [dist_D1; dist_D2; dist_D3; dist_D4; dist_D5];
dist = [dist_h; dist_d];
save DInorm dist_D1 dist_D2 dist_D3 dist_D4 dist_D5 dist_h dist_d dist_h_train dist_h_test trainfn testfn

figure()
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
semilogy(trainfn,dist_h_train,'bo','MarkerSize',7); grid minor ; hold on
semilogy(testfn,dist_h_test,'kx','MarkerSize',7);
semilogy(ns+1:(ns*2),dist_D1,'rs','MarkerSize',7);
semilogy(0:(ns*6),max(dist_h_train)*ones(1,(ns*6 +1)),'--k','linewidth',2);
semilogy((ns*2)+1:(ns*3),dist_D2,'rs','MarkerSize',7);
semilogy((ns*3)+1:(ns*4),dist_D3,'rs','MarkerSize',7);
semilogy((ns*4)+1:(ns*5),dist_D4,'rs','MarkerSize',7);
semilogy((ns*5)+1:(ns*6),dist_D5,'rs','MarkerSize',7);
xlabel('Observations','interpreter','latex');
ylabel('$\mathcal{D}^2$','interpreter','latex');
l = legend('Healthy - training','Healthy - testing','Damaged','Threshold','Location','NorthWest');
set(l,'FontSize',20,'interpreter', 'latex')
set(gca,'FontSize',26,'TickLabelInterpreter','latex')
ylim([-100000000 100000000]);
xlim([0 600]);
%% Fn - Kurt
auxfn = randperm(length(FnH));
trainfn = auxfn(1:length(auxfn)/2);
testfn = auxfn(length(auxfn)/2 + 1 : length(auxfn));
auxkurt = randperm(length(kurtH));
trainkurt = auxkurt(1:length(auxkurt)/2);
testkurt = auxkurt(length(auxkurt)/2 + 1 : length(auxkurt));
Xref = [FnH(trainfn)' varH(trainkurt)'];
Xtest = [FnH(testfn)' varH(testkurt)'];
dist_h_train = mahal(Xref,Xref);
dist_h_test = mahal(Xtest,Xref);
dist_h = [dist_h_train;dist_h_test];

ns = 100;

YD1 = [(FnD(1:100))' (kurtD(1:100))'];
dist_D1 = mahal(YD1,Xref);
YD2 = [(FnD(101:200))' (kurtD(101:200))'];
dist_D2 = mahal(YD2,Xref);
YD3 = [(FnD(201:300))' (kurtD(201:300))'];
dist_D3 = mahal(YD3,Xref);
YD4 = [(FnD(301:400))' (kurtD(301:400))'];
dist_D4 = mahal(YD4,Xref);
YD5 = [(FnD(401:500))' (kurtD(401:500))'];
dist_D5 = mahal(YD5,Xref);

dist_d = [dist_D1; dist_D2; dist_D3; dist_D4; dist_D5];
dist = [dist_h; dist_d];
save DIkurt dist_D1 dist_D2 dist_D3 dist_D4 dist_D5 dist_h dist_d dist_h_train dist_h_test trainfn testfn

figure()
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
semilogy(trainfn,dist_h_train,'bo','MarkerSize',7); grid minor ; hold on
semilogy(testfn,dist_h_test,'kx','MarkerSize',7);
semilogy(ns+1:(ns*2),dist_D1,'rs','MarkerSize',7);
semilogy(0:(ns*6),max(dist_h_train)*ones(1,(ns*6 +1)),'--k','linewidth',2);
semilogy((ns*2)+1:(ns*3),dist_D2,'rs','MarkerSize',7);
semilogy((ns*3)+1:(ns*4),dist_D3,'rs','MarkerSize',7);
semilogy((ns*4)+1:(ns*5),dist_D4,'rs','MarkerSize',7);
semilogy((ns*5)+1:(ns*6),dist_D5,'rs','MarkerSize',7);
xlabel('Observations','interpreter','latex');
ylabel('$\mathcal{D}^2$','interpreter','latex');
l = legend('Healthy - training','Healthy - testing','Damaged','Threshold','Location','NorthWest');
set(l,'FontSize',20,'interpreter', 'latex')
set(gca,'FontSize',26,'TickLabelInterpreter','latex')
ylim([-100000000 100000000]);
xlim([0 600]);
%% Fn - Gamma
auxfn = randperm(length(FnH));
trainfn = auxfn(1:length(auxfn)/2);
testfn = auxfn(length(auxfn)/2 + 1 : length(auxfn));
auxgamma = randperm(length(gammaH));
traingamma = auxgamma(1:length(auxgamma)/2);
testgamma = auxgamma(length(auxgamma)/2 + 1 : length(auxgamma));
Xref = [FnH(trainfn)' varH(traingamma)'];
Xtest = [FnH(testfn)' varH(testgamma)'];
dist_h_train = mahal(Xref,Xref);
dist_h_test = mahal(Xtest,Xref);
dist_h = [dist_h_train;dist_h_test];

ns = 100;

YD1 = [(FnD(1:100))' (gammaD(1:100))'];
dist_D1 = mahal(YD1,Xref);
YD2 = [(FnD(101:200))' (gammaD(101:200))'];
dist_D2 = mahal(YD2,Xref);
YD3 = [(FnD(201:300))' (gammaD(201:300))'];
dist_D3 = mahal(YD3,Xref);
YD4 = [(FnD(301:400))' (gammaD(301:400))'];
dist_D4 = mahal(YD4,Xref);
YD5 = [(FnD(401:500))' (gammaD(401:500))'];
dist_D5 = mahal(YD5,Xref);

dist_d = [dist_D1; dist_D2; dist_D3; dist_D4; dist_D5];
dist = [dist_h; dist_d];
save DIgamma dist_D1 dist_D2 dist_D3 dist_D4 dist_D5 dist_h dist_d dist_h_train dist_h_test trainfn testfn

figure()
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 0.6]);
semilogy(trainfn,dist_h_train,'bo','MarkerSize',7); grid minor ; hold on
semilogy(testfn,dist_h_test,'kx','MarkerSize',7);
semilogy(ns+1:(ns*2),dist_D1,'rs','MarkerSize',7);
semilogy(0:(ns*6),max(dist_h_train)*ones(1,(ns*6 +1)),'--k','linewidth',2);
semilogy((ns*2)+1:(ns*3),dist_D2,'rs','MarkerSize',7);
semilogy((ns*3)+1:(ns*4),dist_D3,'rs','MarkerSize',7);
semilogy((ns*4)+1:(ns*5),dist_D4,'rs','MarkerSize',7);
semilogy((ns*5)+1:(ns*6),dist_D5,'rs','MarkerSize',7);
xlabel('Observations','interpreter','latex');
ylabel('$\mathcal{D}^2$','interpreter','latex');
l = legend('Healthy - training','Healthy - testing','Damaged','Threshold','Location','NorthWest');
set(l,'FontSize',20,'interpreter', 'latex')
set(gca,'FontSize',26,'TickLabelInterpreter','latex')
ylim([-100000000 100000000]);
xlim([0 600]);