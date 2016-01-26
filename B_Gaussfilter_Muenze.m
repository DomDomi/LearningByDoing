function [gauss] = B_Gaussfilter_Muenze(dimx,dimy)

%Zwei Ein-Dimensionale Array's mit Nullen initialisieren
for k = 1:dimx
    spalten(k) = 0;
end
for k = 1:dimy
    zeilen(k) = 0;
end

%erste zeile und erste spalte berechnen
    for k = 1:(dimx)
    spalten(k) = fakultaet(dimx-1,k-1);
    end
    for k = 1:(dimy)
    zeilen(k) = fakultaet(dimy-1,k-1);
    end 
spalten;
zeilen;

%Mi der ersten Zeile und Spalte die Matrix voll machen
gauss = zeros(length(zeilen),length(spalten), 'double');
    for i = 1:length(zeilen)
        for j = 1:length(spalten)
            gauss(i,j) = zeilen(i)*spalten(j);
        end
    end  
disp('-------------------------------------------------------------------') 
disp(['Gaussfilter ',num2str(dimx), ' mal ' ,num2str(dimy)]);    
gauss   
gauss=gauss/sum(sum(gauss))
end


function erg = fakultaet(n,k)

erg = factorial(n)/(factorial(k)* factorial(n-k));

end