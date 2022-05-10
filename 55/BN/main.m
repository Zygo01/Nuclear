pkg load data-smoothing;

Co60_1 = csvread("Co60/Co60_1.csv");
Cs137_1 = csvread("Cs137/Cs137_1.csv");
Na22_1 = csvread("Na22/Na22_1.csv");
#####################
Co60_2 = csvread("Co60/Co60_2.csv");
Cs137_2 = csvread("Cs137/Cs137_2.csv");
Na22_2 = csvread("Na22/Na22_2.csv");
#####################
X=Co60_1(1:end,1);

#[Co60s1, lambda] = regdatasmooth(Co60_1(1:end,1), Co60_1(1:end,2));
#[Cs137s1, lambda] = regdatasmooth(Cs137_1(1:end,1), Cs137_1(1:end,2));
#[Na22s1, lambda] = regdatasmooth(Na22_1(1:end,1), Na22_1(1:end,2));
#[Co60s2, lambda] = regdatasmooth(Co60_2(1:end,1), Co60_2(1:end,2));
#[Cs137s2, lambda] = regdatasmooth(Cs137_2(1:end,1), Cs137_2(1:end,2));
#[Na22s2, lambda] = regdatasmooth(Na22_2(1:end,1), Na22_2(1:end,2));
#M = [X, Co60s1, Cs137s1, Na22s1, Co60s2, Cs137s2, Na22s2];
#csvwrite("output.csv", M);

M = csvread("output.csv");
#M = [X, Co60s1, Cs137s1, Na22s1, Co60s2, Cs137s2, Na22s2];


semilogy(X,Co60_1(1:end,2),
     X,Cs137_1(1:end,2),
     X,Na22_1(1:end,2)  
     );
axis("tight", "tic");
axis([0, 8200, 1, 4000]);
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
#set (gca (), "ytick", 0:200:2400, "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/DataScyntySmoothLOG.pdf");
close();

#{
plot(Co60(1:end,1),M(1:end,2),
     Cs137(1:end,1),M(1:end,3),
     Na22(1:end,1),M(1:end,4));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:100:3500, "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/Smooth.pdf");
close();

semilogy(Co60(210:6000,1),abs(M(210:6000,2)),
     Cs137(210:6000,1),abs(M(210:6000,3)),
     Na22(210:6000,1),abs(M(210:6000,4)));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "xtick", 200:200:6000)
legend("Co60","Cs137","Na22");
print ("Plots/SmoothLOG.pdf");
close();
#}