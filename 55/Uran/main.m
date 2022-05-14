M = csvread("output.csv");
x = M(700:end,1);
y = M(700:end,2);

[pks, loc, extra] = findpeaks(y,'MinPeakHeight',75,"MinPeakDistance",150);
loc = loc.+700;

E = [186.2;240.0;295.2;351.9;609.3;768.4;1120.3;1238.1;1764.5];
[p,s] = polyfit(loc, E, 1);
dp=sqrt (diag (s.C)/s.df)*s.normr;
xp=polyval(p,linspace(700, 8193, 7493));


plot(loc,E,"r.","markersize", 12,
     x,xp );
axis("tight", "tic");
xlabel("chanel");
ylabel("E [KeV]");
axis([700, 8000, 0, 2000]);
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:100:2000, "xtick", 700:200:8000)
print ("Plots/EnergyPeaksPolyfit.pdf");
#close();