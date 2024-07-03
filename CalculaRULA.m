function RulaScore = CalculaRULA(dataPoints)
    % Hombro der 1
    % Hombro izq 2
    % Codo der 3
    % Codo izq 4
    % Mano der 5
    % Mano izq 6
    % Muslo der 7
    % Muslo izq 8
    % Rodilla der 9
    % Rodilla izq 10
    % Pie der 11
    % Pie izq 12
    % Cabeza 13
    % Cuello 14
    %Pecho Medio 15
    %Entre pierna 16
    
    % Brazos. antebrazos Muñecas
    ScoreA = PasoA(dataPoints(1,:,:),dataPoints(2,:,:), ...
                    dataPoints(3,:,:),dataPoints(4,:,:), ...
                   dataPoints(5,:,:),dataPoints(6,:,:));
 
    %Cuello, Tronco, Piernas
    ScoreB = PasoB(dataPoints(13,:,:),dataPoints(14,:,:), ...
                    dataPoints(16,:,:),dataPoints(9,:,:), ...
                   dataPoints(10,:,:),dataPoints(11,:,:),dataPoints(12,:,:));

    %Tabla C
    TablaC = [  1 2 3 3 4 5 5 ;
                2 2 3 4 4 5 5 ;
                3 3 3 4 4 5 6 ;
                3 3 3 4 5 6 6 ;

                4 4 4 5 6 7 7 ;
                4 4 5 6 6 7 7 ;
                5 5 6 6 7 7 7 ;
                5 5 6 7 7 7 7 ;
              ];
    % Devolver la puntuación RULA calculada
    RulaScore = TablaC(ScoreA,ScoreB);
end
