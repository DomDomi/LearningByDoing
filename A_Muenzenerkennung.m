function A_Muenzenerkennung()

clc;
close all;
clear all;
tic;
%--------------------------------------------------------------------------


%Variablen deklarieren
double ebene;
ebene = 0;
array_fuer_die_ermittelten_Kreise = zeros(1000,9, 'double');
h_ausschnitt = zeros(6,255,'double');
%--------------------------------------------------------------------------


%Originalbild einlesen
Original = imread('C:\Users\admin\Documents\MATLAB\Projektarbeit\Eigene_Bilder\Variables Obektiv\02\alle\02_alle_var_4malRingunten+boden_farb.bmp');
% Original = imread('C:\Users\admin\Documents\MATLAB\Projektarbeit\Eigene_Bilder\Variables Obektiv\02\überlappend\02_var_4malRingunten+boden_sw.bmp');
% Original = imread('C:\Users\admin\Documents\MATLAB\Projektarbeit\Eigene_Bilder\Variables Obektiv\02\1Euro\02_1eur_var_4malRingunten+boden_farb.bmp');

% Original = imread('C:\Users\admin\Documents\MATLAB\Projektarbeit\MuenzenBilder\1Euro.jpg');
% Original = imread('C:\Users\admin\Documents\MATLAB\Projektarbeit\MuenzenBilder\1Euro.png');
% Original = imread('einkaufswagenmarke.jpg');

%--------------------------------------------------------------------------


%Filter erzeugen
h0 = [-1, 1, 1;-1, -2, 1;-1, 1, 1]; %Hochrizontaler Kompassfilter
sobelx = [-1, -2, -1; 0, 0, 0; 1, 2, 1]; %Hochizontalter Sobel Filter
sobely = [-1,0,1;-2,0,2;-1,0,1]; % Vertikaler Sobel Filter
%--------------------------------------------------------------------------


%Kanten Glätten mit dem Gaus-Filter
gauss3_3 = B_Gaussfilter_Muenze(3,3);
A = C_FaltungMuenze(Original,gauss3_3);
%--------------------------------------------------------------------------


%Kompassfilter
ergh0 = C_FaltungMuenze(A,h0);
ergh0_ausgabe = uint8(ergh0);%Umwandlung in uint8 damit beim ausdruck alles gut geht
%--------------------------------------------------------------------------


%Sobelfilter
ergSobelx = C_FaltungMuenze(A,sobelx);
ergSobelx_ausgabe = uint8(ergSobelx);

ergSobely = C_FaltungMuenze(A,sobely);
ergSobely_ausgabe = uint8(ergSobely);
%--------------------------------------------------------------------------


% Filter übereinander legen und Max-Wert übernehmen
Kantenbild = D_FilterBilderUebereinanderlegen(A,ergh0,ergSobelx,ergSobely);
%--------------------------------------------------------------------------


%Binarisieren(Grenzwert normal von 70)
kant_Binar = E_BinarisierungMuenze(Kantenbild,20);
% L_Ausgabe_Bilder(kant_Binar,'Binarisiertes Kantenbild')

%--------------------------------------------------------------------------
% Bild rastern
rasterbild = Rasterung(4, kant_Binar);


%--------------------------------------------------------------------------


%Das Binarisierte Kantenbild abtasten um die Kanten zu ermitteln
%1€ und 2€ haben zwei kanten, alle anderen haben nur 1 ausßenkante
%Parameter in dieser Funktion sind 2 Genauigkeiten in Prozent mit der
%eingestellt werden kann, wie geschlossen der Kreis wirklich sein muss.
array_fuer_die_ermittelten_Kreise = F_MitKreisAbtasten(kant_Binar);


%--------------------------------------------------------------------------


%Die Koordinaten von den Kreisen nutzen um Ausschließlich die betrachteten Flächen einem Histogram zu unterziehen
h_ausschnitt = G_Histogramm_Muenze_Ausschnitt(Original,array_fuer_die_ermittelten_Kreise);
%--------------------------------------------------------------------------


%Kreise in den richtigen Farben einfärben
besch_ausschnitt = H_FarbenBeschneiden_Ausschnitt(Original,h_ausschnitt,array_fuer_die_ermittelten_Kreise);
%--------------------------------------------------------------------------

%Diese beiden Funktionen nicht nur da um das Bild von der einen Information
%zu trennen die ich in dem Array mit gespeichert habe um darauf zu
%schließen ob es kupfer, Messing, oder n euro bzw 2 euro Stück ist.
richtig_Eingefaerbt = I_einfaerben(besch_ausschnitt);

array_fuer_Parameter_aus_Farben = J_Farbparameter(besch_ausschnitt); 


%--------------------------------------------------------------------------
%Ausgaben_Bilder
L_Ausgabe_Bilder(Original,'Original')
hold on
K_Kreiszeichnen_mit_Array(array_fuer_die_ermittelten_Kreise)
hold off
% L_Ausgabe_Bilder(ergh0_ausgabe,'Kompass h0')
% L_Ausgabe_Bilder(ergSobelx_ausgabe,'Sobel x')
% L_Ausgabe_Bilder(ergSobely_ausgabe,'Sobel y')
% L_Ausgabe_Bilder(Kantenbild,'Kantenbild')
L_Ausgabe_Bilder(kant_Binar,'Binarisiertes Kantenbild')
% L_Ausgabe_Bilder(rasterbild,'Rasterbild')
% hold on
% K_Kreiszeichnen_mit_Array(array_fuer_die_ermittelten_Kreise)
% hold off
L_Ausgabe_Bilder(h_ausschnitt,'Histogramm')
L_Ausgabe_Bilder(richtig_Eingefaerbt,'Kreisfüllung extrahiert')

time = toc;
x = ['Benötigte zeit', num2str(time)];
disp(x)

%--------------------------------------------------------------------------
%Ausgabe_Text
% M_Ausgabe_Text(array_fuer_die_ermittelten_Kreise,array_fuer_Parameter_aus_Farben);

end