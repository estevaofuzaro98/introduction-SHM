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
        axis([1e2 1e5 1e1 1e4])
    end
%     legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
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
        axis([1e2 1e5 1e-2 1e5])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-2 1e-1 1e0 1e1 1e2 1e3 1e4 1e5])
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
        axis([1e2 1e5 1e1 1e4])
    end
%     legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
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
        axis([1e2 1e5 1e-2 1e5])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-2 1e-1 1e0 1e1 1e2 1e3 1e4 1e5])
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
        axis([1e2 1e5 1e1 1e4])
    end
%     legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
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
        axis([1e2 1e5 1e-2 1e5])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-2 1e-1 1e0 1e1 1e2 1e3 1e4 1e5])
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
        axis([1e2 1e5 1e0 1e4])
    end
%     legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e0 1e1 1e2 1e3 1e4])
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
        axis([1e2 1e5 1e0 1e5])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4 1e5])
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
        axis([1e2 1e5 1e0 1e4])
    end
%     legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e0 1e1 1e2 1e3 1e4])
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
        axis([1e2 1e5 1e0 1e5])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4 1e5])
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
        axis([1e2 1e5 1e0 1e4])
    end
%     legend('Healthy','D1','D2','D3','D4','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e0 1e1 1e2 1e3 1e4])
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
        axis([1e2 1e5 1e0 1e5])
    end
    legend('Healthy','D1','D2','D3','D4','location','southwest','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-1 1e0 1e1 1e2 1e3 1e4 1e5])
    grid on, grid minor