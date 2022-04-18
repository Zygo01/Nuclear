pkg load data-smoothing;
U = csvread("widmo.csv");
#M = csvread("output.csv");

[Us, lambda] = regdatasmooth(U(1:end,1), U(1:end,2));
M = [U(1:end,1), U(1:end,2), Us];
csvwrite("output.csv", M);
#{
plot(Co60(1:end,1),Co60(1:end,2),
     Cs137(1:end,1),Cs137(1:end,2),
     Na22(1:end,1),Na22(1:end,2));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:500:10000, "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/Data.pdf");
close();

semilogy(Co60(1:end,1),Co60(1:end,2),
     Cs137(1:end,1),Cs137(1:end,2),
     Na22(1:end,1),Na22(1:end,2));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/DataLOG.pdf");
close();

plot(Co60(210:6000,1),M(210:6000,2),
     Cs137(210:6000,1),M(210:6000,3),
     Na22(210:6000,1),M(210:6000,4));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "ytick", 0:500:10000, "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/Smooth.pdf");
close();

semilogy(Co60(210:6000,1),abs(M(210:6000,2)),
     Cs137(210:6000,1),abs(M(210:6000,3)),
     Na22(210:6000,1),abs(M(210:6000,4)));
axis("tight", "tic");
set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
set (gca (), "xtick", 0:200:8200)
legend("Co60","Cs137","Na22");
print ("Plots/SmoothLOG.pdf");
close();
#}