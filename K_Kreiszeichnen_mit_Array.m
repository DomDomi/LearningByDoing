function K_Kreiszeichnen_mit_Array(array) %Sau dumm das ich das drehen muss
%Wohl wissentlich das ich jetzt die koordinaten mx und my falsch herum
%belegen muss
% ra = array(1,3);
% mx_a = array(1,5);
% my_a = array(1,4);
% ri = array(1,6);
% mx_i = array(1,8);
% my_i = array(1,7);

% Winkel=((2*pi)/360):((2*pi)/360):2*pi;
% xp=ra*cos(Winkel);
% yp=ra*sin(Winkel);
% plot(mx_a+xp,my_a+yp);
% 
% 
% if ri ~= 0
%     Winkel=((2*pi)/360):((2*pi)/360):2*pi;
%     xp=ri*cos(Winkel);
%     yp=ri*sin(Winkel);
%     plot(mx_i+xp,my_i+yp);
% end


double laenge;
% laenge = length(array(:)) / length(array)
laenge = length(array)

for i = 1:laenge
    if array(i,3) ~= 0
    ra = array(i,3);
    my_a = array(i,4);
    mx_a = array(i,5);
    Winkel=((2*pi)/360):((2*pi)/360):2*pi;
    xp=ra*cos(Winkel);
    yp=ra*sin(Winkel);
    plot(mx_a+xp,my_a+yp); 
   
    ri = array(i,6);
    my_i = array(i,7);
    mx_i = array(i,8);
    Winkel=((2*pi)/360):((2*pi)/360):2*pi;
    xp=ri*cos(Winkel);
    yp=ri*sin(Winkel);
    plot(mx_i+xp,my_i+yp); 

else 
break;


end

end