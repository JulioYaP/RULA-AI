function res = Resultado(RULA)
    if (RULA<=2)
        res ="Aceptable";
    elseif (RULA<=4)
        res ="Ampliar estudio";
    elseif (RULA<=6)
        res ="Ampliar estudio y modificar pronto";
    else
        res ="Estudiar y modificar inmediatamente";
    end
end

