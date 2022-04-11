pkg load data-smoothing;
Co60 = csvread("Co60/Co60.csv");
Cs137 = csvread("Cs137/Cs137.csv");
Na22 = csvread("Na22/Na22.csv");


#[Co60s, lambda] = regdatasmooth(Co60(1:end,1), Co60(1:end,2));
#[Cs137s, lambda] = regdatasmooth(Cs137(1:end,1), Cs137(1:end,2));
#[Na22s, lambda] = regdatasmooth(Na22(1:end,1), Na22(1:end,2));
#M = [Na22(1:end,1), Co60s, Cs137s, Na22s];
#csvwrite("output.csv", M);

logCo60 = log10(Co60(1:end,2));
logCs137 = log10(Cs137(1:end,2));
logNa22 = log10(Na22(1:end,2));

[Co60s, lambda] = regdatasmooth(Co60(1:end,1), logCo60);
[Cs137s, lambda] = regdatasmooth(Cs137(1:end,1), logCs137);
[Na22s, lambda] = regdatasmooth(Na22(1:end,1), logNa22);
N = [Na22(1:end,1), Co60s, Cs137s, Na22s];
csvwrite("outputLOG.csv", N);


plot(Co60(1:end,1),Co60(1:end,2),
     Cs137(1:end,1),Cs137(1:end,2),
     Na22(1:end,1),Na22(1:end,2));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:100:3500, "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/Data.pdf");
close();

plot(Co60(1:end,1),M(1:end,2),
     Cs137(1:end,1),M(1:end,3),
     Na22(1:end,1),M(1:end,4));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:100:3500, "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/Smooth.pdf");
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