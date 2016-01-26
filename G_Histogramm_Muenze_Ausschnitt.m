function h = G_Histogramm_Muenze_Ausschnitt(Bild,array)
%Habe Hier schon gedreht, also muss es unten richtig sein
% ra = array(1,3)
% mx_a = array(1,4)
% my_a = array(1,5)
% 
% ri = array(1,6)
% mx_i = array(1,7)
% my_i = array(1,8)

laenge = length(array);
double k;
double l;
zaehlvariable = 0;
for l = 1:laenge*3
for k = 1:256
    h(k,l) = 0;
end
end

%Falls es einen inneren Kreis gibt, ist das lauf-ende für den äußeren Kreis
%natürlich die innere Kreiswand
zaehlvariable = 0;
for i = 1:laenge

    if array(i,3) ~= 0
        ra = array(i,3);
        mx_a = array(i,4);
        my_a = array(i,5);
        ri = array(i,6);
        mx_i = array(i,7);
        my_i = array(i,8);

        if ri ~= 0
            r_lauf_ende = ri;
        else
            r_lauf_ende = 1;
        end

        for ebene = 1:3
            for r_lauf = ra : -1 : r_lauf_ende


                for Winkel=((2*pi)/360):((2*pi)/360):2*pi
                    xp=round(r_lauf*cos(Winkel));
                    yp=round(r_lauf*sin(Winkel));


                    h(double(Bild(mx_a+xp,my_a+yp,ebene))+1,ebene+zaehlvariable) = h(double(Bild(mx_a+xp,my_a+yp,ebene))+1,ebene+zaehlvariable)+1;

                end
            end
        end


        %Falls es einen Inneren Kreis gibt, wird das histogramm_array noch mit 3
        %weiteren farbwerten gefüllt.
        if ri ~= 0
            for ebene = 1:3
                for r_lauf = 1 : 1 : ri
                    for Winkel=((2*pi)/360):((2*pi)/360):2*pi
                        xp=round(r_lauf*cos(Winkel));
                        yp=round(r_lauf*sin(Winkel));


                        h(double(Bild(mx_i+xp,my_i+yp,ebene))+1,ebene+3+zaehlvariable) = h(double(Bild(mx_i+xp,my_i+yp,ebene))+1,ebene+3+zaehlvariable)+1;

                    end
                end
            end
        end
    end
zaehlvariable = zaehlvariable + 6;
end

end