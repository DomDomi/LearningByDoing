%Das eingelesene Bild wird Binarisiert. Der Grenzwert wird mit übergeben.
%Das Binarisierte Bild wird dann gleich weiterverwendet um die Anzahl der
%Ringe zu erkennen.
function kant_Binar = E_BinarisierungMuenze(Kantenbild,Grenzwert)
double ebene;
[z,s,t] = size(Kantenbild);
kant_Binar = zeros(z,s,t,'uint8');

    for ebene = 1:t
        for i = 1:z
            for j = 1:s
                if (Kantenbild(i,j,1) >= Grenzwert) && (Kantenbild(i,j,2) >= Grenzwert) && (Kantenbild(i,j,3) >= Grenzwert)
                    
                    kant_Binar (i,j,1) = 255;
                    kant_Binar (i,j,2) = 255;
                    kant_Binar (i,j,3) = 255;
                else 
                    kant_Binar (i,j,1) = 0;
                    kant_Binar (i,j,2) = 0;
                    kant_Binar (i,j,3) = 0;
                end
            end
        end
    end
end