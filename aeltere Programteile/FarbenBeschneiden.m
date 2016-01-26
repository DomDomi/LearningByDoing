% Bild beschneiden(im Sinne von FBildrbwerte Bildbscheiden)

function besch = FarbenBeschneiden(Bild,h)

[z,s,t] = size(Bild);
besch = ones(z,s,t, 'uint8');
besch = Bild;
%1 = rot; 2 = grün; 3 = blau
            

%     for i = 1:z
%         for j = 1:s                
%             if Bild(i,j,1) <= 205 || Bild(i,j,1) >= 220
%             besch(i,j,1) = 0; 
%             end
%             if Bild(i,j,2) <= 195 || Bild(i,j,2) >= 215
%             besch(i,j,2) = 0;        
%             end
%             if Bild(i,j,3) <= 190 || Bild(i,j,3) >= 215
%             besch(i,j,3) = 0;            
%             end
%         end
%     end

      
% 
%     for i = 1:z
%         for j = 1:s                
%             if (Bild(i,j,1) ~= 236) && (Bild(i,j,2) ~= 220) && (Bild(i,j,3) ~= 197)
%             besch(i,j,1) = 0; 
%              besch(i,j,2) = 0; 
%             besch(i,j,3) = 0;  
%             end
%         end
%     end
    
    
%    

% max=0;
%     for i=256:-1:0
%         %Diesesmal laufe ich Rückwärts: Der erst Grauwert der nicht mehr Null ist(aber von oben), der führt in die
%         %if-schleife. Danach wird sie abgebrochen
%             if h(i)~=0
%                 max = i-1
%                if h(i)~= 0
%                break
%                end
%             end
%     end
%     maximum = max;
% 
double durchschnittRot
double durschschnittGruen
double durschschnittBlau
double m;
double n;
double o;



RotZaehlvariable = 0;
GruenZaehlvariable = 0;
BlauZaehlvariable = 0;
rot = 0;
gruen = 0;
blau = 0;
durchschnittRot = 0;
durchschnittGruen = 0;
durchschnittBlau = 0;
m = 0;
n = 0;
o = 0;

%Mit dieser Schleife hab ich einfach den höchstwert ermittelt, also den
%Farbwert in welchen die meisten Pixel eingefärbt wurden.
% for i = 1:256
%    if rot < h(i,1)
%        rot = h(i,1);
%           
%        RotZaehlvariable = i-1;
%    end
%    if gruen < h(i,2)
%        gruen = h(i,2);
%        
%        GruenZaehlvariable = i-1;
%    end
%    if blau < h(i,3)
%        blau = h(i,3);
%        
%        BlauZaehlvariable = i-1;
%    end
% end

%mit dieser schleife ermittel ich den Durchschnitt
%Erfolg!!!! so wird es klappen.
%Für das den 1Euro und 2Euro muss die Farbe nochmals nur innerhalb des Kreises ermittelt werden
%Dann lässt sich bestimmt auch das Gold vom Silber trennen
for i = 1:256
   
       rot = rot + h(i,1);
       m = m + h(i,1)*i;       
      
   
       gruen = gruen + h(i,2);
       n = n + h(i,2)*i;
       
  
       blau = blau + h(i,3);
       o = o + h(i,3)*i;
       
   
end

durchschnittRot = m/rot
durchschnittGruen = n/gruen
durchschnittBlau = o/blau

% RotZaehlvariable
% GruenZaehlvariable
% BlauZaehlvariable
% 
% RotZaehlvariable =
% 
%    247
% 
% 
% GruenZaehlvariable =
% 
%    228
% 
% 
% BlauZaehlvariable =
% 
%    171

    for i = 1:z
        for j = 1:s                
%             if (Bild(i,j,1) <= 234 || Bild(i,j,1) >= 238) && (Bild(i,j,2) <= 218 || Bild(i,j,2) >= 223) && (Bild(i,j,3) <= 195 || Bild(i,j,3) >= 205)
%           50cent
%               Schleifen inhalt für maxwert
%             besch(i,j,1) = RotZaehlvariable;
%             besch(i,j,2) = GruenZaehlvariable; 
%             besch(i,j,3) = BlauZaehlvariable; 
%             
% schleifeninhalt zum testen von willkürlichen werten
%             besch(i,j,1) = 105;
%             besch(i,j,2) = 131; 
%             besch(i,j,3) = 220; 

%             schleifeninhalt für Durchschnitt
              besch(i,j,1) = durchschnittRot;
            besch(i,j,2) = durchschnittGruen; 
            besch(i,j,3) = durchschnittBlau; 

        end
    end
    
end