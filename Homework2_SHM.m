%% INTRODUCTION TO SHM (2021/1) - HOMEWORK #2
% Professor: Samuel da Silva
% Student: Estevao Fuzaro de Almeida
% Date: 27/05/2021
clc; clear; close all
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');

txtsize = 18;       % Figures text size
axislimit = false;   % Limit Axis on Plots
f_i = 1e2;          % Initial Frequency
f_f = 1e3;          % Final Frequency
%% READING DATA OF PAMELA DATASET
% HEALTHY CONDITION
    % 24 Celsius Degrees
    	load('ImpedanceData\HealthyCondition\EMI24H.mat')
        Healthy24 = [freq_24H imag_24H real_24H];
        clear freq_24H imag_24H real_24H
        
    % 40 Celsius Degrees
        load('ImpedanceData\HealthyCondition\EMI40H.mat')
        Healthy40 = [freq_40H imag_40H real_40H];
        clear freq_40H imag_40H real_40H
        
    % 55 Celsius Degrees
        load('ImpedanceData\HealthyCondition\EMI55H.mat')
        Healthy55 = [freq_55H imag_55H real_55H];
        clear freq_55H imag_55H real_55H
        
    % 70 Celsius Degrees
        load('ImpedanceData\HealthyCondition\EMI70H.mat')
        Healthy70 = [freq_70H imag_70H real_70H];
        clear freq_70H imag_70H real_70H
        
    % 85 Celsius Degrees
        load('ImpedanceData\HealthyCondition\EMI85H.mat')
        Healthy85 = [freq_85H imag_85H real_85H];
        clear freq_85H imag_85H real_85H
        
    % 100 Celsius Degrees
        load('ImpedanceData\HealthyCondition\EMI100H.mat')
        Healthy100 = [freq_100H imag_100H real_100H];
        clear freq_100H imag_100H real_100H
        
