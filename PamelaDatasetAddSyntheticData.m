%% ADDING SYNTHETIC DATA
auxImag = [];
auxReal = [];
for st=1:rep
    % Healthy
    auxImag = addnoise(Healthy24(:,2),noisePercent);
    auxReal = addnoise(Healthy24(:,3),noisePercent);
    Healthy24_Synth(:,1,st) = Healthy24(:,1);
    Healthy24_Synth(:,2,st) = auxImag;
    Healthy24_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Healthy40(:,2),noisePercent);
    auxReal = addnoise(Healthy40(:,3),noisePercent);
    Healthy40_Synth(:,1,st) = Healthy40(:,1);
    Healthy40_Synth(:,2,st) = auxImag;
    Healthy40_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Healthy55(:,2),noisePercent);
    auxReal = addnoise(Healthy55(:,3),noisePercent);
    Healthy55_Synth(:,1,st) = Healthy55(:,1);
    Healthy55_Synth(:,2,st) = auxImag;
    Healthy55_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Healthy70(:,2),noisePercent);
    auxReal = addnoise(Healthy70(:,3),noisePercent);
    Healthy70_Synth(:,1,st) = Healthy70(:,1);
    Healthy70_Synth(:,2,st) = auxImag;
    Healthy70_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Healthy85(:,2),noisePercent);
    auxReal = addnoise(Healthy85(:,3),noisePercent);
    Healthy85_Synth(:,1,st) = Healthy85(:,1);
    Healthy85_Synth(:,2,st) = auxImag;
    Healthy85_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Healthy100(:,2),noisePercent);
    auxReal = addnoise(Healthy100(:,3),noisePercent);
    Healthy100_Synth(:,1,st) = Healthy100(:,1);
    Healthy100_Synth(:,2,st) = auxImag;
    Healthy100_Synth(:,3,st) = auxReal;
    
    % Damage 1
    auxImag = addnoise(Damaged24D1(:,2),noisePercent);
    auxReal = addnoise(Damaged24D1(:,3),noisePercent);
    Damaged24D1_Synth(:,1,st) = Damaged24D1(:,1);
    Damaged24D1_Synth(:,2,st) = auxImag;
    Damaged24D1_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged40D1(:,2),noisePercent);
    auxReal = addnoise(Damaged40D1(:,3),noisePercent);
    Damaged40D1_Synth(:,1,st) = Damaged40D1(:,1);
    Damaged40D1_Synth(:,2,st) = auxImag;
    Damaged40D1_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged55D1(:,2),noisePercent);
    auxReal = addnoise(Damaged55D1(:,3),noisePercent);
    Damaged55D1_Synth(:,1,st) = Damaged55D1(:,1);
    Damaged55D1_Synth(:,2,st) = auxImag;
    Damaged55D1_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged70D1(:,2),noisePercent);
    auxReal = addnoise(Damaged70D1(:,3),noisePercent);
    Damaged70D1_Synth(:,1,st) = Damaged70D1(:,1);
    Damaged70D1_Synth(:,2,st) = auxImag;
    Damaged70D1_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged85D1(:,2),noisePercent);
    auxReal = addnoise(Damaged85D1(:,3),noisePercent);
    Damaged85D1_Synth(:,1,st) = Damaged85D1(:,1);
    Damaged85D1_Synth(:,2,st) = auxImag;
    Damaged85D1_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged100D1(:,2),noisePercent);
    auxReal = addnoise(Damaged100D1(:,3),noisePercent);
    Damaged100D1_Synth(:,1,st) = Damaged100D1(:,1);
    Damaged100D1_Synth(:,2,st) = auxImag;
    Damaged100D1_Synth(:,3,st) = auxReal;
    
    % Damage 2
    auxImag = addnoise(Damaged24D2(:,2),noisePercent);
    auxReal = addnoise(Damaged24D2(:,3),noisePercent);
    Damaged24D2_Synth(:,1,st) = Damaged24D2(:,1);
    Damaged24D2_Synth(:,2,st) = auxImag;
    Damaged24D2_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged40D2(:,2),noisePercent);
    auxReal = addnoise(Damaged40D2(:,3),noisePercent);
    Damaged40D2_Synth(:,1,st) = Damaged40D2(:,1);
    Damaged40D2_Synth(:,2,st) = auxImag;
    Damaged40D2_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged55D2(:,2),noisePercent);
    auxReal = addnoise(Damaged55D2(:,3),noisePercent);
    Damaged55D2_Synth(:,1,st) = Damaged55D2(:,1);
    Damaged55D2_Synth(:,2,st) = auxImag;
    Damaged55D2_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged70D2(:,2),noisePercent);
    auxReal = addnoise(Damaged70D2(:,3),noisePercent);
    Damaged70D2_Synth(:,1,st) = Damaged70D2(:,1);
    Damaged70D2_Synth(:,2,st) = auxImag;
    Damaged70D2_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged85D2(:,2),noisePercent);
    auxReal = addnoise(Damaged85D2(:,3),noisePercent);
    Damaged85D2_Synth(:,1,st) = Damaged85D2(:,1);
    Damaged85D2_Synth(:,2,st) = auxImag;
    Damaged85D2_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged100D2(:,2),noisePercent);
    auxReal = addnoise(Damaged100D2(:,3),noisePercent);
    Damaged100D2_Synth(:,1,st) = Damaged100D2(:,1);
    Damaged100D2_Synth(:,2,st) = auxImag;
    Damaged100D2_Synth(:,3,st) = auxReal;
    
    % Damage 3
    auxImag = addnoise(Damaged24D3(:,2),noisePercent);
    auxReal = addnoise(Damaged24D3(:,3),noisePercent);
    Damaged24D3_Synth(:,1,st) = Damaged24D3(:,1);
    Damaged24D3_Synth(:,2,st) = auxImag;
    Damaged24D3_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged40D3(:,2),noisePercent);
    auxReal = addnoise(Damaged40D3(:,3),noisePercent);
    Damaged40D3_Synth(:,1,st) = Damaged40D3(:,1);
    Damaged40D3_Synth(:,2,st) = auxImag;
    Damaged40D3_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged55D3(:,2),noisePercent);
    auxReal = addnoise(Damaged55D3(:,3),noisePercent);
    Damaged55D3_Synth(:,1,st) = Damaged55D3(:,1);
    Damaged55D3_Synth(:,2,st) = auxImag;
    Damaged55D3_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged70D3(:,2),noisePercent);
    auxReal = addnoise(Damaged70D3(:,3),noisePercent);
    Damaged70D3_Synth(:,1,st) = Damaged70D3(:,1);
    Damaged70D3_Synth(:,2,st) = auxImag;
    Damaged70D3_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged85D3(:,2),noisePercent);
    auxReal = addnoise(Damaged85D3(:,3),noisePercent);
    Damaged85D3_Synth(:,1,st) = Damaged85D3(:,1);
    Damaged85D3_Synth(:,2,st) = auxImag;
    Damaged85D3_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged100D3(:,2),noisePercent);
    auxReal = addnoise(Damaged100D3(:,3),noisePercent);
    Damaged100D3_Synth(:,1,st) = Damaged100D3(:,1);
    Damaged100D3_Synth(:,2,st) = auxImag;
    Damaged100D3_Synth(:,3,st) = auxReal;
    
    % Damage 4
    auxImag = addnoise(Damaged24D4(:,2),noisePercent);
    auxReal = addnoise(Damaged24D4(:,3),noisePercent);
    Damaged24D4_Synth(:,1,st) = Damaged24D4(:,1);
    Damaged24D4_Synth(:,2,st) = auxImag;
    Damaged24D4_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged40D4(:,2),noisePercent);
    auxReal = addnoise(Damaged40D4(:,3),noisePercent);
    Damaged40D4_Synth(:,1,st) = Damaged40D4(:,1);
    Damaged40D4_Synth(:,2,st) = auxImag;
    Damaged40D4_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged55D4(:,2),noisePercent);
    auxReal = addnoise(Damaged55D4(:,3),noisePercent);
    Damaged55D4_Synth(:,1,st) = Damaged55D4(:,1);
    Damaged55D4_Synth(:,2,st) = auxImag;
    Damaged55D4_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged70D4(:,2),noisePercent);
    auxReal = addnoise(Damaged70D4(:,3),noisePercent);
    Damaged70D4_Synth(:,1,st) = Damaged70D4(:,1);
    Damaged70D4_Synth(:,2,st) = auxImag;
    Damaged70D4_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged85D4(:,2),noisePercent);
    auxReal = addnoise(Damaged85D4(:,3),noisePercent);
    Damaged85D4_Synth(:,1,st) = Damaged85D4(:,1);
    Damaged85D4_Synth(:,2,st) = auxImag;
    Damaged85D4_Synth(:,3,st) = auxReal;
    
    auxImag = addnoise(Damaged100D4(:,2),noisePercent);
    auxReal = addnoise(Damaged100D4(:,3),noisePercent);
    Damaged100D4_Synth(:,1,st) = Damaged100D4(:,1);
    Damaged100D4_Synth(:,2,st) = auxImag;
    Damaged100D4_Synth(:,3,st) = auxReal;
end