pkg load data-smoothing;
Co60_1 = csvread("Scyntylator/Co60/Co60.csv");
Cs137_1 = csvread("Scyntylator/Cs137/Cs137.csv");
Na22_1 = csvread("Scyntylator/Na22/Na22.csv");
Co60_2 = csvread("Semiconductor/Co60/Co60.csv");
Cs137_2 = csvread("Semiconductor/Cs137/Cs137.csv");
Na22_2 = csvread("Semiconductor/Na22/Na22.csv");

#logCo60 = log10(Co60(1:end,2));
#logCs137 = log10(Cs137(1:end,2));
#logNa22 = log10(Na22(1:end,2));


#[Co60s1, lambda] = regdatasmooth(Co60_1(1:end,1), Co60_1(1:end,2));
#[Cs137s1, lambda] = regdatasmooth(Cs137_1(1:end,1), Cs137_1(1:end,2));
#[Na22s1, lambda] = regdatasmooth(Na22_1(1:end,1), Na22_1(1:end,2));
#[Co60s2, lambda] = regdatasmooth(Co60_2(1:end,1), Co60_2(1:end,2));
#[Cs137s2, lambda] = regdatasmooth(Cs137_2(1:end,1), Cs137_2(1:end,2));
#[Na22s2, lambda] = regdatasmooth(Na22_2(1:end,1), Na22_2(1:end,2));
#M = [Na22_1(1:end,1), Co60s1, Cs137s1, Na22s1, Co60s2, Cs137s2, Na22s2];
#csvwrite("output.csv", M);

a=400;
b=6500;

semilogy(Co60_1(a:b,1),M(a:b,2),
     Cs137_1(a:b,1),M(a:b,3),
     Na22_1(a:b,1),M(a:b,4),
     Co60_1(a:b,1),M(a:b,5),
     Cs137_1(a:b,1),M(a:b,6),
     Na22_1(a:b,1),M(a:b,7));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "xtick", 0:200:8200)
legend("Co60 Scyntylator","Cs137 Scyntylator","Na22 Scyntylator",
      "Co60 Semiconductor","Cs137 Semiconductor","Na22 Semiconductor",
      "location", "bestoutside");
print ("Plots/Smooth2.pdf");
close();




#{
plot(Co60s1(1:end,1),Co60s1(1:end,2),
     Cs137s1(1:end,1),Cs137s1(1:end,2),
     Na22s1(1:end,1),Na22s1(1:end,2),
     Co60s2(1:end,1),Co60s2(1:end,2),
     Cs137s2(1:end,1),Cs137s2(1:end,2),
     Na22s2(1:end,1),Na22s2(1:end,2));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:500:10000, "xtick", 0:200:8200)
legend("Co60 Scyntylator","Cs137 Scyntylator","Na22 Scyntylator",
      "Co60 Semiconductor","Cs137 Semiconductor","Na22 Semiconductor");
print ("Plots/DataSmooth1.pdf");
close();

plot(Co60(210:6000,1),abs(N(210:6000,2)),
     Cs137(210:6000,1),abs(N(210:6000,3)),
     Na22(210:6000,1),abs(N(210:6000,4)));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "xtick", 200:200:6000)
legend("Co60","Cs137","Na22");
print ("Plots/SmoothLOG.pdf");
close();
#}