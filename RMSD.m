function [rmsdReal, rmsdImag] = RMSD(sinal,base,F1,F2)
%       DESCRICAO DA FUNCAO
%       [rmsdReal, rmsdImag] = RMSD(sinal,base,F1,F2);
%       Parametros de entrada:
%           sinal:      sinal na condicao estrutural desconhecida
%           base:       sinal para ser usado como referencia
%           F1 e F2:    faixa inicial e final a ser avaliada
%      Parametros de saida:
%           [rmsdReal, rmsdImag]: valor do rmsd real e imaginario calculado
freq = base(:,1);
cont = 1;
for i = 1:length(freq)
    if freq(i)>F1 && freq(i)<F2
        f1(cont) = freq(i);             %#ok<*AGROW> % Frequency 
        ZnImag(cont) = base(i,2);      % Baseline
        ZnReal(cont) = base(i,3);
        ZrnImag(cont) = sinal(i,2);      % Sinal na condição desconhecida
        ZrnReal(cont) = sinal(i,3);      
        cont = cont + 1;   
    end
end
for i=1:length(f1)
    auxReal = sqrt(((ZnReal(i)-ZrnReal(i))^2)/(ZrnReal(i))^2);
    auxImag = sqrt(((ZnImag(i)-ZrnImag(i))^2)/(ZrnImag(i))^2);
    if i == 1
        rmsdReal = auxReal;
        rmsdImag = auxImag;
    else
        rmsdReal = rmsdReal + auxReal;
        rmsdImag = rmsdImag + auxImag;
    end
end