function ScoreB = PasoB(Cab,Cue,Entre,RodDer,RodIzq,PieDer,PieIzq)
%PasoB(Cab,Cue,Entre,RodDer,RodIzq,PieDer,PieIzq)
    
    %Score 9
    Score9 = Paso9(Cue,Cab);
    
    %Extras
    
    %Score 10
    Score10 = Paso10(Entre,Cue);
    
    %Extras

    %Score 11
    Score11 = Paso11(RodDer,PieDer,RodIzq,PieIzq);

    %Score12
    %Uso de tabla
    TablaB = [  1 3 2 3 4 5 5 6 7 7 ;
                2 3 2 3 5 5 5 6 7 7 ;
                3 3 3 4 5 5 6 6 7 7 ;
                5 5 5 6 7 7 7 7 8 8 ;
                7 7 7 7 8 8 8 8 8 8 ;
                8 8 8 8 8 8 9 9 9 9 ;
              ];
    Score12 = TablaB(Score9,Score10*2-(2-Score11));

    %Score 13
    Score13 = 1; %Repentinamente       

    %Score 14
    Score14 = 0; %Intermitente

    %Puntaje total
    ScoreB = Score12+Score13+Score14
end

%Paso 11:
% Piernas y rodillas
function Score = Paso11(p1,p2,p3,p4)
    [thetaX1, ~] = CalculaAngulos(p1,p2);
    [thetaX2, ~] = CalculaAngulos(p3,p4);
    %Angulo
    if (abs(thetaX2-thetaX1)>=10)
        Score =2;
    else
        Score =1;
    end
end

%Paso 10:
% Entrepierna, Cuello
function Score = Paso10(p1,p2)
    [~, thetaY] = CalculaAngulos(p1,p2);
    %Angulo
    if (thetaY<=5)
        Score =1;
    elseif (thetaY<=20)
        Score =2;
    elseif (thetaY<=60)
        Score =3;
    else 
        Score =4;
    end
end

%Paso 9:
% Cuello, Cabeza
function Score = Paso9(p1,p2)
    [~, thetaY] = CalculaAngulos(p1,p2);
    %Angulo
    if (thetaY<=0)
        Score =4;
    elseif (thetaY<=10)
        Score =1;
    elseif (thetaY<=20)
        Score =2;
    else 
        Score =3;
    end
end