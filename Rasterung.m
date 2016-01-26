function rasterbild = Rasterung(rasterungsgrad, Bild)
[zeile,spalte,t_ebene] = size(Bild); %Dimensin des Eingangsbildes

t = rasterungsgrad;
r = 2;
s = 2;
if rasterungsgrad >= 8
    r = rasterungsgrad/4;
    s = rasterungsgrad/4;
    r = 2*r;
    s = 2*s;
end
if s == 16 
    rasterungsgrad = 16;
    r = 8;
    s = 4;
    t = 8;
end
if rasterungsgrad == 2
    k = -1;
    l = -1;
end
if rasterungsgrad > 2
    k = 1;
    l = 1;
end
for ebene = 1:t_ebene
    for i = 1:(zeile)/rasterungsgrad %Die Zeilen dimension um den Faktor kleiner machen
        for j = 1:(spalte)/t %Die Spaltendimension um den Faktor kleiner machen
            rasterbild(i,j,ebene) = Bild(r*i+l, s*j+k,ebene); 
            k = k+s;
                if rasterungsgrad == 2
                   k = -1;
                end
        end    
        l = l+r;        
        k = 1;
            if rasterungsgrad == 2
               l = -1;
            end
    end
    
   if rasterungsgrad >= 8
    r = rasterungsgrad/4;
    s = rasterungsgrad/4;
    r = 2*r;
    s = 2*s;
    end
    if s == 16 
        rasterungsgrad = 16;
        r = 8;
        s = 4;
        t = 8;
    end
    if rasterungsgrad == 2
        k = -1;
        l = -1;
    end
    if rasterungsgrad > 2
        k = 1;
        l = 1;
    end

end

end

