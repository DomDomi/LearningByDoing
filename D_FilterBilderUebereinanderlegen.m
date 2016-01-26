function Ergebnis = D_FilterBilderUebereinanderlegen(A,ergh0,ergSobelx,ergSobely)

[z,s,t] = size(A);
Ergebnis = zeros(z,s,t, 'uint8');
for t = 1:t
for i = 1:z
    for j = 1:s
        if abs(ergh0(i,j,t)) > Ergebnis(i,j,t)
        Ergebnis(i,j,t) = abs(ergh0(i,j,t));
        end
        if abs(ergSobelx(i,j,t)) > Ergebnis(i,j,t)
        Ergebnis(i,j,t) = abs(ergSobelx(i,j,t));
        end
        if abs(ergSobely(i,j,t)) > Ergebnis(i,j,t)
        Ergebnis(i,j,t) = abs(ergSobely(i,j,t));
        end    
    end
end
end
end