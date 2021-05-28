%% RMSD SHIFTED - Freq: fi <=> ff Hz
    % Healthy
    [rmsdFreqH24,rmsdAmpH24,ShiftFreqH24,ShiftFreqIdxH24,ShiftAmpH24] = RMSDShift(Healthy24,Healthy24,fi,ff,df,dA,Threshold);
    [rmsdFreqH55,rmsdAmpH55,ShiftFreqH55,ShiftFreqIdxH55,ShiftAmpH55] = RMSDShift(Healthy55,Healthy24,fi,ff,df,dA,Threshold);
    % Damage 2
    [rmsdFreqD255,rmsdAmpD255,ShiftFreqD255,ShiftFreqIdxD224,ShiftAmpD255] = RMSDShift(Damaged55D2,Healthy24,fi,ff,df,dA,Threshold);
    
%% PLOTTING WITH AND WITHOUT SHIFT
    % WITHOUT SHIFT
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    subplot(2,1,1)
    semilogy(Healthy24(:,1),Healthy24(:,3),'k','linewidth',1.75), hold on
    semilogy(Healthy55(:,1),Healthy55(:,3),'r','linewidth',1.75), hold on
    semilogy(Damaged55D2(:,1),Damaged55D2(:,3),'m','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('Without Shift')
    if axislimit == true
        axis([fi ff 1e1 1e3])
    end
    legend('Healthy - 24$^\circ$C','Healthy - 55$^\circ$C','Damage 2 - 55$^\circ$C','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e1 1e2 1e3 1e4])
    grid on, grid minor
    % WITH SHIFT
    subplot(2,1,2)
    semilogy(Healthy24(:,1)+ShiftFreqH24,Healthy24(:,3)+ShiftAmpH24,'k','linewidth',1.75), hold on
    semilogy(Healthy55(:,1)+ShiftFreqH55,Healthy55(:,3)+ShiftAmpH55,'r','linewidth',1.75), hold on
    semilogy(Damaged55D2(:,1)+ShiftFreqD255,Damaged55D2(:,3)+ShiftAmpD255,'m','linewidth',1.75), hold on
    xlabel('Frequency [Hz]')
    ylabel('$Re\{Z(\Omega)\}$')
    title('With Shift')
    if axislimit == true
        axis([fi ff 1e1 1e3])
    end
    legend('Healthy - 24$^\circ$C','Healthy - 55$^\circ$C','Damage 2 - 55$^\circ$C','location','northeast','fontsize',txtsize)
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k','Ytick',[1e-2 1e-1 1e0 1e1 1e2 1e3 1e4 1e5])
    grid on, grid minor
    
    %% RMSD Real x Imaginary
    % Healthy
    Healthy24FreqAux = Healthy24(:,1)+ShiftFreqH24;
    Healthy55FreqAux = Healthy55(:,1)+ShiftFreqH55;
    Damaged55D2FreqAux = Damaged55D2(:,1)+ShiftFreqD255;
    Healthy24(:,1) = Healthy24FreqAux;
    Healthy55(:,1) = Healthy55FreqAux;
    Damaged55D2(:,1) = Damaged55D2FreqAux;
    
    Healthy24AmpAux = Healthy24(:,3)+ShiftAmpH24;
    Healthy55AmpAux = Healthy55(:,3)+ShiftAmpH55;
    Damaged55D2AmpAux = Damaged55D2(:,3)+ShiftAmpD255;
    Healthy24(:,3) = Healthy24AmpAux;
    Healthy55(:,3) = Healthy55AmpAux;
    Damaged55D2(:,3) = Damaged55D2AmpAux;
    
    [rmsdRealH24, rmsdImagH24] = RMSD(Healthy24,Healthy24,fi,ff);
    [rmsdRealH55, rmsdImagH55] = RMSD(Healthy55,Healthy24,fi,ff);
    [rmsdRealD255, rmsdImagD255] = RMSD(Damaged55D2,Healthy24,fi,ff);
        
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    plot(rmsdRealH24,rmsdImagH24,'o','linewidth',8,'markersize',8), hold on
    plot(rmsdRealH55,rmsdImagH55,'o','linewidth',8,'markersize',8), hold on
    plot(rmsdRealD255,rmsdImagD255,'o','linewidth',8,'markersize',8), hold on
    xlabel('$\alpha_d$')
    ylabel('$\alpha_t$')
    legend({'Healthy - 24$^{\circ}$C','Healthy - 55$^{\circ}$C','Damage 2 - 55$^{\circ}$C'},'location','southeast','fontsize',txtsize)
    grid on, grid minor
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')