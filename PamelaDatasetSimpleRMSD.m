%% RMSD - Freq: fi <=> ff Hz
    % Healthy
    [rmsdRealH24, rmsdImagH24] = RMSD(Healthy24,Healthy24,fi,ff);
    [rmsdRealH40, rmsdImagH40] = RMSD(Healthy40,Healthy24,fi,ff);
    [rmsdRealH55, rmsdImagH55] = RMSD(Healthy55,Healthy24,fi,ff);
    [rmsdRealH70, rmsdImagH70] = RMSD(Healthy70,Healthy24,fi,ff);
    [rmsdRealH85, rmsdImagH85] = RMSD(Healthy85,Healthy24,fi,ff);
    [rmsdRealH100, rmsdImagH100] = RMSD(Healthy100,Healthy24,fi,ff);
    % Damage 1
    [rmsdRealD124, rmsdImagD124] = RMSD(Damaged24D1,Healthy24,fi,ff);
    [rmsdRealD140, rmsdImagD140] = RMSD(Damaged40D1,Healthy24,fi,ff);
    [rmsdRealD155, rmsdImagD155] = RMSD(Damaged55D1,Healthy24,fi,ff);
    [rmsdRealD170, rmsdImagD170] = RMSD(Damaged70D1,Healthy24,fi,ff);
    [rmsdRealD185, rmsdImagD185] = RMSD(Damaged85D1,Healthy24,fi,ff);
    [rmsdRealD1100, rmsdImagD1100] = RMSD(Damaged100D1,Healthy24,fi,ff);
    % Damage 2
    [rmsdRealD224, rmsdImagD224] = RMSD(Damaged24D2,Healthy24,fi,ff);
    [rmsdRealD240, rmsdImagD240] = RMSD(Damaged40D2,Healthy24,fi,ff);
    [rmsdRealD255, rmsdImagD255] = RMSD(Damaged55D2,Healthy24,fi,ff);
    [rmsdRealD270, rmsdImagD270] = RMSD(Damaged70D2,Healthy24,fi,ff);
    [rmsdRealD285, rmsdImagD285] = RMSD(Damaged85D2,Healthy24,fi,ff);
    [rmsdRealD2100, rmsdImagD2100] = RMSD(Damaged100D2,Healthy24,fi,ff);
    % Damage 3
    [rmsdRealD324, rmsdImagD324] = RMSD(Damaged24D3,Healthy24,fi,ff);
    [rmsdRealD340, rmsdImagD340] = RMSD(Damaged40D3,Healthy24,fi,ff);
    [rmsdRealD355, rmsdImagD355] = RMSD(Damaged55D3,Healthy24,fi,ff);
    [rmsdRealD370, rmsdImagD370] = RMSD(Damaged70D3,Healthy24,fi,ff);
    [rmsdRealD385, rmsdImagD385] = RMSD(Damaged85D3,Healthy24,fi,ff);
    [rmsdRealD3100, rmsdImagD3100] = RMSD(Damaged100D3,Healthy24,fi,ff);
    % Damage 4
    [rmsdRealD424, rmsdImagD424] = RMSD(Damaged24D4,Healthy24,fi,ff);
    [rmsdRealD440, rmsdImagD440] = RMSD(Damaged40D4,Healthy24,fi,ff);
    [rmsdRealD455, rmsdImagD455] = RMSD(Damaged55D4,Healthy24,fi,ff);
    [rmsdRealD470, rmsdImagD470] = RMSD(Damaged70D4,Healthy24,fi,ff);
    [rmsdRealD485, rmsdImagD485] = RMSD(Damaged85D4,Healthy24,fi,ff);
    [rmsdRealD4100, rmsdImagD4100] = RMSD(Damaged100D4,Healthy24,fi,ff);
    
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
    zlabel('$\alpha_d$')
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
    zlabel('$\alpha_t$')
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')
    set(gca,'XTickLabel',{'24$^{\circ}$C','40$^{\circ}$C','55$^{\circ}$C','70$^{\circ}$C','85$^{\circ}$C','100$^{\circ}$C'})
    set(gca,'YTickLabel',{'H','D1','D2','D3','D4'})
    
    % RMSD Real x Imaginary
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    plot(rmsdReal,rmsdImag,'o','linewidth',8,'markersize',8)
    xlabel('$\alpha_d$')
    ylabel('$\alpha_t$')
    text(rmsdReal(1,:),rmsdImag(1,:),{'H','H','H','H','H','H'},'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',14)
    text(rmsdReal(2,:),rmsdImag(2,:),{'D1','D1','D1','D1','D1','D1'},'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',14)
    text(rmsdReal(3,:),rmsdImag(3,:),{'D2','D2','D2','D2','D2','D2'},'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',14)
    text(rmsdReal(4,:),rmsdImag(4,:),{'D3','D3','D3','D3','D3','D3'},'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',14)
    text(rmsdReal(5,:),rmsdImag(5,:),{'D4','D4','D4','D4','D4','D4'},'VerticalAlignment','bottom','HorizontalAlignment','center','FontSize',14)
    legend({'24$^{\circ}$C','40$^{\circ}$C','55$^{\circ}$C','70$^{\circ}$C','85$^{\circ}$C','100$^{\circ}$C'},'location','southeast','fontsize',txtsize)
    grid on, grid minor
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')