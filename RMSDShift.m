function [rmsdFreq,rmsdAmp,Shift_f,Shift_fIdx,Shift_A] = RMSDShift(sinal,base,F1,F2,df,dA,threshold)
%       DESCRICAO DA FUNCAO
%       [rmsdReal, rmsdImag] = RMSD(sinal,base,F1,F2);
%       Parametros de entrada:
%           sinal:      sinal na condicao estrutural desconhecida
%           base:       sinal para ser usado como referencia
%           F1 e F2:    faixa inicial e final a ser avaliada
%           df:         shift desejado nas frequencias
%           dA:         shift desejado nas amplitudes
%           threshold:  criterio de parada
%      Parametros de saida:
%           rmsdFreq:   menor valor do rmsd de freq com shift
%           rmsdAmp:    menor valor do rmsd de amp com shift
%           Shift_f:    shift necessario na frequencia
%           Shift_A:    shift necessario na amplitude
%           Shift_fIdx: shift necessario na frequencia em amostras
%           Shift_A:    shift necessario na frequencia

freq = base(:,1);
cont = 1;
if df < freq(length(freq))/length(freq)
    disp('Erro: Forneça outro incremento de frequência.')
    return
end
st = double(freq(length(freq))/length(freq));
fInc = floor(df/st);
fLim = 50;
ALim = 1000;
Shift_fIdx = 0;
Shift_f = 0;
Shift_A = 0;

for i = 1:length(freq)
    if freq(i)>F1 && freq(i)<F2
        f1(cont) = freq(i);             %#ok<*AGROW> % Frequency
        ZnReal(cont) = sinal(i,3);       % Baseline
        ZrnReal(cont) = base(i,3);     % Sinal na condição desconhecida
        cont = cont + 1;
    end
end

% SHIFT FREQUENCIA
for j=fInc:fInc:fLim*fInc
    rmsdFreq = 0;
    for i=1:length(f1)
        aux = sqrt(((ZnReal(i)-(ZrnReal(i)+j))^2)/(ZrnReal(i))^2);
        if i == 1
            rmsdFreq = aux;
        else
            rmsdFreq = rmsdFreq + aux;
        end
        if rmsdFreq < threshold
            threshold = rmsdFreq;
            Shift_f = 2.5*j*st;
            Shift_fIdx = j;
        end
    end
end
rmsdFreq = double(threshold);

% SHIFT AMPLITUDE
for k=dA:dA:ALim
    rmsdAmp = 0;
    for i=1:length(f1)
        aux = sqrt(((ZnReal(i)-(ZrnReal(i)+k))^2)/(ZrnReal(i))^2);
        if i == 1
            rmsdAmp = aux;
        else
            rmsdAmp = rmsdAmp + aux;
        end
        if rmsdAmp < threshold
            threshold = rmsdAmp;
            Shift_A = k;
        end
    end
end
rmsdAmp = double(threshold);
end