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