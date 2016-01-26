function richtig_Eingefaerbt = I_einfaerben(besch)

[z,s,t] = size(besch);
richtig_Eingefaerbt = ones(z,s-1,t,'uint8');

for ebene = 1:3
    for i = 1:z
        for j = 1:s-1
            richtig_Eingefaerbt(i,j,ebene) = besch(i,j,ebene);
        end
    end
end


end