% DAMAGED CONDITION
    % 24 Celsius Degrees
        % Damage 1
            load('ImpedanceData\DamagedCondition\T24degrees\EMI24D1.mat')
            Damaged24D1 = [freq_24D1 imag_24D1 real_24D1];
            clear freq_24D1 imag_24D1 real_24D1
        % Damage 2
            load('ImpedanceData\DamagedCondition\T24degrees\EMI24D2.mat')
            Damaged24D2 = [freq_24D2 imag_24D2 real_24D2];
            clear freq_24D2 imag_24D2 real_24D2
        % Damage 3
            load('ImpedanceData\DamagedCondition\T24degrees\EMI24D3.mat')
            Damaged24D3 = [freq_24D3 imag_24D3 real_24D3];
            clear freq_24D3 imag_24D3 real_24D3
        % Damage 4
            load('ImpedanceData\DamagedCondition\T24degrees\EMI24D4.mat')
            Damaged24D4 = [freq_24D4 imag_24D4 real_24D4];
            clear freq_24D4 imag_24D4 real_24D4
            
    % 40 Celsius Degrees
        % Damage 1
            load('ImpedanceData\DamagedCondition\T40degrees\EMI40D1.mat')
            Damaged40D1 = [freq_40D1 imag_40D1 real_40D1];
            clear freq_40D1 imag_40D1 real_40D1
        % Damage 2
            load('ImpedanceData\DamagedCondition\T40degrees\EMI40D2.mat')
            Damaged40D2 = [freq_40D2 imag_40D2 real_40D2];
            clear freq_40D2 imag_40D2 real_40D2
        % Damage 3
            load('ImpedanceData\DamagedCondition\T40degrees\EMI40D3.mat')
            Damaged40D3 = [freq_40D3 imag_40D3 real_40D3];
            clear freq_40D3 imag_40D3 real_40D3
        % Damage 4
            load('ImpedanceData\DamagedCondition\T40degrees\EMI40D4.mat')
            Damaged40D4 = [freq_40D4 imag_40D4 real_40D4];
            clear freq_40D4 imag_40D4 real_40D4
        
    % 55 Celsius Degrees
        % Damage 1
            load('ImpedanceData\DamagedCondition\T55degrees\EMI55D1.mat')
            Damaged55D1 = [freq_55D1 imag_55D1 real_55D1];
            clear freq_55D1 imag_55D1 real_55D1
        % Damage 2
            load('ImpedanceData\DamagedCondition\T55degrees\EMI55D2.mat')
            Damaged55D2 = [freq_55D2 imag_55D2 real_55D2];
            clear freq_55D2 imag_55D2 real_55D2
        % Damage 3
            load('ImpedanceData\DamagedCondition\T55degrees\EMI55D3.mat')
            Damaged55D3 = [freq_55D3 imag_55D3 real_55D3];
            clear freq_55D3 imag_55D3 real_55D3
        % Damage 4
            load('ImpedanceData\DamagedCondition\T55degrees\EMI55D4.mat')
            Damaged55D4 = [freq_55D4 imag_55D4 real_55D4];
            clear freq_55D4 imag_55D4 real_55D4
        
    % 70 Celsius Degrees
        % Damage 1
            load('ImpedanceData\DamagedCondition\T70degrees\EMI70D1.mat')
            Damaged70D1 = [freq_70D1 imag_70D1 real_70D1];
            clear freq_70D1 imag_70D1 real_70D1
        % Damage 2
            load('ImpedanceData\DamagedCondition\T70degrees\EMI70D2.mat')
            Damaged70D2 = [freq_70D2 imag_70D2 real_70D2];
            clear freq_70D2 imag_70D2 real_70D2
        % Damage 3
            load('ImpedanceData\DamagedCondition\T70degrees\EMI70D3.mat')
            Damaged70D3 = [freq_70D3 imag_70D3 real_70D3];
            clear freq_70D3 imag_70D3 real_70D3
        % Damage 4
            load('ImpedanceData\DamagedCondition\T70degrees\EMI70D4.mat')
            Damaged70D4 = [freq_70D4 imag_70D4 real_70D4];
            clear freq_70D4 imag_70D4 real_70D4
        
    % 85 Celsius Degrees
        % Damage 1
            load('ImpedanceData\DamagedCondition\T85degrees\EMI85D1.mat')
            Damaged85D1 = [freq_85D1 imag_85D1 real_85D1];
            clear freq_85D1 imag_85D1 real_85D1
        % Damage 2
            load('ImpedanceData\DamagedCondition\T85degrees\EMI85D2.mat')
            Damaged85D2 = [freq_85D2 imag_85D2 real_85D2];
            clear freq_85D2 imag_85D2 real_85D2
        % Damage 3
            load('ImpedanceData\DamagedCondition\T85degrees\EMI85D3.mat')
            Damaged85D3 = [freq_85D3 imag_85D3 real_85D3];
            clear freq_85D3 imag_85D3 real_85D3
        % Damage 4
            load('ImpedanceData\DamagedCondition\T85degrees\EMI85D4.mat')
            Damaged85D4 = [freq_85D4 imag_85D4 real_85D4];
            clear freq_85D4 imag_85D4 real_85D4
        
    % 100 Celsius Degrees
        % Damage 1
            load('ImpedanceData\DamagedCondition\T100degrees\EMI100D1.mat')
            Damaged100D1 = [freq_100D1 imag_100D1 real_100D1];
            clear freq_100D1 imag_100D1 real_100D1
        % Damage 2
            load('ImpedanceData\DamagedCondition\T100degrees\EMI100D2.mat')
            Damaged100D2 = [freq_100D2 imag_100D2 real_100D2];
            clear freq_100D2 imag_100D2 real_100D2
        % Damage 3
            load('ImpedanceData\DamagedCondition\T100degrees\EMI100D3.mat')
            Damaged100D3 = [freq_100D3 imag_100D3 real_100D3];
            clear freq_100D3 imag_100D3 real_100D3
        % Damage 4
            load('ImpedanceData\DamagedCondition\T100degrees\EMI100D4.mat')
            Damaged100D4 = [freq_100D4 imag_100D4 real_100D4];
            clear freq_100D4 imag_100D4 real_100D4

