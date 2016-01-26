function kreiszeichnen(my,mx,r) %Sau dumm das ich das drehen muss
Winkel=((2*pi)/360):((2*pi)/360):2*pi;
xp=r*cos(Winkel);
yp=r*sin(Winkel);
plot(mx+xp,my+yp);
end