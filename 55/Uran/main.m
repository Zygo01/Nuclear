M = csvread("output.csv");
x = M(700:end,1);
y = M(700:end,2);

[pks, loc, extra] = findpeaks(y,'MinPeakHeight',75,"MinPeakDistance",150);
loc = loc.+700;

E = [184.36;240.18;293.17;349.70;606.3;764.76;1115.48;1232.94;1757.52];
[p,s] = polyfit(loc, E, 1);
dp=sqrt (diag (s.C)/s.df)*s.normr;
xp=polyval(p,linspace(700, 8193, 7493));


plot(xp,y);
axis("tight", "tic");
axis([160, 1900, 0, 2300]);
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:200:2200, "xtick", 0:50:1900)
print ("Plots/PeaksEnergyUnits.pdf");
#close();