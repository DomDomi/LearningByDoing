function L_Ausgabe_Bilder(Dokument,titel)

%Die Histogram-Plotte haben den Datentyp double
if isa(Dokument, 'double')    
        figure();
        plot(Dokument);
        title(titel);
end
%Die Bilder haben den Datentyp uint8
if isa(Dokument, 'uint8')
    figure()
    imshow(Dokument);
    title(titel);
end

end