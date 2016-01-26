% Bild beschneiden(im Sinne von FBildrbwerte Bildbscheiden)
%Jetzt wird noch ne ganze seite in der jeweiligen farbei eingefärbt
function besch = H_FarbenBeschneiden_Ausschnitt(Bild,h,array)
% ra = array(1,3);
% mx_a = array(1,4);
% my_a = array(1,5);
% 
% ri = array(1,6);
% mx_i = array(1,7);
% my_i = array(1,8);

laenge = length(array);

[z,s,t] = size(Bild);
besch = ones(z,s+1,t,'uint8');

double durchschnittRot;
double durschschnittGruen;
double durschschnittBlau;
double m;
double n;
double o;
Gesamthelligkeit_innen = 0;
Gesamthelligkeit_aussen = 0;

RotZaehlvariable = 0;
GruenZaehlvariable = 0;
BlauZaehlvariable = 0;
rot_a = 0;
gruen_a = 0;
blau_a = 0;
durchschnittRot_a = 0;
durchschnittGruen_a = 0;
durchschnittBlau_a = 0;
m = 0;
n = 0;
o = 0;

rot_i = 0;
gruen_i = 0;
blau_i = 0;
durchschnittRot_i = 0;
durchschnittGruen_i = 0;
durchschnittBlau_i = 0;
p = 0;
q = 0;
r = 0;

%mit dieser schleife ermittel ich den Durchschnitt
%Erfolg!!!! so wird es klappen.

k = 0;
l = 1

for j = 1:length(h)       
    if h(l,k+1) ~= 0
    for i = 1:256
        
            
            disp(i)
            disp(k)
           rot_a = rot_a + h(i,k+1);
           m = m + h(i,1+k)*i;       

           gruen_a = gruen_a + h(i,2+k);
           n = n + h(i,2+k)*i;       

           blau_a = blau_a + h(i,3+k);
           o = o + h(i,3+k)*i;      

    end


    durchschnittRot_a = m/rot_a;
    durchschnittGruen_a = n/gruen_a;
    durchschnittBlau_a = o/blau_a;

    %Laufende wenn ein Innenkreis vorhanden ist und wenn nciht
   if array(j,3) ~= 0
        ra = array(j,3);
        mx_a = array(j,4);
        my_a = array(j,5);
        ri = array(j,6);
        mx_i = array(j,7);
        my_i = array(j,8);

        if ri ~= 0
            r_lauf_ende = ri;
        else
            r_lauf_ende = 1;
        end
    
     for r_lauf = ra : -0.1 : r_lauf_ende
        for winkel=((2*pi)/360):((2*pi)/360):2*pi %einmal im Kreis herum in 2*PI/360 Schritten
            xp = round(r_lauf*cos(winkel));
            yp = round(r_lauf*sin(winkel));        
            besch(mx_a + xp,my_a + yp,1) = durchschnittRot_a;
            besch(mx_a + xp,my_a + yp,2) = durchschnittGruen_a; 
            besch(mx_a + xp,my_a + yp,3) = durchschnittBlau_a;       

        end
     end  

    %Falls ein innenKreis existiert, wird dieser danach eingefärbt
     if ri ~= 0
         for i = 1:256
           rot_i = rot_i + h(i,4+k);
           p = p + h(i,4+k)*i;       

           gruen_i = gruen_i + h(i,5+k);
           q = q + h(i,5+k)*i;       

           blau_i = blau_i + h(i,6+k);
           r = r + h(i,6+k)*i;      
         end

    durchschnittRot_i = p/rot_i;
    durchschnittGruen_i = q/gruen_i;
    durchschnittBlau_i = r/blau_i;

      for r_lauf = 1 : 0.1 : ri
            for winkel=((2*pi)/360):((2*pi)/360):2*pi %einmal im Kreis herum in 2*PI/360 Schritten
                xp = round(r_lauf*cos(winkel));
                yp = round(r_lauf*sin(winkel));        
                besch(mx_i + xp,my_i + yp,1) = durchschnittRot_i;
                besch(mx_i + xp,my_i + yp,2) = durchschnittGruen_i; 
                besch(mx_i + xp,my_i + yp,3) = durchschnittBlau_i;     
            end
      end 
     end

    %Innenkreis oder außenkreis im Durchschnittheller?
    Gesamthelligkeit_innen = (durchschnittRot_i+durchschnittGruen_i+durchschnittBlau_i)/3 ;
    Gesamthelligkeit_aussen = (durchschnittRot_a+durchschnittGruen_a+durchschnittBlau_a)/3 ;


    if ri == 0 %Bei nur einem Kreis werden so alle Pixel berücksichtigt
        verhaeltnis_Rot_zum_Rest = round((100/durchschnittRot_a)*((durchschnittGruen_a + durchschnittBlau_a)/2));
        verhaeltnis_Blau_zum_Rest = round(((100/((durchschnittGruen_a+durchschnittRot_a)/2))*durchschnittBlau_a));

    else %Wenn es zwei Kreise sind muss ich ja trotzdem alle Pxel berücksichtigen
        verhaeltnis_Rot_zum_Rest = round((100/((durchschnittRot_a+durchschnittRot_i)/2))*((((durchschnittGruen_a+durchschnittGruen_i)/2) + ((durchschnittBlau_a+durchschnittBlau_i)/2))/2));
        verhaeltnis_Blau_zum_Rest = round(((100/((((durchschnittGruen_a+durchschnittGruen_i)/2)+((durchschnittRot_a+durchschnittRot_i)/2))/2))*((durchschnittBlau_a+durchschnittBlau_i)/2)));

    end


    %Der versuch irgendwie aus den Farbewerten einen gescheiten Beschluss zu
    %fassen, was es denn jetzt für eine Münze ist
    % 0 == 1,2,5 Cent; 1 == 10,20,50 Cent; 2 == 1Euro; 3 == 2Euro
    if Gesamthelligkeit_innen == 0
        if verhaeltnis_Rot_zum_Rest < 84 %Verhältnis der Helligkeit von ROT zu Grün und Blau in Summe
           besch(1,s+1,1) = 0;
        end

        if verhaeltnis_Blau_zum_Rest < 80 %Verhältnis der Helligkeit von BLAU zu Rot und Grün in Summe
                besch(1,s+1,1) = 1;
        end

    else

        if  Gesamthelligkeit_innen > Gesamthelligkeit_aussen
             besch(1,s+1,1) = 2;
             if verhaeltnis_Rot_zum_Rest < 84 
              besch(1,s+1,1) = 0;
             end

             if verhaeltnis_Blau_zum_Rest < 80
                besch(1,s+1,1) = 1;
             end

        end

        if  Gesamthelligkeit_innen < Gesamthelligkeit_aussen
             besch(1,s+1,1) = 3;
             if verhaeltnis_Rot_zum_Rest < 84
                besch(1,s+1,1) = 0;
             end

             if verhaeltnis_Blau_zum_Rest < 80
                besch(1,s+1,1) = 1;
             end
        end       
    end
    end
    
        
   k = k + 6;
    l = l+1;
    end
    
   
end
    
end