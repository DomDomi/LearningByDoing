function M_Ausgabe_Text(array_kreise,array_Farben)

%Eurocent wurde erkannt
if (array_kreise(1,1) == 1) && array_Farben == 0  
    
    msgbox('1,2 oder 5 Cent')   
end
if (array_kreise(1,1) == 1) && array_Farben == 1  
  
    msgbox('10,20 oder 50 Cent')   
end


%Euro wurde erkannt
if array_kreise(1,2) == 1 && array_Farben == 2
    
    msgbox('1 Euro')
end

if (array_kreise(1,2) == 1) && array_Farben == 3 
    
    msgbox('2 Euro')   
end


%nicht ganz so sichere fälle
if array_kreise(1,2) == 1 && array_Farben == 0
    msgbox('Es wurden zwar zwei Kreise detektiert, aber die Farbe ist Kupfer. Deshalb ist es wahrscheinlich ein 1,2 oder 5 Cent Stück')
end

if (array_kreise(1,2) == 1) && array_Farben == 1    
    msgbox('Es wurden zwar zwei Kreise detektiert, aber die Farbe ist Messing. Deshalb ist es wahrscheinlich ein 10,20 oder 50 Cent Stück')
end

end