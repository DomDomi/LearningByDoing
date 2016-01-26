function h = Histogramm_Muenze(Bild)
double zaehlvariable;
double k;
double l;
zaehlvariable = 0;
for l = 1:3
for k = 1:256
    h(k,l) = 0;
end
end

[z,s,t] = size (Bild);
for ebene = 1:3
    for i = 1:z
        for j = 1:s
            if (Bild(i,j,ebene)== 0) || (Bild(i,j,ebene) >= 250)
            zaehlvariable = zaehlvariable + 1;
            else            
            h(double(Bild(i,j,ebene))+1,ebene) = h(double(Bild(i,j,ebene))+1,ebene)+1;
            end
        end
    end
end


end