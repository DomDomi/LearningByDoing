%Das eingelesene Bild wird Binarisiert. Der Grenzwert wird mit übergeben.
%Das Binarisierte Bild wird dann gleich weiterverwendet um die Anzahl der
%Ringe zu erkennen.
function kant_Binar = E_BinarisierungMuenze(Kantenbild,Grenzwert)
double ebene;
[z,s,t] = size(Kantenbild);
kant_Binar = zeros(z,s,t,'uint8');

