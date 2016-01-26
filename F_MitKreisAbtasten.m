function array_fuer_die_ermittelten_Kreise = F_MitKreisAbtasten(Bild)
double z;
double s;
double mx;
double my;
double r;
double ra;
double ri;
double genauigkeit;
double stop;
double r_errechnet;
double innenkreisGefunden;
innenkreisGefunden = 0;


stop = 0;
[z,s,t] = size(Bild)
%1,1: Außenkreis vorhanden vorhanden: ja == 1; Nein == 0
%1,2: Innenkreis vorhanden vorhanden: ja == 1; Nein == 0
%1,3: Radius Außenkreis
%1,4: x-Koordinate Mittelpunkt Außenkreis
%1,5: y-Koordinate Mittelpunkt Außenkreis
%1,3: Radius Innenkreis
%1,4: x-Koordinate Mittelpunkt Innenkreis
%1,5: y-Koordinate Mittelpunkt Innenkreis
% array_fuer_die_ermittelten_Kreise = zeros(1,8,'double');



%Anfangsradius annhand der Bildgröße ermitteln
% % if z <= s
% r_errechnet = z/2-1
% else
% r_errechnet = s/2-1    
% end

array_fuer_die_ermittelten_Kreise = zeros(1000,9,'double');
double j;
j = 1;

%Außenkante ermitteln
%Normal 80
genauigkeit = 60;

% for ra = r_errechnet:-1:20
% for ra = 126:-4:102
% for ra = 127:-1:120
for ra = 134:-1:83
% for ra = 68:-1:42
% for ra = 34:-1:21
noch_frei = 1;
    for mx = 1+ra:1:z-ra
        for my = 1+ra:1:s-ra        
           KanteGefunden = linescan(Bild,mx,my,ra,genauigkeit);
            for k = 1:10   
                if ((mx - 5) < array_fuer_die_ermittelten_Kreise(k,4)) && ((mx + 5) > array_fuer_die_ermittelten_Kreise(k,4)) && ((my - 5) < array_fuer_die_ermittelten_Kreise(k,5)) && ((my + 5) > array_fuer_die_ermittelten_Kreise(k,5))
                noch_frei = 0;
                end
            end
           if (KanteGefunden == 1) && (noch_frei == 1)
            

                array_fuer_die_ermittelten_Kreise(j,1) = 1;
                array_fuer_die_ermittelten_Kreise(j,3) = round(ra);
                array_fuer_die_ermittelten_Kreise(j,4) = round(mx);
                array_fuer_die_ermittelten_Kreise(j,5) = round(my);

               
%                 Innenkannte suchen
                
                ri = ra * 0.72;
                r = ri;
%                 Normal 40
                genauigkeit = 100;
                KanteGefunden = linescan(Bild,mx,my,r,genauigkeit);
                if KanteGefunden == 1

                    array_fuer_die_ermittelten_Kreise(j,2) = 1;
                    array_fuer_die_ermittelten_Kreise(j,6) = round(r);
                    array_fuer_die_ermittelten_Kreise(j,7) = round(mx);
                    array_fuer_die_ermittelten_Kreise(j,8) = round(my);

                    innenkreisGefunden = innenkreisGefunden+1
                end  
                j = j +1
           end 
 noch_frei = 1;
        end       
    end 
 disp(ra)
end

     


% stop = 0;
% % Wenn existent die Innenkante
% %Der Innenradius zum außenradius steht im Verhältnis von innen/außen = 0,72
% ri = ra * 0.72;
% r = ri;
% %Normal 40
% genauigkeit = 50;
% for mx = 1+r:1:z-r
%         for my = 1+r:1:s-r        
%            KanteGefunden = linescan(Bild,mx,my,r,genauigkeit);
%            if KanteGefunden == 1
%                stop = 1;
% %                kreiszeichnen(mx,my,r);
%                 array_fuer_die_ermittelten_Kreise(1,2) = 1;
%                 array_fuer_die_ermittelten_Kreise(1,6) = round(r);
%                 array_fuer_die_ermittelten_Kreise(1,7) = round(mx);
%                 array_fuer_die_ermittelten_Kreise(1,8) = round(my);
% %            else
% %                 array_fuer_die_ermittelten_Kreise(1,2) = 0;
% %                 array_fuer_die_ermittelten_Kreise(1,6) = 0;
% %                 array_fuer_die_ermittelten_Kreise(1,7) = 0;
% %                 array_fuer_die_ermittelten_Kreise(1,8) = 0;
%            break;end
%         end
%            if stop == 1
%                break;end
% end
   


function KanteGefunden = linescan(Bild,mx,my,r,genauigkeit)
double beschleuniung_durch_kontrolle;
double l;
double KanteGefunden;
double Anzahl_Abtastungen;
double Grenze_fuer_erkennen_von_Kante;
double kreispunkte;
l = 0;
beschleuniung_durch_kontrolle = 0;
Grenze_fuer_erkennen_von_Kante = 0;
Anzahl_Abtastungen = 0;
KanteGefunden = 0;
kreispunkte = 2*pi;
double stop;
stopp = 0;

for i=((2*pi)/360):((2*pi)/200):kreispunkte
    Anzahl_Abtastungen = Anzahl_Abtastungen+1;
end

Grenze_fuer_erkennen_von_Kante = (Anzahl_Abtastungen/100)*genauigkeit;

    for i=((2*pi)/360):((2*pi)/200):kreispunkte %einmal im Kreis herum in 2*PI/360 Schritten
        x_w = round(mx+r*cos(i));
        y_w = round(my+r*sin(i));
        beschleuniung_durch_kontrolle = beschleuniung_durch_kontrolle+1;
        
        if (Bild(x_w,y_w) >= 255) %Schauen ob ein rauwert an der Koordinate passend ist 
           l = l+1;        %Falls er passt, wird die Zählvariable erhöht
        end   

%         if (((beschleuniung_durch_kontrolle < 30) && (l < beschleuniung_durch_kontrolle))) || (l == 0)            
%             break;
%         end
if beschleuniung_durch_kontrolle > l, break, end

    end      
    if l >= Grenze_fuer_erkennen_von_Kante
        KanteGefunden = 1; 
    end   
end



end