%% PLOTTING REAL AND IMAGINART PARTS
% 24 Celsius Degrees
    % Real Part
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    subplot(2,1,1)
    loglog(Healthy24(:,1),abs(Healthy24(:,3)),'m','linewidth',1.75), hold on
    loglog(Damaged24D1(:,1),abs(Damaged24D1(:,3)),'r','linewidth',1.75), hold on
    loglog(Damaged24D2(:,1),abs(Damaged24D2(:,3)),'k','linewidth',1.75), hold on
    loglog(Damaged24D3(:,1),abs(Damaged24D3(:,3)),'g','linewidth',1.75), hold on
    loglog(Damaged24D4(:,1),abs(Damaged24D4(:,3)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('24$^\circ$C')
    if axislimit == true
        axis([1e3 1e5 1e1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e1 1e2 1e3 1e4])
    grid on, grid minor
    % Imaginary Part
    subplot(2,1,2)
    loglog(Healthy24(:,1),abs(Healthy24(:,2)),'m','linewidth',1.75), hold on
    loglog(Damaged24D1(:,1),abs(Damaged24D1(:,2)),'r','linewidth',1.75), hold on
    loglog(Damaged24D2(:,1),abs(Damaged24D2(:,2)),'k','linewidth',1.75), hold on
    loglog(Damaged24D3(:,1),abs(Damaged24D3(:,2)),'g','linewidth',1.75), hold on
    loglog(Damaged24D4(:,1),abs(Damaged24D4(:,2)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Im\{Z(\Omega)\}$')
    if axislimit == true
        axis([0.5e4 1e5 1e-1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4])
    grid on, grid minor
    
% 40 Celsius Degrees
    % Real Part
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    subplot(2,1,1)
    loglog(Healthy40(:,1),abs(Healthy40(:,3)),'m','linewidth',1.75), hold on
    loglog(Damaged40D1(:,1),abs(Damaged40D1(:,3)),'r','linewidth',1.75), hold on
    loglog(Damaged40D2(:,1),abs(Damaged40D2(:,3)),'k','linewidth',1.75), hold on
    loglog(Damaged40D3(:,1),abs(Damaged40D3(:,3)),'g','linewidth',1.75), hold on
    loglog(Damaged40D4(:,1),abs(Damaged40D4(:,3)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('40$^\circ$C')
    if axislimit == true
        axis([1e3 1e5 1e1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e1 1e2 1e3 1e4])
    grid on, grid minor
    % Imaginary Part
    subplot(2,1,2)
    loglog(Healthy40(:,1),abs(Healthy40(:,2)),'m','linewidth',1.75), hold on
    loglog(Damaged40D1(:,1),abs(Damaged40D1(:,2)),'r','linewidth',1.75), hold on
    loglog(Damaged40D2(:,1),abs(Damaged40D2(:,2)),'k','linewidth',1.75), hold on
    loglog(Damaged40D3(:,1),abs(Damaged40D3(:,2)),'g','linewidth',1.75), hold on
    loglog(Damaged40D4(:,1),abs(Damaged40D4(:,2)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Im\{Z(\Omega)\}$')
    if axislimit == true
        axis([0.5e4 1e5 1e-1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4])
    grid on, grid minor
    
% 55 Celsius Degrees
    % Real Part
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    subplot(2,1,1)
    loglog(Healthy55(:,1),abs(Healthy55(:,3)),'m','linewidth',1.75), hold on
    loglog(Damaged55D1(:,1),abs(Damaged55D1(:,3)),'r','linewidth',1.75), hold on
    loglog(Damaged55D2(:,1),abs(Damaged55D2(:,3)),'k','linewidth',1.75), hold on
    loglog(Damaged55D3(:,1),abs(Damaged55D3(:,3)),'g','linewidth',1.75), hold on
    loglog(Damaged55D4(:,1),abs(Damaged55D4(:,3)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('55$^\circ$C')
    if axislimit == true
        axis([1e3 1e5 1e1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e1 1e2 1e3 1e4])
    grid on, grid minor
    % Imaginary Part
    subplot(2,1,2)
    loglog(Healthy55(:,1),abs(Healthy55(:,2)),'m','linewidth',1.75), hold on
    loglog(Damaged55D1(:,1),abs(Damaged55D1(:,2)),'r','linewidth',1.75), hold on
    loglog(Damaged55D2(:,1),abs(Damaged55D2(:,2)),'k','linewidth',1.75), hold on
    loglog(Damaged55D3(:,1),abs(Damaged55D3(:,2)),'g','linewidth',1.75), hold on
    loglog(Damaged55D4(:,1),abs(Damaged55D4(:,2)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Im\{Z(\Omega)\}$')
    if axislimit == true
        axis([0.5e4 1e5 1e-1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4])
    grid on, grid minor
    
% 70 Celsius Degrees
    % Real Part
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    subplot(2,1,1)
    loglog(Healthy70(:,1),abs(Healthy70(:,3)),'m','linewidth',1.75), hold on
    loglog(Damaged70D1(:,1),abs(Damaged70D1(:,3)),'r','linewidth',1.75), hold on
    loglog(Damaged70D2(:,1),abs(Damaged70D2(:,3)),'k','linewidth',1.75), hold on
    loglog(Damaged70D3(:,1),abs(Damaged70D3(:,3)),'g','linewidth',1.75), hold on
    loglog(Damaged70D4(:,1),abs(Damaged70D4(:,3)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('70$^\circ$C')
    if axislimit == true
        axis([1e3 1e5 1e1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e1 1e2 1e3 1e4])
    grid on, grid minor
    % Imaginary Part
    subplot(2,1,2)
    loglog(Healthy70(:,1),abs(Healthy70(:,2)),'m','linewidth',1.75), hold on
    loglog(Damaged70D1(:,1),abs(Damaged70D1(:,2)),'r','linewidth',1.75), hold on
    loglog(Damaged70D2(:,1),abs(Damaged70D2(:,2)),'k','linewidth',1.75), hold on
    loglog(Damaged70D3(:,1),abs(Damaged70D3(:,2)),'g','linewidth',1.75), hold on
    loglog(Damaged70D4(:,1),abs(Damaged70D4(:,2)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Im\{Z(\Omega)\}$')
    if axislimit == true
        axis([0.5e4 1e5 1e-1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4])
    grid on, grid minor
    
% 85 Celsius Degrees
    % Real Part
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    subplot(2,1,1)
    loglog(Healthy85(:,1),abs(Healthy85(:,3)),'m','linewidth',1.75), hold on
    loglog(Damaged85D1(:,1),abs(Damaged85D1(:,3)),'r','linewidth',1.75), hold on
    loglog(Damaged85D2(:,1),abs(Damaged85D2(:,3)),'k','linewidth',1.75), hold on
    loglog(Damaged85D3(:,1),abs(Damaged85D3(:,3)),'g','linewidth',1.75), hold on
    loglog(Damaged85D4(:,1),abs(Damaged85D4(:,3)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('85$^\circ$C')
    if axislimit == true
        axis([1e3 1e5 1e1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e1 1e2 1e3 1e4])
    grid on, grid minor
    % Imaginary Part
    subplot(2,1,2)
    loglog(Healthy85(:,1),abs(Healthy85(:,2)),'m','linewidth',1.75), hold on
    loglog(Damaged85D1(:,1),abs(Damaged85D1(:,2)),'r','linewidth',1.75), hold on
    loglog(Damaged85D2(:,1),abs(Damaged85D2(:,2)),'k','linewidth',1.75), hold on
    loglog(Damaged85D3(:,1),abs(Damaged85D3(:,2)),'g','linewidth',1.75), hold on
    loglog(Damaged85D4(:,1),abs(Damaged85D4(:,2)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Im\{Z(\Omega)\}$')
    if axislimit == true
        axis([0.5e4 1e5 1e-1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4])
    grid on, grid minor
    
% 100 Celsius Degrees
    % Real Part
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    subplot(2,1,1)
    loglog(Healthy100(:,1),abs(Healthy100(:,3)),'m','linewidth',1.75), hold on
    loglog(Damaged100D1(:,1),abs(Damaged100D1(:,3)),'r','linewidth',1.75), hold on
    loglog(Damaged100D2(:,1),abs(Damaged100D2(:,3)),'k','linewidth',1.75), hold on
    loglog(Damaged100D3(:,1),abs(Damaged100D3(:,3)),'g','linewidth',1.75), hold on
    loglog(Damaged100D4(:,1),abs(Damaged100D4(:,3)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('100$^\circ$C')
    if axislimit == true
        axis([1e3 1e5 1e1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e1 1e2 1e3 1e4])
    grid on, grid minor
    % Imaginary Part
    subplot(2,1,2)
    loglog(Healthy100(:,1),abs(Healthy100(:,2)),'m','linewidth',1.75), hold on
    loglog(Damaged100D1(:,1),abs(Damaged100D1(:,2)),'r','linewidth',1.75), hold on
    loglog(Damaged100D2(:,1),abs(Damaged100D2(:,2)),'k','linewidth',1.75), hold on
    loglog(Damaged100D3(:,1),abs(Damaged100D3(:,2)),'g','linewidth',1.75), hold on
    loglog(Damaged100D4(:,1),abs(Damaged100D4(:,2)),'b','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Im\{Z(\Omega)\}$')
    if axislimit == true
        axis([0.5e4 1e5 1e-1 1e3])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4])
    grid on, grid minor
    
%% RMSD
    % Healthy
    [rmsdRealH24, rmsdImagH24] = RMSD(Healthy24,Healthy24,f_i,f_f);
    [rmsdRealH40, rmsdImagH40] = RMSD(Healthy40,Healthy24,f_i,f_f);
    [rmsdRealH55, rmsdImagH55] = RMSD(Healthy55,Healthy24,f_i,f_f);
    [rmsdRealH70, rmsdImagH70] = RMSD(Healthy70,Healthy24,f_i,f_f);
    [rmsdRealH85, rmsdImagH85] = RMSD(Healthy85,Healthy24,f_i,f_f);
    [rmsdRealH100, rmsdImagH100] = RMSD(Healthy100,Healthy24,f_i,f_f);
    % Damage 1
    [rmsdRealD124, rmsdImagD124] = RMSD(Damaged24D1,Healthy24,f_i,f_f);
    [rmsdRealD140, rmsdImagD140] = RMSD(Damaged40D1,Healthy24,f_i,f_f);
    [rmsdRealD155, rmsdImagD155] = RMSD(Damaged55D1,Healthy24,f_i,f_f);
    [rmsdRealD170, rmsdImagD170] = RMSD(Damaged70D1,Healthy24,f_i,f_f);
    [rmsdRealD185, rmsdImagD185] = RMSD(Damaged85D1,Healthy24,f_i,f_f);
    [rmsdRealD1100, rmsdImagD1100] = RMSD(Damaged100D1,Healthy24,f_i,f_f);
    % Damage 2
    [rmsdRealD224, rmsdImagD224] = RMSD(Damaged24D2,Healthy24,f_i,f_f);
    [rmsdRealD240, rmsdImagD240] = RMSD(Damaged40D2,Healthy24,f_i,f_f);
    [rmsdRealD255, rmsdImagD255] = RMSD(Damaged55D2,Healthy24,f_i,f_f);
    [rmsdRealD270, rmsdImagD270] = RMSD(Damaged70D2,Healthy24,f_i,f_f);
    [rmsdRealD285, rmsdImagD285] = RMSD(Damaged85D2,Healthy24,f_i,f_f);
    [rmsdRealD2100, rmsdImagD2100] = RMSD(Damaged100D2,Healthy24,f_i,f_f);
    % Damage 3
    [rmsdRealD324, rmsdImagD324] = RMSD(Damaged24D3,Healthy24,f_i,f_f);
    [rmsdRealD340, rmsdImagD340] = RMSD(Damaged40D3,Healthy24,f_i,f_f);
    [rmsdRealD355, rmsdImagD355] = RMSD(Damaged55D3,Healthy24,f_i,f_f);
    [rmsdRealD370, rmsdImagD370] = RMSD(Damaged70D3,Healthy24,f_i,f_f);
    [rmsdRealD385, rmsdImagD385] = RMSD(Damaged85D3,Healthy24,f_i,f_f);
    [rmsdRealD3100, rmsdImagD3100] = RMSD(Damaged100D3,Healthy24,f_i,f_f);
    % Damage 4
    [rmsdRealD424, rmsdImagD424] = RMSD(Damaged24D4,Healthy24,f_i,f_f);
    [rmsdRealD440, rmsdImagD440] = RMSD(Damaged40D4,Healthy24,f_i,f_f);
    [rmsdRealD455, rmsdImagD455] = RMSD(Damaged55D4,Healthy24,f_i,f_f);
    [rmsdRealD470, rmsdImagD470] = RMSD(Damaged70D4,Healthy24,f_i,f_f);
    [rmsdRealD485, rmsdImagD485] = RMSD(Damaged85D4,Healthy24,f_i,f_f);
    [rmsdRealD4100, rmsdImagD4100] = RMSD(Damaged100D4,Healthy24,f_i,f_f);
    
    % REAL RMSD 3D PLOT
    rmsdReal = [rmsdRealH24, rmsdRealH40, rmsdRealH55, rmsdRealH70, rmsdRealH85, rmsdRealH100;
                rmsdRealD124, rmsdRealD140, rmsdRealD155, rmsdRealD170, rmsdRealD185, rmsdRealD1100;
                rmsdRealD224, rmsdRealD240, rmsdRealD255, rmsdRealD270, rmsdRealD285, rmsdRealD2100;
                rmsdRealD324, rmsdRealD340, rmsdRealD355, rmsdRealD370, rmsdRealD385, rmsdRealD3100;
                rmsdRealD424, rmsdRealD440, rmsdRealD455, rmsdRealD470, rmsdRealD485, rmsdRealD4100;];
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    bar3(rmsdReal)
    xlabel('Temperatures')
    ylabel('Struct. States')
    zlabel('RMSD [Real]')
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
    set(gca,'XTickLabel',{'24$^{\circ}$C','40$^{\circ}$C','55$^{\circ}$C','70$^{\circ}$C','85$^{\circ}$C','100$^{\circ}$C'})
    set(gca,'YTickLabel',{'H','D1','D2','D3','D4'})
    
    % IMAGINARY RMSD 3D PLOT
    rmsdImag = [rmsdImagH24, rmsdImagH40, rmsdImagH55, rmsdImagH70, rmsdImagH85, rmsdImagH100;
                rmsdImagD124, rmsdImagD140, rmsdImagD155, rmsdImagD170, rmsdImagD185, rmsdImagD1100;
                rmsdImagD224, rmsdImagD240, rmsdImagD255, rmsdImagD270, rmsdImagD285, rmsdImagD2100;
                rmsdImagD324, rmsdImagD340, rmsdImagD355, rmsdImagD370, rmsdImagD385, rmsdImagD3100;
                rmsdImagD424, rmsdImagD440, rmsdImagD455, rmsdImagD470, rmsdImagD485, rmsdImagD4100;];
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    bar3(rmsdImag)
    xlabel('Temperatures')
    ylabel('Struct. States')
    zlabel('RMSD [Imag]')
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
    set(gca,'XTickLabel',{'24$^{\circ}$C','40$^{\circ}$C','55$^{\circ}$C','70$^{\circ}$C','85$^{\circ}$C','100$^{\circ}$C'})
    set(gca,'YTickLabel',{'H','D1','D2','D3','D4'})