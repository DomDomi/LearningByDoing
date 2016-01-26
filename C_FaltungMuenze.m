function Ergebnis = C_FaltungMuenze(A, filter)
A=double(A); %Typcast
filter=double(filter); %Typcast
[z1,s1,t] = size(A);
[z2,s2] = size(filter);

%Bildränder mit Nullen vergrößern
B = zeros(z1+z2,s1+s2,t, 'double');
for ebene = 1:t
for i = 1:z1
    for j = 1:s1        
            B(i,j,ebene) = A(i,j,ebene);
    end   
end
end

Ergebnis = zeros(z1,s1,t, 'double');
for ebene = 1:t
    for p = 1:1:z1
        for q = 1:1:s1 
            zwischenspeicher = 0;    
             for i = 1:z2
                    for j = 1:s2   
                        zwischenspeicher = zwischenspeicher + (B(p+i-1,q+j-1,ebene) * filter(i,j));                    
                    end                
             end          
             Ergebnis(p,q,ebene) = zwischenspeicher;

        end      
    end
end


end


