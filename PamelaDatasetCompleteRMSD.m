%% RMSD - Freq: fi <=> ff Hz
for i = 1:rep
    % Healthy
    [rmsdRealH24_Synth(i), rmsdImagH24_Synth(i)] = RMSD(squeeze(Healthy24_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealH40_Synth(i), rmsdImagH40_Synth(i)] = RMSD(squeeze(Healthy40_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealH55_Synth(i), rmsdImagH55_Synth(i)] = RMSD(squeeze(Healthy55_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealH70_Synth(i), rmsdImagH70_Synth(i)] = RMSD(squeeze(Healthy70_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealH85_Synth(i), rmsdImagH85_Synth(i)] = RMSD(squeeze(Healthy85_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealH100_Synth(i), rmsdImagH100_Synth(i)] = RMSD(squeeze(Healthy100_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    % Damage 1
    [rmsdRealD124_Synth(i), rmsdImagD124_Synth(i)] = RMSD(squeeze(Damaged24D1_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD140_Synth(i), rmsdImagD140_Synth(i)] = RMSD(squeeze(Damaged40D1_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD155_Synth(i), rmsdImagD155_Synth(i)] = RMSD(squeeze(Damaged55D1_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD170_Synth(i), rmsdImagD170_Synth(i)] = RMSD(squeeze(Damaged70D1_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD185_Synth(i), rmsdImagD185_Synth(i)] = RMSD(squeeze(Damaged85D1_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD1100_Synth(i), rmsdImagD1100_Synth(i)] = RMSD(squeeze(Damaged100D1_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    % Damage 2
    [rmsdRealD224_Synth(i), rmsdImagD224_Synth(i)] = RMSD(squeeze(Damaged24D2_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD240_Synth(i), rmsdImagD240_Synth(i)] = RMSD(squeeze(Damaged40D2_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD255_Synth(i), rmsdImagD255_Synth(i)] = RMSD(squeeze(Damaged55D2_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD270_Synth(i), rmsdImagD270_Synth(i)] = RMSD(squeeze(Damaged70D2_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD285_Synth(i), rmsdImagD285_Synth(i)] = RMSD(squeeze(Damaged85D2_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD2100_Synth(i), rmsdImagD2100_Synth(i)] = RMSD(squeeze(Damaged100D2_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    % Damage 3
    [rmsdRealD324_Synth(i), rmsdImagD324_Synth(i)] = RMSD(squeeze(Damaged24D3_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD340_Synth(i), rmsdImagD340_Synth(i)] = RMSD(squeeze(Damaged40D3_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD355_Synth(i), rmsdImagD355_Synth(i)] = RMSD(squeeze(Damaged55D3_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD370_Synth(i), rmsdImagD370_Synth(i)] = RMSD(squeeze(Damaged70D3_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD385_Synth(i), rmsdImagD385_Synth(i)] = RMSD(squeeze(Damaged85D3_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD3100_Synth(i), rmsdImagD3100_Synth(i)] = RMSD(squeeze(Damaged100D3_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    % Damage 4
    [rmsdRealD424_Synth(i), rmsdImagD424_Synth(i)] = RMSD(squeeze(Damaged24D4_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD440_Synth(i), rmsdImagD440_Synth(i)] = RMSD(squeeze(Damaged40D4_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD455_Synth(i), rmsdImagD455_Synth(i)] = RMSD(squeeze(Damaged55D4_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD470_Synth(i), rmsdImagD470_Synth(i)] = RMSD(squeeze(Damaged70D4_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD485_Synth(i), rmsdImagD485_Synth(i)] = RMSD(squeeze(Damaged85D4_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
    [rmsdRealD4100_Synth(i), rmsdImagD4100_Synth(i)] = RMSD(squeeze(Damaged100D4_Synth(:,:,i)),squeeze(Healthy24_Synth(:,:,i)),fi,ff);
end

    rmsdH24 = [rmsdRealH24_Synth; rmsdImagH24_Synth];
    rmsdH40 = [rmsdRealH40_Synth; rmsdImagH40_Synth];
    rmsdH55 = [rmsdRealH55_Synth; rmsdImagH55_Synth];
    rmsdH70 = [rmsdRealH70_Synth; rmsdImagH70_Synth];
    rmsdH85 = [rmsdRealH85_Synth; rmsdImagH85_Synth];
    rmsdH100 = [rmsdRealH100_Synth; rmsdImagH100_Synth];
    
    rmsdD124 = [rmsdRealD124_Synth; rmsdImagD124_Synth];
    rmsdD140 = [rmsdRealD140_Synth; rmsdImagD140_Synth];
    rmsdD155 = [rmsdRealD155_Synth; rmsdImagD155_Synth];
    rmsdD170 = [rmsdRealD170_Synth; rmsdImagD170_Synth];
    rmsdD185 = [rmsdRealD185_Synth; rmsdImagD185_Synth];
    rmsdD1100 = [rmsdRealD1100_Synth; rmsdImagD1100_Synth];
    
    rmsdD224 = [rmsdRealD224_Synth; rmsdImagD224_Synth];
    rmsdD240 = [rmsdRealD240_Synth; rmsdImagD240_Synth];
    rmsdD255 = [rmsdRealD255_Synth; rmsdImagD255_Synth];
    rmsdD270 = [rmsdRealD270_Synth; rmsdImagD270_Synth];
    rmsdD285 = [rmsdRealD285_Synth; rmsdImagD285_Synth];
    rmsdD2100 = [rmsdRealD2100_Synth; rmsdImagD2100_Synth];
    
    rmsdD324 = [rmsdRealD324_Synth; rmsdImagD324_Synth];
    rmsdD340 = [rmsdRealD340_Synth; rmsdImagD340_Synth];
    rmsdD355 = [rmsdRealD355_Synth; rmsdImagD355_Synth];
    rmsdD370 = [rmsdRealD370_Synth; rmsdImagD370_Synth];
    rmsdD385 = [rmsdRealD385_Synth; rmsdImagD385_Synth];
    rmsdD3100 = [rmsdRealD3100_Synth; rmsdImagD3100_Synth];
    
    rmsdD424 = [rmsdRealD424_Synth; rmsdImagD424_Synth];
    rmsdD440 = [rmsdRealD440_Synth; rmsdImagD440_Synth];
    rmsdD455 = [rmsdRealD455_Synth; rmsdImagD455_Synth];
    rmsdD470 = [rmsdRealD470_Synth; rmsdImagD470_Synth];
    rmsdD485 = [rmsdRealD485_Synth; rmsdImagD485_Synth];
    rmsdD4100 = [rmsdRealD4100_Synth; rmsdImagD4100_Synth];
    
    % RMSD Real x Imaginary
    figure
    set(gcf,'Units','Normalized','OuterPosition',[0 0 1 1])
    plot(rmsdH24(1,:),rmsdH24(2,:),'ob','linewidth',5,'markersize',5), hold on
    plot(rmsdH40(1,:),rmsdH40(2,:),'or','linewidth',5,'markersize',5), hold on
    plot(rmsdH55(1,:),rmsdH55(2,:),'o','color','#C5DB00','linewidth',5,'markersize',5), hold on
    plot(rmsdH70(1,:),rmsdH70(2,:),'o','color','#007217','linewidth',5,'markersize',5), hold on
    plot(rmsdH85(1,:),rmsdH85(2,:),'o','color','#0080FF','linewidth',5,'markersize',5), hold on
    plot(rmsdH100(1,:),rmsdH100(2,:),'o','color','#FF66FF','linewidth',5,'markersize',5), hold on
        
    plot(rmsdD124(1,:),rmsdD124(2,:),'ob','linewidth',5,'markersize',5), hold on
    plot(rmsdD140(1,:),rmsdD140(2,:),'or','linewidth',5,'markersize',5), hold on
    plot(rmsdD155(1,:),rmsdD155(2,:),'o','color','#C5DB00','linewidth',5,'markersize',5), hold on
    plot(rmsdD170(1,:),rmsdD170(2,:),'o','color','#007217','linewidth',5,'markersize',5), hold on
    plot(rmsdD185(1,:),rmsdD185(2,:),'o','color','#0080FF','linewidth',5,'markersize',5), hold on
    plot(rmsdD1100(1,:),rmsdD1100(2,:),'o','color','#FF66FF','linewidth',5,'markersize',5), hold on
    
    plot(rmsdD224(1,:),rmsdD224(2,:),'ob','linewidth',5,'markersize',5), hold on
    plot(rmsdD240(1,:),rmsdD240(2,:),'or','linewidth',5,'markersize',5), hold on
    plot(rmsdD255(1,:),rmsdD255(2,:),'o','color','#C5DB00','linewidth',5,'markersize',5), hold on
    plot(rmsdD270(1,:),rmsdD270(2,:),'o','color','#007217','linewidth',5,'markersize',5), hold on
    plot(rmsdD285(1,:),rmsdD285(2,:),'o','color','#0080FF','linewidth',5,'markersize',5), hold on
    plot(rmsdD2100(1,:),rmsdD2100(2,:),'o','color','#FF66FF','linewidth',5,'markersize',5), hold on
    
    plot(rmsdD324(1,:),rmsdD324(2,:),'ob','linewidth',5,'markersize',5), hold on
    plot(rmsdD340(1,:),rmsdD340(2,:),'or','linewidth',5,'markersize',5), hold on
    plot(rmsdD355(1,:),rmsdD355(2,:),'o','color','#C5DB00','linewidth',5,'markersize',5), hold on
    plot(rmsdD370(1,:),rmsdD370(2,:),'o','color','#007217','linewidth',5,'markersize',5), hold on
    plot(rmsdD385(1,:),rmsdD385(2,:),'o','color','#0080FF','linewidth',5,'markersize',5), hold on
    plot(rmsdD3100(1,:),rmsdD3100(2,:),'o','color','#FF66FF','linewidth',5,'markersize',5), hold on
    
    plot(rmsdD424(1,:),rmsdD424(2,:),'ob','linewidth',5,'markersize',5), hold on
    plot(rmsdD440(1,:),rmsdD440(2,:),'or','linewidth',5,'markersize',5), hold on
    plot(rmsdD455(1,:),rmsdD455(2,:),'o','color','#C5DB00','linewidth',5,'markersize',5), hold on
    plot(rmsdD470(1,:),rmsdD470(2,:),'o','color','#007217','linewidth',5,'markersize',5), hold on
    plot(rmsdD485(1,:),rmsdD485(2,:),'o','color','#0080FF','linewidth',5,'markersize',5), hold on
    plot(rmsdD4100(1,:),rmsdD4100(2,:),'o','color','#FF66FF','linewidth',5,'markersize',5), hold on
    
    xlabel('$\alpha_d$')
    ylabel('$\alpha_t$')
    legend({'24$^{\circ}$C','40$^{\circ}$C','55$^{\circ}$C','70$^{\circ}$C','85$^{\circ}$C','100$^{\circ}$C'},'location','southeast','fontsize',txtsize)
    grid on, grid minor
    set(gca,'fontsize',txtsize,'XColor','k','YColor','k','ZColor','k','GridColor','k')