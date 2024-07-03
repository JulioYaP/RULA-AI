function ScoreA = PasoA(HDer,HIzq,CDer,CIzq,MDer,MIzq)
%PasoA(HDer,HIzq,CDer,CIzq,MDer,MIzq)
    
    %Score 1
    Score11 = Paso1(HDer,MDer);
    Score12 = Paso1(HIzq,MIzq);
    Score1 = ceil(Score11*0.5+Score12*0.5);
    
    %Extras

    %Score 2
    Score21 = Paso2(CDer,MDer);
    Score22 = Paso2(CIzq,MIzq);
    Score2 = ceil(Score21*0.5+Score22*0.5);
    
    %Extras
    
    %Score 3
    Score3 = 1; %Muñeca Neutra
    %Extras

    %Score 4
    Score4 = 1; %Giro de muñeca

    %Score 5
    %Uso de tabla
    TablaA = [ 1 2 2 2 2 3 3 3;
              2 2 2 2 3 3 3 3;
              2 3 3 3 3 3 4 4;

              2 3 3 3 3 4 4 4;
              3 3 3 3 3 4 4 4;
              3 3 4 4 4 4 5 5;

              3 3 4 4 4 4 5 5;
              3 4 4 4 4 4 5 5;
              4 4 4 4 4 5 5 5;
              
              4 4 4 4 5 5 5 5;
              4 4 4 5 5 5 5 5;
              4 4 4 5 5 5 6 6;
              
              5 5 5 5 5 6 6 7;
              5 6 6 6 6 7 7 7;
              6 6 6 7 7 7 7 8;
              
              7 7 7 7 7 8 8 9;
              8 8 8 8 8 9 9 9;
              9 9 9 9 9 9 9 9;
              ];
    Score5 = TablaA(Score1*3-(3-Score2),Score3*2-(2-Score4));

    %Score 6
    Score6 = 1; %Estática o repetida

    %Score 7
    Score7 = 0; %Carga/Esfuerzo 
    
    %Score 8
    Score8= Score5 + Score6 + Score7; 

    %Puntaje total
    ScoreA = Score8
end

%Paso 2:
% Codo, Mano
function Score = Paso2(p1,p2)
    [thetaX, ~] = CalculaAngulos(p1,p2);
    
    if (thetaX>=90)
        thetaX=180-thetaX; 
    end
    
    %Angulo
    if (thetaX<=-30)
        Score =2;
    elseif (thetaX<=10)
        Score =1;
    elseif (thetaX<=90)
        Score =2;
    end
end

%Paso 1:
% Hombro, Mano
function Score = Paso1(p1,p2)
    [~, thetaY] = CalculaAngulos(p1,p2);
    
    if (thetaY<0)
        thetaY=-1*thetaY; 
    end
    
    %Angulo
    if (thetaY<=90)
        Score =4;
    elseif (thetaY<=135)
        Score =3;
    elseif (thetaY<=160)
        Score =2;
    elseif (thetaY<=180)
        Score =1;
    end
end