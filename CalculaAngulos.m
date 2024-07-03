function [theta_h, theta_v] = CalculaAngulos(p1, p2)
    
    x1 = p1(:,1,:);
    y1 = p1(:,2,:);
    x2 = p2(:,1,:);
    y2 = p2(:,2,:);
    
    % Calcular ángulo respecto a la horizontal (theta_h)
    delta_x = x2 - x1;
    delta_y = y2 - y1;
    theta_h = atan2(delta_y, delta_x) * (180 / pi);

    % Calcular ángulo respecto a la vertical (theta_v)
    theta_v = atan2(delta_x, delta_y) * (180 / pi);
end