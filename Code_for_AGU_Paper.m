
%% CODE FOR: "Imprints of intense geomagnetic storm on Very Low Frequency (VLF) radio waves over the Mediterranean region" %%

%% GEOMAGNETIC STORM INDICES                             1               
%%                                                      FIGURE 2(a-e)

clc
set(gcf,'color','w');
index_dt21 =  readtable('C:\Users\muyiw\OneDrive\Desktop\GStorm2023\indices_day21.xlsx'); 
index_dt22 =  readtable('C:\Users\muyiw\OneDrive\Desktop\GStorm2023\indices_day22.xlsx'); 
index_dt23 =  readtable('C:\Users\muyiw\OneDrive\Desktop\GStorm2023\indices_day23.xlsx'); 
index_dt24 =  readtable('C:\Users\muyiw\OneDrive\Desktop\GStorm2023\indices_day24.xlsx'); 
index_dt25 =  readtable('C:\Users\muyiw\OneDrive\Desktop\GStorm2023\indices_day25.xlsx'); 
index_dt26 =  readtable('C:\Users\muyiw\OneDrive\Desktop\GStorm2023\indices_day26.xlsx'); 

Temp21 = resample(index_dt21.ion_temp,1,24);
Temp22 = resample(index_dt22.ion_temp,1,24);
Temp23 = resample(index_dt23.ion_temp,1,24);
Temp24 = resample(index_dt24.ion_temp,1,24);
Temp25 = resample(index_dt25.ion_temp,1,24);
Temp26 = resample(index_dt26.ion_temp,1,24);
K = [Temp21;Temp22;Temp23;Temp24;Temp25;Temp26];
K(K==0|K==-1.00e+05)=NaN; 

PD21 = resample(index_dt21.proton_density,1,24);
PD22 = resample(index_dt22.proton_density,1,24);
PD23 = resample(index_dt23.proton_density,1,24);
PD24 = resample(index_dt24.proton_density,1,24);
PD25 = resample(index_dt25.proton_density,1,24);
PD26 = resample(index_dt26.proton_density,1,24);
PD = [PD21;PD22;PD23;PD24;PD25;PD26];
PD(PD==0|PD==-9999.9)=NaN;

Vsw21 = resample(index_dt21.solaWindSpeed,1,24);
Vsw22 = resample(index_dt22.solaWindSpeed,1,24);
Vsw23 = resample(index_dt23.solaWindSpeed,1,24);
Vsw24 = resample(index_dt24.solaWindSpeed,1,24);
Vsw25 = resample(index_dt25.solaWindSpeed,1,24);
Vsw26 = resample(index_dt26.solaWindSpeed,1,24);
Vsw = [Vsw21;Vsw22;Vsw23;Vsw24;Vsw25;Vsw26];
Vsw(Vsw==0|Vsw==-9999.9)=NaN;
xscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Vsw));    

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));
rect = [0.1226, 0.83, 0.3, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
plot(scale_SYMH,SYMH.SYMH,LineStyle="-",LineWidth=1.5);
ylim([-250 100])
ylabel("SYMH (nT)")
title('(a)')
grid on;set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')

Bz2126 = readtable("C:\Users\muyiw\OneDrive\Desktop\GStorm2023\Bz_21_26.xlsx");
xscale2 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Bz2126.Bz));  
rect = [0.1226, 0.7, 0.3, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
plot(xscale2,Bz2126.Bz ,LineWidth=1.5)
ylim([-20 15])
ylabel("Bz (nT)")
title('(b)')
grid on;set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')


rect = [0.1226, 0.57, 0.3, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
plot(xscale,Vsw,LineWidth=1.5)
ylim([-100 700])
ylabel("Vsw (Km/s)")
title('(c)')
grid on;set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red')
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')

rect = [0.1226, 0.44, 0.3, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
plot(xscale,K,LineWidth=1.5)
ylim([-140000 700000])
ylabel("T (K)")
title('(d)')
grid on;set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red')
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')


rect = [0.1226, 0.31, 0.3, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
plot(xscale,PD,LineWidth=1.5)
grid on;set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on')
ylim([-2 8])
ylabel("PD (W/m2)")
title('(e)')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
KPLMAProto = readtable("C:\Users\muyiw\OneDrive\Desktop\GStorm2023\KP_LMA_Proto.xlsx");
KPLMAProto.Kp;
xscale1 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(KPLMAProto.Kp));    
rect = [0.1226, 0.18, 0.3, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
plot(xscale1,KPLMAProto.Kp,LineWidth=1.5)
ylim([-1 10])
ylabel("Kp (nT)")
title('(f)')
grid on;set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red')
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')


rect = [0.1226, 0.05, 0.3, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
plot(xscale1,KPLMAProto.Proton_Flux ,LineWidth=1.5)
grid on;set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on')
ylim([-0.1 0.7])
ylabel("protron flux (W/m2)")
title('(g)')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')



%%  DAY-TO-DAY VARIABILITY  %%                                   2      

%% TBB NS                                                                   FIGURE 3   
clc;set(gcf,'color','w');
%dat22  = NaN([1440 1]);Quiet Days: 27,13,28,29,17,16,11,21,26,8 (10 Quiet days included) %Disturbed Days: 
window_length = 63; polynomial_order = 3;
                                    
                               
load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day17 = sgolayfilt(dat17, polynomial_order, window_length);
Day18 = sgolayfilt(dat18, polynomial_order, window_length);
Day19 = sgolayfilt(dat19, polynomial_order, window_length);
Day20 = sgolayfilt(dat20, polynomial_order, window_length);

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);

Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

Day27 = sgolayfilt(dat27, polynomial_order, window_length);
Day29 = sgolayfilt(dat29, polynomial_order, window_length);
Day30 = sgolayfilt(dat30, polynomial_order, window_length);

Diff20 = (Day20-meanData);
Diff21 = (Day21-meanData);
Diff22 = (Day22-meanData);
Diff23 = (Day23-meanData);
Diff24 = (Day24-meanData);
Diff25 = (Day25-meanData);
Diff26 = (Day26-meanData);

     rect = [0.1, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day18,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
legend("Mean","+2σ","-2σ","+3σ","-3σ","18 Mar 2023",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'a) 18 March 2023 TBB (N/S)','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');

         rect = [0.34, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day19,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'b) 19 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


         rect = [0.58, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day20,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'c) 20 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% (1-3) %%%%%%%%


     rect = [0.1, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day21,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'d) 21 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day22,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'e) 22 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.58, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day23,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'f) 23 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 


     rect = [0.1, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day24,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'g) 24 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day25,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'h) 25 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day26,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'i) 26 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 



 rect = [0.1, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day27,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'j) 27 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day29,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'k) 29 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.58, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day30,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'l) 30 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


%% TBB EW CHANNEL                                                               FIGURE 4

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;
                                     
                                 
load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day17 = sgolayfilt(dat17, polynomial_order, window_length);
Day18 = sgolayfilt(dat18, polynomial_order, window_length);
Day19 = sgolayfilt(dat19, polynomial_order, window_length);
Day20 = sgolayfilt(dat20, polynomial_order, window_length);

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);

Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

Day27 = sgolayfilt(dat27, polynomial_order, window_length);
Day29 = sgolayfilt(dat29, polynomial_order, window_length);
Day30 = sgolayfilt(dat30, polynomial_order, window_length);


Diff20 = (Day20-meanData);
Diff21 = (Day21-meanData);
Diff22 = (Day22-meanData);
Diff23 = (Day23-meanData);
Diff24 = (Day24-meanData);
Diff25 = (Day25-meanData);
Diff26 = (Day26-meanData);


     rect = [0.1, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day18,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
legend("Mean","+2σ","-2σ","+3σ","-3σ","18 Mar 2023",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'a) 18 March 2023 TBB (E/W)','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');

         rect = [0.34, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day19,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'b) 19 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


         rect = [0.58, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day20,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'c) 20 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');          


     rect = [0.1, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day21,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'d) 21 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.34, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day22,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'e) 22 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.58, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day23,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'f) 23 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 



     rect = [0.1, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day24,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'g) 24 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day25,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'h) 25 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day26,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'i) 26 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 



 rect = [0.1, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day27,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'j) 27 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day29,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'k) 29 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day30,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 350])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,300,'l) 30 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 




%% ICV NS %%                                                                        FIGURE 5
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;
                                
load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day17 = sgolayfilt(dat17, polynomial_order, window_length);
Day18 = sgolayfilt(dat18, polynomial_order, window_length);
Day19 = sgolayfilt(dat19, polynomial_order, window_length);
Day20 = sgolayfilt(dat20, polynomial_order, window_length);

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);

Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

Day27 = sgolayfilt(dat27, polynomial_order, window_length);
Day29 = sgolayfilt(dat29, polynomial_order, window_length);
Day30 = sgolayfilt(dat30, polynomial_order, window_length);


Diff20 = (Day20-meanData);
Diff21 = (Day21-meanData);
Diff22 = (Day22-meanData);
Diff23 = (Day23-meanData);
Diff24 = (Day24-meanData);
Diff25 = (Day25-meanData);
Diff26 = (Day26-meanData);

     rect = [0.1, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day18,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
legend("Mean","+2σ","-2σ","+3σ","-3σ","18 Mar 2023",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'a) 18 March 2023 ICV (N/S)','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');

         rect = [0.34, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day19,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'b) 19 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


         rect = [0.58, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day20,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'c) 20 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');  


     rect = [0.1, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day21,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'d) 21 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.34, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day22,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'e) 22 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.58, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day23,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'f) 23 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 


     rect = [0.1, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day24,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'g) 24 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day25,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'h) 25 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day26,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'i) 26 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 



 rect = [0.1, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day27,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'j) 27 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day29,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'k) 29 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day30,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-50 200])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,180,'l) 30 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');




%% ICV EW %%                                                                    FIGURE 6
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day17 = sgolayfilt(dat17, polynomial_order, window_length);
Day18 = sgolayfilt(dat18, polynomial_order, window_length);
Day19 = sgolayfilt(dat19, polynomial_order, window_length);
Day20 = sgolayfilt(dat20, polynomial_order, window_length);

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);

Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

Day27 = sgolayfilt(dat27, polynomial_order, window_length);
Day29 = sgolayfilt(dat29, polynomial_order, window_length);
Day30 = sgolayfilt(dat30, polynomial_order, window_length);

Diff20 = (Day20-meanData);
Diff21 = (Day21-meanData);
Diff22 = (Day22-meanData);
Diff23 = (Day23-meanData);
Diff24 = (Day24-meanData);
Diff25 = (Day25-meanData);
Diff26 = (Day26-meanData);



     rect = [0.1, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day18,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
legend("Mean","+2σ","-2σ","+3σ","-3σ","18 Mar 2023",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'a) 18 March 2023 ICV (E/W)','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');

         rect = [0.34, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day19,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'b) 19 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


         rect = [0.58, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day20,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'c) 20 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');  


     rect = [0.1, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day21,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'d) 21 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.34, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day22,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'e) 22 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.58, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day23,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'f) 23 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 


     rect = [0.1, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day24,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'g) 24 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day25,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'h) 25 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day26,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'i) 26 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



 rect = [0.1, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day27,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'j) 27 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day29,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'k) 29 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day30,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([20 120])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,110,'l) 30 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 




%% NAA NS %%                                                                    FIGURE 7
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;
                                     
load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day17 = sgolayfilt(dat17, polynomial_order, window_length);
Day18 = sgolayfilt(dat18, polynomial_order, window_length);
Day19 = sgolayfilt(dat19, polynomial_order, window_length);
Day20 = sgolayfilt(dat20, polynomial_order, window_length);

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);

Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

Day27 = sgolayfilt(dat27, polynomial_order, window_length);
Day29 = sgolayfilt(dat29, polynomial_order, window_length);
Day30 = sgolayfilt(dat30, polynomial_order, window_length);

Diff20 = (Day20-meanData);
Diff21 = (Day21-meanData);
Diff22 = (Day22-meanData);
Diff23 = (Day23-meanData);
Diff24 = (Day24-meanData);
Diff25 = (Day25-meanData);
Diff26 = (Day26-meanData);


     rect = [0.1, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day18,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
legend("Mean","+2σ","-2σ","+3σ","-3σ","18 Mar 2023",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'a) 18 March 2023 NAA (N/S)','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');

         rect = [0.34, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day19,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'b) 19 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


         rect = [0.58, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day20,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'c) 20 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');          


     rect = [0.1, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day21,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'d) 21 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.34, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day22,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'e) 22 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.58, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day23,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'f) 23 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 





     rect = [0.1, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day24,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'g) 24 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day25,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'h) 25 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day26,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'i) 26 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 



 rect = [0.1, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day27,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'j) 27 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day29,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'k) 29 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day30,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'l) 30 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 




%% NAA EW %%                                                                        FIGURE 8
clc;set(gcf,'color','w');

window_length = 63; polynomial_order = 3;
                                     
load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day17 = sgolayfilt(dat17, polynomial_order, window_length);
Day18 = sgolayfilt(dat18, polynomial_order, window_length);
Day19 = sgolayfilt(dat19, polynomial_order, window_length);
Day20 = sgolayfilt(dat20, polynomial_order, window_length);

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);

Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

Day27 = sgolayfilt(dat27, polynomial_order, window_length);
Day29 = sgolayfilt(dat29, polynomial_order, window_length);
Day30 = sgolayfilt(dat30, polynomial_order, window_length);


Diff20 = (Day20-meanData);
Diff21 = (Day21-meanData);
Diff22 = (Day22-meanData);
Diff23 = (Day23-meanData);
Diff24 = (Day24-meanData);
Diff25 = (Day25-meanData);
Diff26 = (Day26-meanData);



     rect = [0.1, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day18,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
legend("Mean","+2σ","-2σ","+3σ","-3σ","18 Mar 2023",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'a) 18 March 2023 NAA (E/W)','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');

         rect = [0.34, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day19,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'b) 19 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


         rect = [0.58, 0.76, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day20,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'c) 20 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');          


     rect = [0.1, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day21,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'d) 21 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.34, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day22,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'e) 22 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.58, 0.56, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day23,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'f) 23 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 


     rect = [0.1, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day24,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'g) 24 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day25,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'h) 25 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.36, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day26,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
%xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'i) 26 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 



 rect = [0.1, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day27,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'j) 27 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');


     rect = [0.34, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day29,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'k) 29 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on');



     rect = [0.58, 0.16, 0.2, 0.11];axes( 'position' , rect );set(gca,'pos',rect);%%
scalex = linspace(0,24, length (meanData));
plot(scalex,meanData,LineWidth=2,Color='green'); hold on; 
plot(scalex,(meanData+2*std(meanData)),scalex,(meanData-2*std(meanData)),LineWidth=2,Color='k');
plot(scalex,(meanData+3*std(meanData)),scalex,(meanData-3*std(meanData)),Linestyle="--",LineWidth=1.5,Color='k');
plot(scalex,Day30,LineWidth=2,Color='blue'); hold off
set(gca, 'FontWeight', 'bold')
xticks([0, 2, 4, 6, 8, 10,12,14,16,18,20,22,24]); % Positions of the ticks
xticklabels({'0:00', '2:00', '4:00', '6:00', '8:00', '10:00','12:00','14:00','16:00', '18:00', '20:00', '22:00', '00:00'}); % Labels for the ticks
%legend("Mean","+2σ","-2σ","March 22",Orientation="vertical")
ylim([-10 100])
xlabel('\bf Time of day [hours] UT','FontSize',14);
ylabel('\bf Ampl (dB)','FontSize',14);
text(0.5,90,'l) 30 March 2023','FontSize',10,'FontWeight','bold')
xlim tight
grid on;
set(gca,'XMinorGrid','on');set(gca,'YMinorGrid','on'); 





%%  AMPLITUDE DEVIATIONS FOR TBB, ICV and NAA %%                       3   
%% TBB NS                                                                   FIGURE 9 (a)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;

load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Day27 = sgolayfilt(dat27, polynomial_order, window_length);
Day28 =  NaN([1440 1]);
Day29 = sgolayfilt(dat29, polynomial_order, window_length);

Flux = readtable("C:\Users\muyiw\OneDrive\Desktop\GST2023Data\XRData.xlsx");
FluNscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Flux.XRFlux));    
SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

%MontlymeanNSTBB = meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;
%day27NS = Day27-meanData;

rect = [0.15, 0.78, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
All_TBB_NS = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];
Nscale1 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(All_TBB_NS));
plot(Nscale1,All_TBB_NS, LineWidth=2,Color= 'b')
set(gca, 'FontWeight', 'bold')
%yline(0,LineWidth=1.5,Color='red')
yline(1*(std(All_TBB_NS)),LineWidth=1,LineStyle='-',Color='k');yline(-1*(std(All_TBB_NS)),LineWidth=1,LineStyle='-',Color='k')
yline(2*(std(All_TBB_NS)),LineWidth=1,LineStyle='--',Color='k');yline(-2*(std(All_TBB_NS)),LineWidth=1,LineStyle='--',Color='k')
yline(3*(std(All_TBB_NS)),LineWidth=1.5,LineStyle=':',Color='k');yline(-3*(std(All_TBB_NS)),LineWidth=1.5,LineStyle=':',Color='k')
xlim tight 
%title('')
ylabel("Ampl. (dB)","FontSize",12,"FontWeight","bold")
ylim([-180 180])
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
text((datetime('March 21, 2023 2:00:00')), 160, '(a)  TBB(N/S)','FontWeight','bold')
text((datetime('March 22, 2023 5:30:00')),1*(std(All_TBB_NS)),"σ",FontSize=14);text((datetime('March 22, 2023 5:00:00')),-1*(std(All_TBB_NS)),"-σ",FontSize=14);
text((datetime('March 22, 2023 5:30:00')),2*(std(All_TBB_NS)),"2σ",FontSize=14);text((datetime('March 22, 2023 5:00:00')),-2*(std(All_TBB_NS)),"-2σ",FontSize=14);
text((datetime('March 22, 2023 5:30:00')),3*(std(All_TBB_NS)),"3σ",FontSize=14);text((datetime('March 22, 2023 5:00:00')),-3*(std(All_TBB_NS)),"-3σ",FontSize=14);



%% TBB EW                                                                           FIGURE 9 (b)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;

load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Day27 = sgolayfilt(dat27, polynomial_order, window_length);

Flux = readtable("C:\Users\muyiw\OneDrive\Desktop\GST2023Data\XRData.xlsx");
FluNscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Flux.XRFlux));    
SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

MontlymeanNSTBB = meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;
%day27NS = Day27-meanData;
rect = [0.5, 0.78, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
All_TBB_NS = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];
Nscale1 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(All_TBB_NS));
plot(Nscale1,All_TBB_NS, LineWidth=2,Color= 'b')
set(gca, 'FontWeight', 'bold')
%yline(0,LineWidth=1.5,Color='red')
yline(1*(std(All_TBB_NS)),LineWidth=1,LineStyle='-',Color='k');yline(-1*(std(All_TBB_NS)),LineWidth=1,LineStyle='-',Color='k')
yline(2*(std(All_TBB_NS)),LineWidth=1,LineStyle='--',Color='k');yline(-2*(std(All_TBB_NS)),LineWidth=1,LineStyle='--',Color='k')
yline(3*(std(All_TBB_NS)),LineWidth=1.5,LineStyle=':',Color='k');yline(-3*(std(All_TBB_NS)),LineWidth=1.5,LineStyle=':',Color='k')
xlim tight 
%title('')
ylabel("Ampl. (dB)","FontSize",12,"FontWeight","bold")
ylim([-180 180])
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
text((datetime('March 21, 2023 2:00:00')), 160, '(b)  TBB(E/W)','FontWeight','bold')
text((datetime('March 23, 2023 5:30:00')),1*(std(All_TBB_NS)),"σ",FontSize=14);text((datetime('March 23, 2023 5:00:00')),-1*(std(All_TBB_NS)),"-σ",FontSize=14);
text((datetime('March 23, 2023 5:30:00')),2*(std(All_TBB_NS)),"2σ",FontSize=14);text((datetime('March 23, 2023 5:00:00')),-2*(std(All_TBB_NS)),"-2σ",FontSize=14);
text((datetime('March 23, 2023 5:30:00')),3*(std(All_TBB_NS)),"3σ",FontSize=14);text((datetime('March 23, 2023 5:00:00')),-3*(std(All_TBB_NS)),"-3σ",FontSize=14);



%% ICV NS                                                                           FIGURE 9 (c)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;

load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


Flux = readtable("C:\Users\muyiw\OneDrive\Desktop\GST2023Data\XRData.xlsx");
FluNscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Flux.XRFlux));    
SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

%MontlymeanNSICV = meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

rect = [0.15, 0.51, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
All_ICV_NS = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];
Nscale1 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(All_ICV_NS));
plot(Nscale1,All_ICV_NS, LineWidth=2,Color= 'b')
set(gca, 'FontWeight', 'bold')
%yline(0,LineWidth=1.5,Color='red')
yline(1*(std(All_ICV_NS)),LineWidth=1,LineStyle='-',Color='k');yline(-1*(std(All_ICV_NS)),LineWidth=1,LineStyle='-',Color='k')
yline(2*(std(All_ICV_NS)),LineWidth=1,LineStyle='--',Color='k');yline(-2*(std(All_ICV_NS)),LineWidth=1,LineStyle='--',Color='k')
yline(3*(std(All_ICV_NS)),LineWidth=1.5,LineStyle=':',Color='k');yline(-3*(std(All_ICV_NS)),LineWidth=1.5,LineStyle=':',Color='k')
xlim tight 
%title('')
ylabel("Ampl. (dB)","FontSize",12,"FontWeight","bold")
ylim([-60 100])
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
text((datetime('March 21, 2023 2:00:00')), 90, '(c)  ICV(N/S)','FontWeight','bold')
text((datetime('March 22, 2023 5:30:00')),1*(std(All_ICV_NS)),"σ",FontSize=14);text((datetime('March 22, 2023 5:00:00')),-1*(std(All_ICV_NS)),"-σ",FontSize=14);
text((datetime('March 22, 2023 5:30:00')),2*(std(All_ICV_NS)),"2σ",FontSize=14);text((datetime('March 22, 2023 5:00:00')),-2*(std(All_ICV_NS)),"-2σ",FontSize=14);
text((datetime('March 22, 2023 5:30:00')),3*(std(All_ICV_NS)),"3σ",FontSize=14);text((datetime('March 22, 2023 5:00:00')),-3*(std(All_ICV_NS)),"-3σ",FontSize=14);



%% ICV EW                                                                               FIGURE 9 (d)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


Flux = readtable("C:\Users\muyiw\OneDrive\Desktop\GST2023Data\XRData.xlsx");
FluNscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Flux.XRFlux));    
SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

MontlymeanNSICV = meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

rect = [0.5, 0.51, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
All_ICV_NS = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];
Nscale1 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(All_ICV_NS));
plot(Nscale1,All_ICV_NS, LineWidth=2,Color= 'b')
set(gca, 'FontWeight', 'bold')
%yline(0,LineWidth=1.5,Color='red')
yline(1*(std(All_ICV_NS)),LineWidth=1,LineStyle='-',Color='k');yline(-1*(std(All_ICV_NS)),LineWidth=1,LineStyle='-',Color='k')
yline(2*(std(All_ICV_NS)),LineWidth=1,LineStyle='--',Color='k');yline(-2*(std(All_ICV_NS)),LineWidth=1,LineStyle='--',Color='k')
yline(3*(std(All_ICV_NS)),LineWidth=1.5,LineStyle=':',Color='k');yline(-3*(std(All_ICV_NS)),LineWidth=1.5,LineStyle=':',Color='k')
xlim tight 
%title('')
ylabel("Ampl. (dB)","FontSize",12,"FontWeight","bold")
ylim([-30 40])
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
text((datetime('March 21, 2023 2:00:00')), 35, '(d)  ICV(E/W)','FontWeight','bold')
text((datetime('March 23, 2023 5:30:00')),1*(std(All_ICV_NS)),"σ",FontSize=14);text((datetime('March 23, 2023 5:00:00')),-1*(std(All_ICV_NS)),"-σ",FontSize=14);
text((datetime('March 23, 2023 5:30:00')),2*(std(All_ICV_NS)),"2σ",FontSize=14);text((datetime('March 23, 2023 5:00:00')),-2*(std(All_ICV_NS)),"-2σ",FontSize=14);
text((datetime('March 23, 2023 5:30:00')),3*(std(All_ICV_NS)),"3σ",FontSize=14);text((datetime('March 23, 2023 5:00:00')),-3*(std(All_ICV_NS)),"-3σ",FontSize=14);



%% NAA NS                                                                           FIGURE 9 (e)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;

load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


Flux = readtable("C:\Users\muyiw\OneDrive\Desktop\GST2023Data\XRData.xlsx");
FluNscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Flux.XRFlux));    
SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

%MontlymeanNSNAA = meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

rect = [0.15, 0.24, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
All_NAA_NS = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];
Nscale1 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(All_NAA_NS));
plot(Nscale1,All_NAA_NS, LineWidth=2,Color= 'b')
set(gca, 'FontWeight', 'bold')
%yline(0,LineWidth=1.5,Color='red')
yline(1*(std(All_NAA_NS)),LineWidth=1,LineStyle='-',Color='k');yline(-1*(std(All_NAA_NS)),LineWidth=1,LineStyle='-',Color='k')
yline(2*(std(All_NAA_NS)),LineWidth=1,LineStyle='--',Color='k');yline(-2*(std(All_NAA_NS)),LineWidth=1,LineStyle='--',Color='k')
yline(3*(std(All_NAA_NS)),LineWidth=1.5,LineStyle=':',Color='k');yline(-3*(std(All_NAA_NS)),LineWidth=1.5,LineStyle=':',Color='k')
xlim tight 
%title('')
ylabel("Ampl. (dB)","FontSize",12,"FontWeight","bold")
ylim([-30 40])
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
text((datetime('March 21, 2023 2:00:00')), 35, '(e)  NAA(N/S)','FontWeight','bold')
text((datetime('March 22, 2023 9:30:00')),1*(std(All_NAA_NS)),"σ",FontSize=14);text((datetime('March 22, 2023 9:30:00')),-1*(std(All_NAA_NS)),"-σ",FontSize=14);
text((datetime('March 22, 2023 9:30:00')),2*(std(All_NAA_NS)),"2σ",FontSize=14);text((datetime('March 22, 2023 9:30:00')),-2*(std(All_NAA_NS)),"-2σ",FontSize=14);
text((datetime('March 22, 2023 9:30:00')),3*(std(All_NAA_NS)),"3σ",FontSize=14);text((datetime('March 22, 2023 9:30:00')),-3*(std(All_NAA_NS)),"-3σ",FontSize=14);



%% NAA EW                                                                           FIGURE 9 (f)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;

load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


Flux = readtable("C:\Users\muyiw\OneDrive\Desktop\GST2023Data\XRData.xlsx");
FluNscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(Flux.XRFlux));    
SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

MontlymeanNSNAA = meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

rect = [0.5, 0.24, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
All_NAA_NS = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];
Nscale1 = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(All_NAA_NS));
plot(Nscale1,All_NAA_NS, LineWidth=2,Color= 'b')
set(gca, 'FontWeight', 'bold')
%yline(0,LineWidth=1.5,Color='red')
yline(1*(std(All_NAA_NS)),LineWidth=1,LineStyle='-',Color='k');yline(-1*(std(All_NAA_NS)),LineWidth=1,LineStyle='-',Color='k')
yline(2*(std(All_NAA_NS)),LineWidth=1,LineStyle='--',Color='k');yline(-2*(std(All_NAA_NS)),LineWidth=1,LineStyle='--',Color='k')
yline(3*(std(All_NAA_NS)),LineWidth=1.5,LineStyle=':',Color='k');yline(-3*(std(All_NAA_NS)),LineWidth=1.5,LineStyle=':',Color='k')
xlim tight 
ylabel("Ampl. (dB)","FontSize",12,"FontWeight","bold")
ylim([-40 60])
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
text((datetime('March 21, 2023 2:00:00')), 50, '(f)  NAA(E/W)','FontWeight','bold')
text((datetime('March 22, 2023 9:30:00')),1*(std(All_NAA_NS)),"σ",FontSize=14);text((datetime('March 22, 2023 9:30:00')),-1*(std(All_NAA_NS)),"-σ",FontSize=14);
text((datetime('March 22, 2023 9:30:00')),2*(std(All_NAA_NS)),"2σ",FontSize=14);text((datetime('March 22, 2023 9:30:00')),-2*(std(All_NAA_NS)),"-2σ",FontSize=14);
text((datetime('March 22, 2023 9:30:00')),3*(std(All_NAA_NS)),"3σ",FontSize=14);text((datetime('March 22, 2023 9:30:00')),-3*(std(All_NAA_NS)),"-3σ",FontSize=14);


%% X-RAY FLUX and SYMH PLOTS                                            4
%%                                                                                  Figure 9 (g-h)
clc;set(gcf,'color','w');

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

opts = spreadsheetImportOptions("NumVariables", 1);opts.Sheet = "Sheet1";opts.DataRange = "A2:A8641";
opts.VariableNames = "GOESprimLong";opts.VariableTypes = "double";
FluxData2126March = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\FluxData21_26_March.xlsx", opts, "UseExcel", false);
FluxData2126March.GOESprimLong(FluxData2126March.GOESprimLong==0)=NaN;
FluxData2126March.GOESprimLong(FluxData2126March.GOESprimLong<=(6.50000E-07))=NaN;
Fluxscal = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'),length(FluxData2126March.GOESprimLong));
rect = [0.15, 0.12, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
yyaxis left 
plot(Fluxscal,FluxData2126March.GOESprimLong,LineWidth=2)
set(gca, 'FontWeight', 'bold')
ylabel('X-ray Flux W/m^2',"FontSize",12,"FontWeight","bold")
yyaxis right
plot(scale_SYMH,SYMH.SYMH,LineWidth=2)
set(gca, 'FontWeight', 'bold')
ylabel('SYMH (nT)',"FontSize",12,"FontWeight","bold")
text((datetime('March 22, 2023 2:00:00')), 80, '(g)    (Indices)','FontWeight','bold')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
xlabel('Days of March (UT)','FontSize',14,'FontWeight','bold')
%text(datetime('March 21, 2023 00:00:00'),0.7,'x 10^-^7')


rect = [0.5, 0.12, 0.3, 0.2];axes( 'position' , rect );set(gca,'pos',rect);%% 
yyaxis left 
plot(Fluxscal,FluxData2126March.GOESprimLong,LineWidth=2)
set(gca, 'FontWeight', 'bold')
ylabel('X-ray Flux W/m^2',"FontSize",12,"FontWeight","bold")
yyaxis right
plot(scale_SYMH,SYMH.SYMH,LineWidth=2)
set(gca, 'FontWeight', 'bold')
ylabel('SYMH (nT)',"FontSize",12,"FontWeight","bold")
text((datetime('March 22, 2023 2:00:00')), 80, '(h)    (Indices)','FontWeight','bold')
xline(datetime('March 23, 2023 12:00:00'),linestyle ='--',linewidth=1.5,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1.5,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1.5,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1.5,color = 'cyan')
xlabel('Days of March (UT)','FontSize',14,'FontWeight','bold')
%text(datetime('March 21, 2023 00:00:00'),0.7,'x 10^-^7')


                                                   

%% HEAT MAP PLOTS: TBB (NS)                                    5        


%% HEAT MAP PLOTS: TBB (NS)                                                         FIGURE 11 (a)

%%
clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');
meanData; meanData; 

Day21 = sgolayfilt(dat21, polynomial_order, window_length);Day21;Day21;
Day22 = sgolayfilt(dat22, polynomial_order, window_length);Day22;Day22;
Day23 = sgolayfilt(dat23, polynomial_order, window_length);Day23;Day23;
Day24 = sgolayfilt(dat24, polynomial_order, window_length);Day24;Day24;
Day25 = sgolayfilt(dat25, polynomial_order, window_length);Day25;Day25;
Day26 = sgolayfilt(dat26, polynomial_order, window_length);Day26;Day26;

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;


mydataDay = [day21NS,day22NS,day23NS,day24NS,day25NS,day26NS];
meanDataDay = mean(mydataDay,2,'omitnan');

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

rect = [ 0.4  0.22  0.5015  0.7];axes( 'position' , rect);
scalex = linspace(0,24, length(mydataDay));scaley = linspace(0,6,6);
MM = nanmean(mydataDay,1);
scale_MM = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MM));

%************************************
[X,Y] = meshgrid(1:size(mydataDay,2), 1:size(mydataDay,1));
[X2,Y2] = meshgrid(1:0.01:size(mydataDay,2), 1:0.01:size(mydataDay,1));
outmydataDay = interp2(X, Y, mydataDay, X2, Y2, 'linear');
%*************************************
imagesc(scalex, scaley, outmydataDay');%******************imagescTBB
yline([0,1,2,3,4,5],LineStyle="--",LineWidth =1,color ='black')
xticks(0:4:24);xline([5.6833 6.60 17.85 18.90],LineStyle="--",LineWidth =2,color ='red')
axis xy;
title('(a) TBB(NS)  ΔAmpl.,for 21-26 March 2023','FontSize',16); 
%xlabel('Time in hr [UT]')
set(gcf,'color','w');
set(gca,'FontWeight','bold','color', 'w','FontSize',16);
set(gca, 'xtick',[]);
set(gca, 'ytick',[ ]);pos_upper=get(gca,'pos');
colormap jet;C=colorbar;
set(C,'FontSize',16)
ylabel(C,'\bf Ampl. (dB)','FontSize',14); hold on;

%************************************************************* PLOT2
rect = [ 0.3  0.22  0.1  0.7 ];axes('position' , rect);
plot(MM',scale_MM,'Linewidth',2, 'Marker','*')
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
set(gca,'FontWeight','bold','FontSize',12);
%ylabel("Days in March 2023");
xlabel('dB')
set(gca, 'YTick', []);
set(gca, 'XDir', 'reverse');
%************************************************************* PLOT3
rect = [ 0.20  0.22  0.1  0.7 ];axes('position' , rect);
plot(SYMH.SYMH',scale_SYMH,'Linewidth',2,LineStyle="-")
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
%grid on;set(gca,'XMinorGrid','on');
%set(gca,'YMinorGrid','on');
xlabel('SYMH (nT)','FontSize',14,'FontWeight','bold')
ylabel('Day of month (March 2023)','FontSize',12,'FontWeight','bold')
set(gca,'FontWeight','bold','FontSize',12);
xlim([-200 50])
%%text(-190,datetime("March 26, 2023 20:00:00"),'(a) TBB(NS)','FontSize',12,'FontWeight','bold');
%annotation('arrow', [-200,0 ], [datetime('March 24, 2023 02:40:31'), datetime('March 24, 2023 02:40:31')]);
%**************************************************************** Plot4 (varage to the left)
mydata2 = meanDataDay;
scale = linspace(0,24, length(mydata2));
rect = [ 0.4 , 0.09 , 0.462  0.13 ];axes( 'position' , rect );
plot(scale,mydata2 ,'Linewidth',2);
%xticks(0:60:1440);
%xticklabels({'12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'})
set(gca,'FontWeight','bold','FontSize',12);
axis tight;
%set(gca, 'Ytick',[]);
xlabel('Time [UT]','FontSize',14);
set(gca,'FontSize',12);
set(gca, 'YTick', []);
%ylim([-45 45])
xticks(0:4:24);

%%  TBB EW                                                                       FIGURE 11 (b)
clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');
meanData; meanData; 

Day21 = sgolayfilt(dat21, polynomial_order, window_length);Day21;Day21;
Day22 = sgolayfilt(dat22, polynomial_order, window_length);Day22;Day22;
Day23 = sgolayfilt(dat23, polynomial_order, window_length);Day23;Day23;
Day24 = sgolayfilt(dat24, polynomial_order, window_length);Day24;Day24;
Day25 = sgolayfilt(dat25, polynomial_order, window_length);Day25;Day25;
Day26 = sgolayfilt(dat26, polynomial_order, window_length);Day26;Day26;

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

mydataDay = [day21NS,day22NS,day23NS,day24NS,day25NS,day26NS];
meanDataDay = mean(mydataDay,2,'omitnan');

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

rect = [ 0.4  0.22  0.5015  0.7];axes( 'position' , rect);
scalex = linspace(0,24, length(mydataDay));scaley = linspace(0,6,6);
MM = nanmean(mydataDay,1);
scale_MM = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MM));

%************************************
[X,Y] = meshgrid(1:size(mydataDay,2), 1:size(mydataDay,1));
[X2,Y2] = meshgrid(1:0.01:size(mydataDay,2), 1:0.01:size(mydataDay,1));
outmydataDay = interp2(X, Y, mydataDay, X2, Y2, 'linear');
%*************************************
imagesc(scalex, scaley, outmydataDay');%******************imagescTBB
set(gca, 'Color', 'w')
yline([0,1,2,3,4,5],LineStyle="--",LineWidth =1,color ='black')
axis xy;
title('(b) TBB(E/W) ΔAmpl. for 21-26 March 2023','FontSize',16); 
%xlabel('Time in hr [UT]')
set(gcf,'color','w');
set(gca,'FontWeight','bold','color', 'w','FontSize',16);
set(gca, 'xtick',[]);
set(gca, 'ytick',[ ]);pos_upper=get(gca,'pos');
colormap jet;C=colorbar;
set(C,'FontSize',16)
ylabel(C,'\bf Ampl. (dB)','FontSize',14); hold on;
xticks(0:4:24);xline([5.6833 6.60 17.85 18.90],LineStyle="--",LineWidth =2,color ='red')
%************************************************************* PLOT2
rect = [ 0.3  0.22  0.1  0.7 ];axes('position' , rect);
plot(MM',scale_MM,'Linewidth',2)
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
set(gca,'FontWeight','bold','FontSize',12);
set(gca, 'XDir', 'reverse');
%ylabel("Days in March 2023");
xlabel('dB')
set(gca, 'YTick', []);

%************************************************************* PLOT3
rect = [ 0.20  0.22  0.1  0.7 ];axes('position' , rect);
plot(SYMH.SYMH',scale_SYMH,'Linewidth',2,LineStyle="-")
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
%grid on;set(gca,'XMinorGrid','on');
%set(gca,'YMinorGrid','on');
xlabel('SYMH (nT)','FontSize',14,'FontWeight','bold')
ylabel('Day of month (March 2023)','FontSize',12,'FontWeight','bold')
set(gca,'FontWeight','bold','FontSize',12);
xlim([-200 50])
%text(-190,datetime("March 26, 2023 20:00:00"),'(b) TBB(E/W)','FontSize',12,'FontWeight','bold');


%**************************************************************** Plot4 (varage to the left)
mydata2 = meanDataDay;
scale = linspace(0,24, length(mydata2));
rect = [ 0.4 , 0.09 , 0.462  0.13 ];axes( 'position' , rect );
plot(scale,mydata2 ,'Linewidth',2);
%xticks(0:60:1440);
%xticklabels({'12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'})
set(gca,'FontWeight','bold','FontSize',12);
axis tight;
set(gca, 'Ytick',[]);
xlabel('Time [UT]','FontSize',14);
set(gca,'FontSize',12);
%ylim([-30 30])
xticks(0:4:24);




%% HEAT MAP PLOTS: ICV (NS)               

%% ICV NS                                                                        FIGURE 11 (c)                 
clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');
meanData; meanData; 

Day21 = sgolayfilt(dat21, polynomial_order, window_length);Day21;Day21;
Day22 = sgolayfilt(dat22, polynomial_order, window_length);Day22;Day22;
Day23 = sgolayfilt(dat23, polynomial_order, window_length);Day23;Day23;
Day24 = sgolayfilt(dat24, polynomial_order, window_length);Day24;Day24;
Day25 = sgolayfilt(dat25, polynomial_order, window_length);Day25;Day25;
Day26 = sgolayfilt(dat26, polynomial_order, window_length);Day26;Day26;

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;


mydataDay = [day21NS,day22NS,day23NS,day24NS,day25NS,day26NS];
meanDataDay = mean(mydataDay,2,'omitnan');

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

rect = [ 0.4  0.22  0.5015  0.7];axes( 'position' , rect);
scalex = linspace(0,24, length(mydataDay));scaley = linspace(0,6,6);
MM = nanmean(mydataDay,1);
scale_MM = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MM));

%************************************
[X,Y] = meshgrid(1:size(mydataDay,2), 1:size(mydataDay,1));
[X2,Y2] = meshgrid(1:0.01:size(mydataDay,2), 1:0.01:size(mydataDay,1));
outmydataDay = interp2(X, Y, mydataDay, X2, Y2, 'linear');
%*************************************
imagesc(scalex, scaley, outmydataDay');%******************imagescICV
yline([0,1,2,3,4,5],LineStyle="--",LineWidth =1,color ='black')
axis xy;
title('(c) ICV(NS) ΔAmpl.for 21-26 March 2023','FontSize',16); 
%xlabel('Time in hr [UT]')
set(gcf,'color','w');
set(gca,'FontWeight','bold','color', 'w','FontSize',16);
set(gca, 'xtick',[]);
set(gca, 'ytick',[ ]);pos_upper=get(gca,'pos');
colormap jet;C=colorbar;
set(C,'FontSize',16)
ylabel(C,'\bf Ampl. (dB)','FontSize',14); hold on;
xticks(0:4:24);xline([5.6833 6.60 17.85 18.90],LineStyle="--",LineWidth =2,color ='red')

%************************************************************* PLOT2
rect = [ 0.3  0.22  0.1  0.7 ];axes('position' , rect);
plot(MM',scale_MM,'Linewidth',2)
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
set(gca,'FontWeight','bold','FontSize',12);
%ylabel("Days in March 2023");
xlabel('dB')
set(gca, 'YTick', []);
set(gca, 'XDir', 'reverse');
%************************************************************* PLOT3
rect = [ 0.20  0.22  0.1  0.7 ];axes('position' , rect);
plot(SYMH.SYMH',scale_SYMH,'Linewidth',2,LineStyle="-")
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
%grid on;set(gca,'XMinorGrid','on');
%set(gca,'YMinorGrid','on');
xlabel('SYMH (nT)','FontSize',14,'FontWeight','bold')
ylabel('Day of month (March 2023)','FontSize',12,'FontWeight','bold')
set(gca,'FontWeight','bold','FontSize',12);
xlim([-200 50])
%text(-190,datetime("March 26, 2023 20:00:00"),'(c) ICV(NS)','FontSize',12,'FontWeight','bold');

%**************************************************************** Plot4 (varage to the left)
mydata2 = meanDataDay;
scale = linspace(0,24, length(mydata2));
rect = [ 0.4 , 0.09 , 0.462  0.13 ];axes( 'position' , rect );
plot(scale,mydata2 ,'Linewidth',2);
%xticks(0:60:1440);
%xticklabels({'12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'})
set(gca,'FontWeight','bold','FontSize',12);
axis tight;
%set(gca, 'Ytick',[]);
xlabel('Time [UT]','FontSize',14);
set(gca,'FontSize',12);
set(gca, 'YTick', []);
ylim([-45 45])
xticks(0:4:24);

%%  ICV EW                                                                          FIGURE 11(d)
clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');
meanData; meanData; 

Day21 = sgolayfilt(dat21, polynomial_order, window_length);Day21;Day21;
Day22 = sgolayfilt(dat22, polynomial_order, window_length);Day22;Day22;
Day23 = sgolayfilt(dat23, polynomial_order, window_length);Day23;Day23;
Day24 = sgolayfilt(dat24, polynomial_order, window_length);Day24;Day24;
Day25 = sgolayfilt(dat25, polynomial_order, window_length);Day25;Day25;
Day26 = sgolayfilt(dat26, polynomial_order, window_length);Day26;Day26;

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

mydataDay = [day21NS,day22NS,day23NS,day24NS,day25NS,day26NS];
meanDataDay = mean(mydataDay,2,'omitnan');

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

rect = [ 0.4  0.22  0.5015  0.7];axes( 'position' , rect);
scalex = linspace(0,24, length(mydataDay));scaley = linspace(0,6,6);
MM = nanmean(mydataDay,1);
scale_MM = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MM));

%************************************
[X,Y] = meshgrid(1:size(mydataDay,2), 1:size(mydataDay,1));
[X2,Y2] = meshgrid(1:0.01:size(mydataDay,2), 1:0.01:size(mydataDay,1));
outmydataDay = interp2(X, Y, mydataDay, X2, Y2, 'linear');
%*************************************
imagesc(scalex, scaley, outmydataDay');%******************imagescICV
set(gca, 'Color', 'w')
yline([0,1,2,3,4,5],LineStyle="--",LineWidth =1,color ='black')
axis xy;
title('(d) ICV(E/W) ΔAmpl.for 21-26 March 2023','FontSize',16); 
%xlabel('Time in hr [UT]')
set(gcf,'color','w');
set(gca,'FontWeight','bold','color', 'w','FontSize',16);
set(gca, 'xtick',[]);
set(gca, 'ytick',[ ]);pos_upper=get(gca,'pos');
colormap jet;C=colorbar;
set(C,'FontSize',16)
ylabel(C,'\bf Ampl. (dB)','FontSize',14); hold on;
xticks(0:4:24);xline([5.6833 6.60 17.85 18.90],LineStyle="--",LineWidth =2,color ='red')

%************************************************************* PLOT2
rect = [ 0.3  0.22  0.1  0.7 ];axes('position' , rect);
plot(MM',scale_MM,'Linewidth',2)
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
set(gca,'FontWeight','bold','FontSize',12);
set(gca, 'XDir', 'reverse');
%ylabel("Days in March 2023");
xlabel('dB')
set(gca, 'YTick', []);

%************************************************************* PLOT3
rect = [ 0.20  0.22  0.1  0.7 ];axes('position' , rect);
plot(SYMH.SYMH',scale_SYMH,'Linewidth',2,LineStyle="-")
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
%grid on;set(gca,'XMinorGrid','on');
%set(gca,'YMinorGrid','on');
xlabel('SYMH (nT)','FontSize',14,'FontWeight','bold')
ylabel('Day of month (March 2023)','FontSize',12,'FontWeight','bold')
set(gca,'FontWeight','bold','FontSize',12);
xlim([-200 50])
%text(-190,datetime("March 26, 2023 20:00:00"),'(d) ICV(E/W)','FontSize',12,'FontWeight','bold');

%**************************************************************** Plot4 (varage to the left)
mydata2 = meanDataDay;
scale = linspace(0,24, length(mydata2));
rect = [ 0.4 , 0.09 , 0.462  0.13 ];axes( 'position' , rect );
plot(scale,mydata2 ,'Linewidth',2);
%xticks(0:60:1440);
%xticklabels({'12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'})
set(gca,'FontWeight','bold','FontSize',12);
axis tight;
set(gca, 'Ytick',[]);
xlabel('Time [UT]','FontSize',14);
set(gca,'FontSize',12);
%ylim([-30 30])
xticks(0:4:24);




%% HEAT MAP PLOTS: NAA          

%% NAA   NS                                                                         FIGURE 11(e)
clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');
meanData; meanData; 

Day21 = sgolayfilt(dat21, polynomial_order, window_length);Day21;Day21;
Day22 = sgolayfilt(dat22, polynomial_order, window_length);Day22;Day22;
Day23 = sgolayfilt(dat23, polynomial_order, window_length);Day23;Day23;
Day24 = sgolayfilt(dat24, polynomial_order, window_length);Day24;Day24;
Day25 = sgolayfilt(dat25, polynomial_order, window_length);Day25;Day25;
Day26 = sgolayfilt(dat26, polynomial_order, window_length);Day26;Day26;

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;


mydataDay = [day21NS,day22NS,day23NS,day24NS,day25NS,day26NS];
meanDataDay = mean(mydataDay,2,'omitnan');

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

rect = [ 0.4  0.22  0.5015  0.7];axes( 'position' , rect);
scalex = linspace(0,24, length(mydataDay));scaley = linspace(0,6,6);
MM = nanmean(mydataDay,1);
scale_MM = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MM));

%************************************
[X,Y] = meshgrid(1:size(mydataDay,2), 1:size(mydataDay,1));
[X2,Y2] = meshgrid(1:0.01:size(mydataDay,2), 1:0.01:size(mydataDay,1));
outmydataDay = interp2(X, Y, mydataDay, X2, Y2, 'linear');
%*************************************
imagesc(scalex, scaley, outmydataDay');%******************imagescNAA
yline([0,1,2,3,4,5],LineStyle="--",LineWidth =1,color ='black')
axis xy;
title('(e) NAA(NS) ΔAmpl.for 21-26 March 2023','FontSize',16); 
%xlabel('Time in hr [UT]')
set(gcf,'color','w');
set(gca,'FontWeight','bold','color', 'w','FontSize',16);
set(gca, 'xtick',[]);
set(gca, 'ytick',[ ]);pos_upper=get(gca,'pos');
colormap jet;C=colorbar;
set(C,'FontSize',16)
ylabel(C,'\bf Ampl. (dB)','FontSize',14); hold on;
xticks(0:4:24);xline([5.6833 6.60 17.85 18.90],LineStyle="--",LineWidth =2,color ='red')

%************************************************************* PLOT2
rect = [ 0.3  0.22  0.1  0.7 ];axes('position' , rect);
plot(MM',scale_MM,'Linewidth',2)
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
set(gca,'FontWeight','bold','FontSize',12);
%ylabel("Days in March 2023");
xlabel('dB')
set(gca, 'YTick', []);
set(gca, 'XDir', 'reverse');
%************************************************************* PLOT3
rect = [ 0.20  0.22  0.1  0.7 ];axes('position' , rect);
plot(SYMH.SYMH',scale_SYMH,'Linewidth',2,LineStyle="-")
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
%grid on;set(gca,'XMinorGrid','on');
%set(gca,'YMinorGrid','on');
xlabel('SYMH (nT)','FontSize',14,'FontWeight','bold')
ylabel('Day of month (March 2023)','FontSize',12,'FontWeight','bold')
set(gca,'FontWeight','bold','FontSize',12);
xlim([-200 50])
%text(-190,datetime("March 26, 2023 20:00:00"),'(e) NAA(NS)','FontSize',12,'FontWeight','bold');

%**************************************************************** Plot4 (varage to the left)
mydata2 = meanDataDay;
scale = linspace(0,24, length(mydata2));
rect = [ 0.4 , 0.09 , 0.462  0.13 ];axes( 'position' , rect );
plot(scale,mydata2 ,'Linewidth',2);
%xticks(0:60:1440);
%xticklabels({'12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'})
set(gca,'FontWeight','bold','FontSize',12);
axis tight;
%set(gca, 'Ytick',[]);
xlabel('Time [UT]','FontSize',14);
set(gca,'FontSize',12);
set(gca, 'YTick', []);
%ylim([-45 45])
xticks(0:4:24);

%%  NAA EW                                                                       FIGURE 11(f)
clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');
meanData; meanData; 

Day21 = sgolayfilt(dat21, polynomial_order, window_length);Day21;Day21;
Day22 = sgolayfilt(dat22, polynomial_order, window_length);Day22;Day22;
Day23 = sgolayfilt(dat23, polynomial_order, window_length);Day23;Day23;
Day24 = sgolayfilt(dat24, polynomial_order, window_length);Day24;Day24;
Day25 = sgolayfilt(dat25, polynomial_order, window_length);Day25;Day25;
Day26 = sgolayfilt(dat26, polynomial_order, window_length);Day26;Day26;

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

mydataDay = [day21NS,day22NS,day23NS,day24NS,day25NS,day26NS];
meanDataDay = mean(mydataDay,2,'omitnan');

SYMH = readtable("C:\Users\muyiw\OneDrive\Desktop\Works\StormWork\NewIndicesfull.xlsx");
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (SYMH.SYMH));

rect = [ 0.4  0.22  0.5015  0.7];axes( 'position' , rect);
scalex = linspace(0,24, length(mydataDay));scaley = linspace(0,6,6);
MM = nanmean(mydataDay,1);
scale_MM = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MM));

%************************************
[X,Y] = meshgrid(1:size(mydataDay,2), 1:size(mydataDay,1));
[X2,Y2] = meshgrid(1:0.01:size(mydataDay,2), 1:0.01:size(mydataDay,1));
outmydataDay = interp2(X, Y, mydataDay, X2, Y2, 'linear');
%*************************************
imagesc(scalex, scaley, outmydataDay');%******************imagescNAA
set(gca, 'Color', 'w')
yline([0,1,2,3,4,5],LineStyle="--",LineWidth =1,color ='black')
axis xy;
title('(f) NAA(E/W) ΔAmpl.for 21-26 March 2023','FontSize',16); 
%xlabel('Time in hr [UT]')
set(gcf,'color','w');
set(gca,'FontWeight','bold','color', 'w','FontSize',16);
set(gca, 'xtick',[]);
set(gca, 'ytick',[ ]);pos_upper=get(gca,'pos');
colormap jet;C=colorbar;
set(C,'FontSize',16)
ylabel(C,'\bf Ampl. (dB)','FontSize',14); hold on;
xticks(0:4:24);xline([5.6833 6.60 17.85 18.90],LineStyle="--",LineWidth =2,color ='red')

%************************************************************* PLOT2
rect = [ 0.3  0.22  0.1  0.7 ];axes('position' , rect);
plot(MM',scale_MM,'Linewidth',2)
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
set(gca,'FontWeight','bold','FontSize',12);
set(gca, 'XDir', 'reverse');
%ylabel("Days in March 2023");
xlabel('dB')
set(gca, 'YTick', []);

%************************************************************* PLOT3
rect = [ 0.20  0.22  0.1  0.7 ];axes('position' , rect);
plot(SYMH.SYMH',scale_SYMH,'Linewidth',2,LineStyle="-")
yline([datetime('March 22, 2023 00:00:00'),datetime('March 23, 2023 00:00:00'),datetime('March 24, 2023 00:00:00'),...
datetime('March 25, 2023 00:00:00'),datetime('March 26, 2023 00:00:00')],LineStyle="--",LineWidth =1,color ='black');
%grid on;set(gca,'XMinorGrid','on');
%set(gca,'YMinorGrid','on');
xlabel('SYMH (nT)','FontSize',14,'FontWeight','bold')
ylabel('Day of month (March 2023)','FontSize',12,'FontWeight','bold')
set(gca,'FontWeight','bold','FontSize',12);
xlim([-200 50])
%text(-190,datetime("March 26, 2023 20:00:00"),'(f) NAA(E/W)','FontSize',12,'FontWeight','bold');

%**************************************************************** Plot4 (varage to the left)
mydata2 = meanDataDay;
scale = linspace(0,24, length(mydata2));
rect = [ 0.4 , 0.09 , 0.462  0.13 ];axes( 'position' , rect );
plot(scale,mydata2 ,'Linewidth',2);
%xticks(0:60:1440);
%xticklabels({'12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'})
set(gca,'FontWeight','bold','FontSize',12);
axis tight;
set(gca, 'Ytick',[]);
xlabel('Time [UT]','FontSize',14);
set(gca,'FontSize',12);
xticks(0:4:24);
%ylim([-30 30])





%% CROSS-WAVELET COHERENCE ANALYSIS                       6  


%% FULL DAY   TBB (NS)                                    FIGURE 12 (a)                                             

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));

 

rect = [0.1, 0.72, 0.35, 0.26];axes('Position', rect) % 24 
Y3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks([0,1, 2, 3, 4, 5])
xticklabels({'21','22', '23', '24', '25', '26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-TBB(N/S) |21-26 March,2023|")
text(0.051,2.2,"(a 24hr)",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);
xline([0.2375 1.2368 2.2361 3.23472 4.275944 5.275],LineWidth=2,LineStyle='--',Color='m')
xline([0.74375 1.744444 2.744444 3.7868055 4.7875 5.7875],LineWidth=2,LineStyle='-',Color='m')


%% FULL DAY   TBB (EW)                                       FIGURE 12 (b)  

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));



rect = [0.1, 0.72, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
Y3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks([0,1, 2, 3, 4, 5,6,7])
xticklabels({'21','22', '23', '24', '25', '26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
%yticklabels({'64', '128', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%xlabel("Days in March 2023")
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
text(0.051,2.2,"(a 24hr)",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);
xline([0.2375 1.2368 2.2361 3.23472 4.275944 5.275],LineWidth=2,LineStyle='--',Color='m')
xline([0.74375 1.744444 2.744444 3.7868055 4.7875 5.7875],LineWidth=2,LineStyle='-',Color='m')


%% DAYTIME: TBB         N/S                                                     FIGURE (12c)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];

DayTimX21 = X1(600:960);
DayTimX22 = X2(600:960);
DayTimX23 = X3(600:960);
DayTimX24 = X4(600:960);
DayTimX25 = X5(600:960);
DayTimX26 = X6(600:960);

VLFDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
SYMDay = [DayTimX21;DayTimX22;DayTimX23;DayTimX24;DayTimX25;DayTimX26];

rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
wcoherence(VLFDay,SYMDay,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.25:1.5)
xticklabels({'21','22', '23', '24', '25','26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-TBB(N/S) |21-26 March,2023|")
text(0.051,2.2,"(b Da) ",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);


%% DAYTIME: TBB       E/W                                                   FIGURE (12d)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];

DayTimX21 = X1(600:960);
DayTimX22 = X2(600:960);
DayTimX23 = X3(600:960);
DayTimX24 = X4(600:960);
DayTimX25 = X5(600:960);
DayTimX26 = X6(600:960);

VLFDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
SYMDay = [DayTimX21;DayTimX22;DayTimX23;DayTimX24;DayTimX25;DayTimX26];

rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
wcoherence(VLFDay,SYMDay,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.25:1.5)
xticklabels({'21','22', '23', '24', '25','26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-TBB(N/S) |21-26 March,2023|")
text(0.051,2.2,"(b Da) ",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);




%% NIGHTTIME: TBB NS                                                        FIGURE (12e)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);


Y3 = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];



NightX2 = [ X1; X2];
NightX3 = [ X2; X3];
NightX4 = [ X3; X4];
NightX5 = [ X4; X5];
NightX6 = [ X5; X6];

NightTimX2 = NightX2(1200:1680);
NightTimX3 = NightX3(1200:1680);
NightTimX4 = NightX4(1200:1680);
NightTimX5 = NightX5(1200:1680);
NightTimX6 = NightX6(1200:1680);
X = [NightTimX2;NightTimX3;NightTimX4;NightTimX5;NightTimX6];



rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.3336:1.668);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
ylabel("Period (minutes)")
xlabel("Day of month (March 2023)", FontSize=16,FontWeight="bold")
%yticks([, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-TBB(N/S) |21-26 March,2023|")
text(0.051,2.2,"(c) Ni) ",'Color','w', 'FontWeight','bold','FontSize',10)%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);




%% NIGHTTIME: TBB EW                                                                FIGURE (12f)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);


Y3 = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];



NightX2 = [ X1; X2];
NightX3 = [ X2; X3];
NightX4 = [ X3; X4];
NightX5 = [ X4; X5];
NightX6 = [ X5; X6];

NightTimX2 = NightX2(1200:1680);
NightTimX3 = NightX3(1200:1680);
NightTimX4 = NightX4(1200:1680);
NightTimX5 = NightX5(1200:1680);
NightTimX6 = NightX6(1200:1680);
X = [NightTimX2;NightTimX3;NightTimX4;NightTimX5;NightTimX6];



rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.3336:1.668);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
ylabel("Period (minutes)")
xlabel("Day of month (March 2023)", FontSize=16,FontWeight="bold")
%yticks([, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-TBB(N/S) |21-26 March,2023|")
text(0.051,2.2,"(c) Ni) ",'Color','w', 'FontWeight','bold','FontSize',10)%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);




%% FULL DAY   ICV (NS)                                                              FIGURE 13(a)

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));



rect = [0.1, 0.72, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
Y3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks([0,1, 2, 3, 4, 5])
xticklabels({'21','22', '23', '24', '25', '26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
xlabel("Days in March 2023")
text(0.051,2.2,"(a)",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);
xline([0.2375 1.2368 2.2361 3.23472 4.275944 5.275],LineWidth=2,LineStyle='--',Color='m')
xline([0.74375 1.744444 2.744444 3.7868055 4.7875 5.7875],LineWidth=2,LineStyle='-',Color='m')

%% FULL DAY   ICV  (EW)                                                               FIGURE 13(b)                                   

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));



rect = [0.1, 0.72, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
Y3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks([0,1, 2, 3, 4, 5])
xticklabels({'21','22', '23', '24', '25', '26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
xlabel("Days in March 2023")
text(0.051,2.2,"(a) 24hr",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);
xline([0.2375 1.2368 2.2361 3.23472 4.275944 5.275],LineWidth=2,LineStyle='--',Color='m')
xline([0.74375 1.744444 2.744444 3.7868055 4.7875 5.7875],LineWidth=2,LineStyle='-',Color='m')



%% DAYTIME: ICV NS                                                                    FIGURE 13(c)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];

DayTimX21 = X1(600:960);
DayTimX22 = X2(600:960);
DayTimX23 = X3(600:960);
DayTimX24 = X4(600:960);
DayTimX25 = X5(600:960);
DayTimX26 = X6(600:960);

VLFDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
SYMDay = [DayTimX21;DayTimX22;DayTimX23;DayTimX24;DayTimX25;DayTimX26];

rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
wcoherence(VLFDay,SYMDay,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.25:1.5)
xticklabels({'21','22', '23', '24', '25','26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-ICV(N/S) |21-26 March,2023|")
text(0.051,2.2,"(b Da) ",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);


%% DAYTIME: ICV EW                                                                  FIGURE (13d)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];

DayTimX21 = X1(600:960);
DayTimX22 = X2(600:960);
DayTimX23 = X3(600:960);
DayTimX24 = X4(600:960);
DayTimX25 = X5(600:960);
DayTimX26 = X6(600:960);

VLFDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
SYMDay = [DayTimX21;DayTimX22;DayTimX23;DayTimX24;DayTimX25;DayTimX26];

rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
wcoherence(VLFDay,SYMDay,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.25:1.5)
xticklabels({'21','22', '23', '24', '25','26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-ICV(N/S) |21-26 March,2023|")
text(0.051,2.2,"(b Da) ",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);



%% NIGHTIME: ICV NS                                                                 FIGURE (13e)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);


Y3 = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];



NightX2 = [ X1; X2];
NightX3 = [ X2; X3];
NightX4 = [ X3; X4];
NightX5 = [ X4; X5];
NightX6 = [ X5; X6];

NightTimX2 = NightX2(1200:1680);
NightTimX3 = NightX3(1200:1680);
NightTimX4 = NightX4(1200:1680);
NightTimX5 = NightX5(1200:1680);
NightTimX6 = NightX6(1200:1680);
X = [NightTimX2;NightTimX3;NightTimX4;NightTimX5;NightTimX6];



rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.3336:1.668);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
ylabel("Period (minutes)")
xlabel("Day of month (March 2023)", FontSize=16,FontWeight="bold")
%yticks([, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-ICV(N/S) |21-26 March,2023|")
text(0.051,2.2,"(c) Ni) ",'Color','w', 'FontWeight','bold','FontSize',10)%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');



%% NIGHTTIME: ICV EW                                                                FIGURE (13f)
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);


Y3 = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];



NightX2 = [ X1; X2];
NightX3 = [ X2; X3];
NightX4 = [ X3; X4];
NightX5 = [ X4; X5];
NightX6 = [ X5; X6];

NightTimX2 = NightX2(1200:1680);
NightTimX3 = NightX3(1200:1680);
NightTimX4 = NightX4(1200:1680);
NightTimX5 = NightX5(1200:1680);
NightTimX6 = NightX6(1200:1680);
X = [NightTimX2;NightTimX3;NightTimX4;NightTimX5;NightTimX6];



rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.3336:1.668);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
ylabel("Period (minutes)")
xlabel("Day of month (March 2023)", FontSize=16,FontWeight="bold")
%yticks([, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-ICV(N/S) |21-26 March,2023|")
text(0.051,2.2,"(c) Ni) ",'Color','w', 'FontWeight','bold','FontSize',10)%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);



%% FULL DAY  NAA (NS)                                                               FIGURE 14 (a)

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


rect = [0.1, 0.72, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
Y3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks([0,1, 2, 3, 4, 5])
xticklabels({'21','22', '23', '24', '25', '26'})
ylabel("Period (minutes)")
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
xlabel("Days in March 2023")
%title("Wavelet Coherence for Ariel-NAA (N/S) |21-26 March,2023|")
text(0.051,2.2,"(a)24hr",'Color','w', 'FontWeight','bold','FontSize',10)
colorbar; ylabel(colorbar, 'Coherence');
xline([0.2375 1.2368 2.2361 3.23472 4.275944 5.275],LineWidth=2,LineStyle='--',Color='m')
xline([0.74375 1.744444 2.744444 3.7868055 4.7875 5.7875],LineWidth=2,LineStyle='-',Color='m')


%% FULL DAY   NAA (EW)                                                                  FIGURE 14 (b)

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


rect = [0.1, 0.72, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
Y3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7); colormap('jet');%0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks([0,1, 2, 3, 4, 5])
xticklabels({'21','22', '23', '24', '25', '26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'128','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
xlabel("Days in March 2023")
%title("Wavelet Coherence for Ariel-NAA (E/W) |21-26 March,2023|")
text(0.051,2.2,"(a) 24hr",'Color','w', 'FontWeight','bold','FontSize',10)
colorbar; ylabel(colorbar, 'Coherence');
xline([0.2375 1.2368 2.2361 3.23472 4.275944 5.275],LineWidth=2,LineStyle='--',Color='m')
xline([0.74375 1.744444 2.744444 3.7868055 4.7875 5.7875],LineWidth=2,LineStyle='-',Color='m')



%% DAYTIME: NAA NS                                                                      FIGURE 14 (c)                                                      
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];

DayTimX21 = X1(600:960);
DayTimX22 = X2(600:960);
DayTimX23 = X3(600:960);
DayTimX24 = X4(600:960);
DayTimX25 = X5(600:960);
DayTimX26 = X6(600:960);

VLFDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
SYMDay = [DayTimX21;DayTimX22;DayTimX23;DayTimX24;DayTimX25;DayTimX26];

rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
wcoherence(VLFDay,SYMDay,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.25:1.5)
xticklabels({'21','22', '23', '24', '25','26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-NAA(N/S) |21-26 March,2023|")
text(0.051,2.2,"(b Da) ",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);


%% DAYTIME: NAA EW                                                                      FIGURE 14 (d)                                                                 
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];

DayTimX21 = X1(600:960);
DayTimX22 = X2(600:960);
DayTimX23 = X3(600:960);
DayTimX24 = X4(600:960);
DayTimX25 = X5(600:960);
DayTimX26 = X6(600:960);

VLFDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
SYMDay = [DayTimX21;DayTimX22;DayTimX23;DayTimX24;DayTimX25;DayTimX26];

rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
wcoherence(VLFDay,SYMDay,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.25:1.5)
xticklabels({'21','22', '23', '24', '25','26'})
ylabel("Period (minutes)")
%yticks([1, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-NAA(N/S) |21-26 March,2023|")
text(0.051,2.2,"(b Da) ",'Color','w', 'FontWeight','bold','FontSize',10)
%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');



%% NIGHTTIME; NAA NS                                                                    FIGURE 14 (e) 
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);


Y3 = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];



NightX2 = [ X1; X2];
NightX3 = [ X2; X3];
NightX4 = [ X3; X4];
NightX5 = [ X4; X5];
NightX6 = [ X5; X6];

NightTimX2 = NightX2(1200:1680);
NightTimX3 = NightX3(1200:1680);
NightTimX4 = NightX4(1200:1680);
NightTimX5 = NightX5(1200:1680);
NightTimX6 = NightX6(1200:1680);
X = [NightTimX2;NightTimX3;NightTimX4;NightTimX5;NightTimX6];



rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.3336:1.668);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
ylabel("Period (minutes)")
xlabel("Day of month (March 2023)", FontSize=16,FontWeight="bold")
%yticks([, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-NAA(N/S) |21-26 March,2023|")
text(0.051,2.2,"(c) Ni) ",'Color','w', 'FontWeight','bold','FontSize',10)%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);



%% NIGHTTIME: NAA EW                                                                FIGURE 14 (f) 
clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);


Y3 = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
scale_SYMH = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (X));


 X1 = [SYMHData.SYMH(1:1440)];
 X2 = [SYMHData.SYMH(1441:2880)];
 X3 = [SYMHData.SYMH(2881:4320)];
 X4 = [SYMHData.SYMH(4321:5760)];
 X5 = [SYMHData.SYMH(5761:7200)];
 X6 = [SYMHData.SYMH(7201:8640)];



NightX2 = [ X1; X2];
NightX3 = [ X2; X3];
NightX4 = [ X3; X4];
NightX5 = [ X4; X5];
NightX6 = [ X5; X6];

NightTimX2 = NightX2(1200:1680);
NightTimX3 = NightX3(1200:1680);
NightTimX4 = NightX4(1200:1680);
NightTimX5 = NightX5(1200:1680);
NightTimX6 = NightX6(1200:1680);
X = [NightTimX2;NightTimX3;NightTimX4;NightTimX5;NightTimX6];



rect = [0.1, 0.70, 0.35, 0.26];axes('Position', rect) % 24 hrsY3 = Mydata;Y3(isnan(Y3)) = nanmean(Y3);
%YY3 =wcoherence(X,Y3,0.0041667,'PhaseDisplayThreshold',0.7);
wcoherence(X,Y3,0.0167,'PhaseDisplayThreshold',0.7);colormap('jet'); %0.0041667
set(gca,'FontWeight','bold','FontSize',12);
xticks(0:0.3336:1.668);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
ylabel("Period (minutes)")
xlabel("Day of month (March 2023)", FontSize=16,FontWeight="bold")
%yticks([, 2, 3, 4, 5,6, 7, 8, 9, 10])
yticklabels({'256','128', '64', '32', '16', '8', '4', '2', '1','1/2','1/4'});
%title("Wavelet Coherence for Ariel-NAA(N/S) |21-26 March,2023|")
text(0.051,2.2,"(c) Ni) ",'Color','w', 'FontWeight','bold','FontSize',10)%xlabel(" Days of March 2023")
colorbar; ylabel(colorbar, 'Coherence');
%set(gca, 'XTick', []);
current_xlim = xlim; %to check the lim of x-axis 




%% ALL DAYS R-SQUARE                                                    7      

%% TBB   N/S                                                                         FIGURE 15(a)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  
load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
Y = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];

%**********************************************************************************TBB
rect = [0.2, 0.78, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%     
%wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
wcdataTBB = wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
MTBB =mean(wcdataTBB);
xscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MTBB));
plot(xscale,(MTBB),LineWidth=2)
%yline(max(TBB),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
grid on; 
ylim([0.0 0.65]);set(gca, 'YTick', 0:0.18:0.54);
xline(datetime('March 24, 2023 02:58:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1,color = 'cyan')
 text(datetime('March 21, 2023 10:00:00'),0.6,'(a) TBB (N/S)')


%% TBB E/W                                                                               FIGURE 15(b)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
Y = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];

%**********************************************************************************TBB
rect = [0.5, 0.78, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%     
%wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
wcdataTBB = wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
MTBB =mean(wcdataTBB);
xscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MTBB));
plot(xscale,(MTBB),LineWidth=2)
%yline(max(TBB),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
grid on; 
ylim([0.0 0.65]);set(gca, 'YTick', 0:0.18:0.54);
xline(datetime('March 24, 2023 02:58:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1,color = 'cyan')
 text(datetime('March 21, 2023 10:00:00'),0.6,'(b) TBB (E/W)')



 %% ICV   N/S                                                                            FIGURE 15(c)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
Y = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];

%**********************************************************************************ICV
rect = [0.2, 0.52, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%     
%wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
wcdataICV = wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
MICV =mean(wcdataICV);
xscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MICV));
plot(xscale,(MICV),LineWidth=2)
%yline(max(ICV),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
grid on; 
ylim([0.0 0.65]);set(gca, 'YTick', 0:0.18:0.54);
xline(datetime('March 24, 2023 03:05:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1,color = 'cyan')
 text(datetime('March 21, 2023 10:00:00'),0.6,'(c) ICV (N/S)')



%% ICV E/W                                                                               FIGURE 15(d)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
Y = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];

%**********************************************************************************ICV
rect = [0.5, 0.52, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%     
%wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
wcdataICV = wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
MICV =mean(wcdataICV);
xscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MICV));
plot(xscale,(MICV),LineWidth=2)
%yline(max(ICV),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
grid on; 
ylim([0.0 0.65]);set(gca, 'YTick', 0:0.18:0.54);
xline(datetime('March 24, 2023 03:04:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1,color = 'cyan')
 text(datetime('March 21, 2023 10:00:00'),0.6,'(d) ICV (E/W)')



 %% NAA   N/S                                                                            FIGURE 15(e)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
Y = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];

%**********************************************************************************NAA
rect = [0.2, 0.28, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%     
%wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
wcdataNAA = wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
MNAA =mean(wcdataNAA);
xscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MNAA));
plot(xscale,(MNAA),LineWidth=2)
%yline(max(NAA),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
grid on; 
ylim([0.0 0.65]);set(gca, 'YTick', 0:0.18:0.54);
xline(datetime('March 24, 2023 03:00:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1,color = 'cyan')
 text(datetime('March 21, 2023 10:00:00'),0.6,'(e) NAA (N/S)')





%% NAA E/W                                                                               FIGURE 15(f)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);


day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
Y = [day21NS;day22NS;day23NS;day24NS;day25NS;day26NS];

%**********************************************************************************NAA
rect = [0.5, 0.28, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%     
%wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
wcdataNAA = wcoherence(X,Y,0.0041667,'PhaseDisplayThreshold',0.7);
MNAA =mean(wcdataNAA);
xscale = linspace(datetime('March 21, 2023 00:00:00'),datetime('March 27, 2023 00:00:00'), length (MNAA));
plot(xscale,(MNAA),LineWidth=2)
%yline(max(NAA),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
grid on; 
ylim([0.0 0.65]);set(gca, 'YTick', 0:0.18:0.54);
xline(datetime('March 24, 2023 02:55:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 11:00:00'),linestyle ='--',linewidth=1,color = 'blue')
xline(datetime('March 25, 2023 17:00:00'),linestyle ='--',linewidth=1,color = 'cyan')
 text(datetime('March 21, 2023 10:00:00'),0.6,'(f) NAA (E/W)')





%% COMPUTING DELAY                                                      8     

%% TBB NS                                                                                     FIGURE 16(a)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night4 = [day23NS;day24NS];
NightTim4 = Night4(1540:1720);
Nscale = linspace(datetime('March 24, 2023 01:40:00'),datetime('March 24, 2023 04:40:00'), length(NightTim4));



opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
X3 = [SYMHData.SYMH(2881:4320)]; X4 = [SYMHData.SYMH(4321:5760)];
NightX4 = [ X3; X4]; 
X1 = NightX4(1540:1720);
TBB1 = NightTim4;
rect = [0.1, 0.76, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%  
wcdataTBB1 = wcoherence(X1,TBB1,0.0041667,'PhaseDisplayThreshold',0.7);
MTBB1 =mean(wcdataTBB1);
plot(Nscale,(MTBB1),LineWidth=2)
max(TBB1)
yline(max(TBB1),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
text(datetime('March 23, 2023 18:00:00'),0.6,'(a) TBB (N/F)')
grid on; 
xline(datetime('March 24, 2023 02:58:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xlim tight 
ylim([0 0.6])
text(datetime('March 24, 2023 01:42:00'),0.55,'(a) TBB (N/S)')
set(gca,'FontWeight','bold','FontSize',12);


%% TBB EW                                                                             FIGURE 16(b)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night4 = [day23NS;day24NS];
NightTim4 = Night4(1540:1720);
Nscale = linspace(datetime('March 24, 2023 01:40:00'),datetime('March 24, 2023 04:40:00'), length(NightTim4));


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
X3 = [SYMHData.SYMH(2881:4320)]; X4 = [SYMHData.SYMH(4321:5760)];
NightX4 = [ X3; X4]; 
X1 = NightX4(1540:1720);
TBB1 = NightTim4;
rect = [0.4, 0.76, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%  
wcdataTBB1 = wcoherence(X1,TBB1,0.0041667,'PhaseDisplayThreshold',0.7);
MTBB1 =mean(wcdataTBB1);
plot(Nscale,(MTBB1),LineWidth=2)
max(TBB1)
yline(max(TBB1),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
text(datetime('March 23, 2023 18:00:00'),0.6,'(a) TBB (N/F)')
grid on; 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 02:58:00'),linestyle ='--',linewidth=1,color = 'red') 
xlim tight 
ylim([0 0.6])
text(datetime('March 24, 2023 01:42:00'),0.55,'(b) TBB (E/W)')
set(gca,'FontWeight','bold','FontSize',12);



%% ICV NS                                                                                 FIGURE 16(c)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night4 = [day23NS;day24NS];
NightTim4 = Night4(1540:1720);
Nscale = linspace(datetime('March 24, 2023 01:40:00'),datetime('March 24, 2023 04:40:00'), length(NightTim4));



opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
X3 = [SYMHData.SYMH(2881:4320)]; X4 = [SYMHData.SYMH(4321:5760)];
NightX4 = [ X3; X4]; 
X1 = NightX4(1540:1720);
ICV1 = NightTim4;
rect = [0.1, 0.52, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%  
wcdataICV1 = wcoherence(X1,ICV1,0.0041667,'PhaseDisplayThreshold',0.7);
MICV1 =mean(wcdataICV1);
plot(Nscale,(MICV1),LineWidth=2)
max(ICV1)
yline(max(ICV1),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
text(datetime('March 23, 2023 18:00:00'),0.6,'(a) ICV (N/F)')
grid on; 
xline(datetime('March 24, 2023 03:05:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xlim tight 
ylim([0 0.6])
text(datetime('March 24, 2023 01:42:00'),0.55,'(c) ICV (N/S)')
set(gca,'FontWeight','bold','FontSize',12);


%% ICV EW                                                                             FIGURE 16(d)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night4 = [day23NS;day24NS];
NightTim4 = Night4(1540:1720);
Nscale = linspace(datetime('March 24, 2023 01:40:00'),datetime('March 24, 2023 04:40:00'), length(NightTim4));


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
X3 = [SYMHData.SYMH(2881:4320)]; X4 = [SYMHData.SYMH(4321:5760)];
NightX4 = [ X3; X4]; 
X1 = NightX4(1540:1720);
ICV1 = NightTim4;
rect = [0.4, 0.52, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%  
wcdataICV1 = wcoherence(X1,ICV1,0.0041667,'PhaseDisplayThreshold',0.7);
MICV1 =mean(wcdataICV1);
plot(Nscale,(MICV1),LineWidth=2)
max(ICV1)
yline(max(ICV1),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
text(datetime('March 23, 2023 18:00:00'),0.6,'(a) ICV (N/F)')
grid on; 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 03:04:00'),linestyle ='--',linewidth=1,color = 'red') 
xlim tight 
ylim([0 0.6])
text(datetime('March 24, 2023 01:42:00'),0.55,'(d) ICV (E/W)')
set(gca,'FontWeight','bold','FontSize',12);


%% NAA NS                                                                                 FIGURE 16(e)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night4 = [day23NS;day24NS];
NightTim4 = Night4(1540:1720);
Nscale = linspace(datetime('March 24, 2023 01:40:00'),datetime('March 24, 2023 04:40:00'), length(NightTim4));



opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
X3 = [SYMHData.SYMH(2881:4320)]; X4 = [SYMHData.SYMH(4321:5760)];
NightX4 = [ X3; X4]; 
X1 = NightX4(1540:1720);
NAA1 = NightTim4;
rect = [0.1, 0.28, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%  
wcdataNAA1 = wcoherence(X1,NAA1,0.0041667,'PhaseDisplayThreshold',0.7);
MNAA1 =mean(wcdataNAA1);
plot(Nscale,(MNAA1),LineWidth=2)
max(NAA1)
yline(max(NAA1),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
text(datetime('March 23, 2023 18:00:00'),0.6,'(a) NAA (N/F)')
grid on; 
xline(datetime('March 24, 2023 03:00:00'),linestyle ='--',linewidth=1,color = 'red') 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xlim tight 
ylim([0 0.6])
xlabel("Time (UT)")
text(datetime('March 24, 2023 01:42:00'),0.55,'(e) NAA (N/S)')
set(gca,'FontWeight','bold','FontSize',12);


%% NAA EW                                                                                 FIGURE 16(f)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);
dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night4 = [day23NS;day24NS];
NightTim4 = Night4(1540:1720);
Nscale = linspace(datetime('March 24, 2023 01:40:00'),datetime('March 24, 2023 04:40:00'), length(NightTim4));


opts = spreadsheetImportOptions("NumVariables", 3);opts.Sheet = "Sheet1";opts.DataRange = "A2:C8641";
opts.VariableNames = ["YYYY", "DOY", "SYMH"];opts.VariableTypes = ["double", "double", "double"];
SYMHData = readtable("C:\Users\muyiw\OneDrive\Desktop\NB_Data\NB2023\Mar2023\SYMH_Data.xlsx", opts, "UseExcel", false);
X = (SYMHData.SYMH);
X3 = [SYMHData.SYMH(2881:4320)]; X4 = [SYMHData.SYMH(4321:5760)];
NightX4 = [ X3; X4]; 
X1 = NightX4(1540:1720);
NAA1 = NightTim4;
rect = [0.4, 0.28, 0.25, 0.16];axes( 'position' , rect );set(gca,'pos',rect);%%  
wcdataNAA1 = wcoherence(X1,NAA1,0.0041667,'PhaseDisplayThreshold',0.7);
MNAA1 =mean(wcdataNAA1);
plot(Nscale,(MNAA1),LineWidth=2)
max(NAA1)
yline(max(NAA1),LineWidth=1,Color='red',LineStyle='-')
ylabel('R^2','FontSize',12,'FontWeight','bold')
text(datetime('March 23, 2023 18:00:00'),0.6,'(a) NAA (N/S)')
grid on; 
xline(datetime('March 24, 2023 02:00:00'),linestyle ='--',linewidth=1,color = 'green')
xline(datetime('March 24, 2023 02:55:00'),linestyle ='--',linewidth=1,color = 'red') 
xlim tight 
ylim([0 0.6])
xlabel("Time (UT)")
text(datetime('March 24, 2023 01:42:00'),0.55,'(f) NAA (E/W)')
set(gca,'FontWeight','bold','FontSize',12);




%% WAVELET ANALYSIS FOR GRAVITY WAVES  SIGNATURES                    9    

%%  Full DAY    TBB (NS)                                                                    FIGURE 17(a)

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;


load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

rect = [0.1, 0.76, 0.35, 0.18];axes('Position', rect) % 24 hrs
 t = (0:length(Mydata)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(Mydata, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:1440:8640);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(a) ",'Color','w', 'FontWeight','bold','FontSize',16); %text(100,0.35,"(a) TBB (NS) 
%set(gca, 'XTick', []);
xline([342 1781 3220 4660 6157 7596],LineWidth=2,LineStyle='--',Color='m')
xline([1071 2512 3952 5453 6894 8334],LineWidth=2,LineStyle='-',Color='m')


%% FULL DAY   TBB (EW)                                                                  FIGURE 17 (b)

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;     

load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

rect = [0.5, 0.76, 0.35, 0.18];axes('Position', rect) % 24 hrs

 t = (0:length(Mydata)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(Mydata, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:1440:8640);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(b)  ",'Color','w', 'FontWeight','bold','FontSize',16) % TBB (EW)
%set(gca, 'XTick', []);
xline([342 1781 3220 4660 6157 7596],LineWidth=2,LineStyle='--',Color='m')
xline([1071 2512 3952 5453 6894 8334],LineWidth=2,LineStyle='-',Color='m')



%%  DAYTIME  TBB (NS)                                                                   FIGURE 17(C)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);

mydataDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.1, 0.54, 0.35, 0.18];axes('Position', rect) % Daytime
 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:361:2166);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(c) ",'Color','w', 'FontWeight','bold','FontSize',16) %Ariel-TBB (EW) CWT for Daytime
%set(gca, 'XTick', []);


%%  DAYTIME   TBB (EW)                                                                  FIGURE 17(d)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);

mydataDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.5, 0.54, 0.35, 0.18];axes('Position', rect) % Daytime
 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:361:2166);%set(gca, 'TickDir', 'out','XAxisLocation', 'bottom');%set(gca, 'XMinorTick', 'on','XAxisLocation', 'bottom');
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(d) ",'Color','w', 'FontWeight','bold','FontSize',16)%Ariel-TBB (EW) CWT for Daytime
%set(gca, 'XTickLabel', []); 


 %%  NIGHTTIME   TBB(NS)                                                                FIGURE 17(e)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

%NightTim1 = Night1(1200:1680);
NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);

mydataDay = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];

rect = [0.1, 0.32, 0.35, 0.18];axes('Position', rect); % Nighttime

 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:481:2405);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(e) ",'Color','w', 'FontWeight','bold','FontSize',16)


%%  NIGHTTIME:   TBB(EW)                                                            FIGURE 17(f)

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000TBB_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000TBB_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000TBB_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000TBB_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000TBB_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000TBB_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000TBB_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000TBB_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000TBB_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000TBB_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000TBB_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000TBB_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000TBB_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000TBB_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000TBB_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000TBB_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000TBB_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000TBB_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000TBB_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000TBB_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000TBB_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000TBB_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

%NightTim1 = Night1(1200:1680);
NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);

mydataDay = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.5, 0.32, 0.35, 0.18];axes('Position', rect); % Nighttime

 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:481:2405);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(f) ",'Color','w', 'FontWeight','bold','FontSize',16)%Ariel-TBB(EW) CWT for Nighttime




%% ICV ONLY                                                                      

%%  FULL DAY   ICV (NS)                                                         FIGURE 18(a)   


clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;                                                          
load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

rect = [0.1, 0.76, 0.35, 0.18];axes('Position', rect) % 24 hrs
 t = (0:length(Mydata)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(Mydata, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:1440:8640);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(a) ",'Color','w', 'FontWeight','bold','FontSize',16); %text(100,0.35,"(a) ICV (NS) 
%set(gca, 'XTick', []);
xline([342 1781 3220 4660 6157 7596],LineWidth=2,LineStyle='--',Color='m')
xline([1071 2512 3952 5453 6894 8334],LineWidth=2,LineStyle='-',Color='m')


%%  FULL DAY  ICV (EW)                                                                  FIGURE 18(b)   

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3; 

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

rect = [0.5, 0.76, 0.35, 0.18];axes('Position', rect) % 24 hrs

 t = (0:length(Mydata)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(Mydata, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:1440:8640);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(b)  ",'Color','w', 'FontWeight','bold','FontSize',16) % ICV (EW)
%set(gca, 'XTick', []);
xline([342 1781 3220 4660 6157 7596],LineWidth=2,LineStyle='--',Color='m')
xline([1071 2512 3952 5453 6894 8334],LineWidth=2,LineStyle='-',Color='m')

                                                   

%%  DAYTIME   ICV (NS)                                                                  FIGURE 18(c)         

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);

mydataDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.1, 0.54, 0.35, 0.18];axes('Position', rect) % Daytime
 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:361:2166);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(c) ",'Color','w', 'FontWeight','bold','FontSize',16) %Ariel-ICV (EW) CWT for Daytime
%set(gca, 'XTick', []);


%%  DAYTIME   ICV (EW)                                                                  FIGURE 18(d)   

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);

mydataDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.5, 0.54, 0.35, 0.18];axes('Position', rect) % Daytime
 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:361:2166);%set(gca, 'TickDir', 'out','XAxisLocation', 'bottom');%set(gca, 'XMinorTick', 'on','XAxisLocation', 'bottom');
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(d) ",'Color','w', 'FontWeight','bold','FontSize',16)%Ariel-ICV (EW) CWT for Daytime
%set(gca, 'XTickLabel', []); 

                                                                 SECTION 5(3)


%%  NIGHTTIME   ICV(NS)                                                                 FIGURE 18(e)   

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

%NightTim1 = Night1(1200:1680);
NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);

mydataDay = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];

rect = [0.1, 0.32, 0.35, 0.18];axes('Position', rect); % Nighttime

 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:481:2405);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(e) ",'Color','w', 'FontWeight','bold','FontSize',16)%Ariel-ICV(NS) CWT for Nighttime


%%  NIGHTTIME   ICV(EW)                                                                     FIGURE 18(f)   

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000ICV_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000ICV_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000ICV_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000ICV_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000ICV_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000ICV_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000ICV_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000ICV_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000ICV_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000ICV_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000ICV_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000ICV_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000ICV_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000ICV_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000ICV_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000ICV_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000ICV_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000ICV_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000ICV_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000ICV_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000ICV_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000ICV_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

%NightTim1 = Night1(1200:1680);
NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);

mydataDay = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.5, 0.32, 0.35, 0.18];axes('Position', rect); % Nighttime

 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:481:2405);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(f) ",'Color','w', 'FontWeight','bold','FontSize',16)%Ariel-ICV(EW) CWT for Nighttime





%% NAA ONLY                                                                  

%%  FULL DAY   NAA (NS)                                                                 FIGURE 19(a)   

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

rect = [0.1, 0.76, 0.35, 0.18];axes('Position', rect) % 24 hrs
 t = (0:length(Mydata)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(Mydata, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:1440:8640);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(a) ",'Color','w', 'FontWeight','bold','FontSize',16); %text(100,0.35,"(a) NAA (NS) 
%set(gca, 'XTick', []);
xline([342 1781 3220 4660 6157 7596],LineWidth=2,LineStyle='--',Color='m')
xline([1071 2512 3952 5453 6894 8334],LineWidth=2,LineStyle='-',Color='m')


%% FULL DAY:   NAA (EW)                                                                 FIGURE 19(b) 

clc;set(gcf,'color','w');
window_length = 63; polynomial_order = 3; 

load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);
Mydata = [Day21;Day22;Day23;Day24;Day25;Day26];

rect = [0.5, 0.76, 0.35, 0.18];axes('Position', rect) % 24 hrs

 t = (0:length(Mydata)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(Mydata, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:1440:8640);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(b)  ",'Color','w', 'FontWeight','bold','FontSize',16) % NAA (EW)
%set(gca, 'XTick', []);
xline([342 1781 3220 4660 6157 7596],LineWidth=2,LineStyle='--',Color='m')
xline([1071 2512 3952 5453 6894 8334],LineWidth=2,LineStyle='-',Color='m')



%% DAYTIME   NAA (NS)                                                                   FIGURE 19(c)     

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);

mydataDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.1, 0.54, 0.35, 0.18];axes('Position', rect) % Daytime
 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:361:2166);
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(c) ",'Color','w', 'FontWeight','bold','FontSize',16) %Ariel-NAA (EW) CWT for Daytime
%set(gca, 'XTick', []);


%%   DAYTIME   NAA (EW)                                                                 FIGURE 19(d) 

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');


Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

DayTim21 = day21NS(600:960);
DayTim22 = day22NS(600:960);
DayTim23 = day23NS(600:960);
DayTim24 = day24NS(600:960);
DayTim25 = day25NS(600:960);
DayTim26 = day26NS(600:960);

mydataDay = [DayTim21;DayTim22;DayTim23;DayTim24;DayTim25;DayTim26];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.5, 0.54, 0.35, 0.18];axes('Position', rect) % Daytime
 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:361:2166);%set(gca, 'TickDir', 'out','XAxisLocation', 'bottom');%set(gca, 'XMinorTick', 'on','XAxisLocation', 'bottom');
xticklabels({'21','22', '23', '24', '25', '26'})
%xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(d) ",'Color','w', 'FontWeight','bold','FontSize',16)%Ariel-NAA (EW) CWT for Daytime
%set(gca, 'XTickLabel', []); 



%%   NIGHTTIME:   NAA(NS)                                                               FIGURE 19(e) 

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_100A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_100A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_100A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_100A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_100A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_100A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_100A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_100A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_100A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_100A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_100A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_100A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_100A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_100A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_100A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_100A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_100A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_100A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_100A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_100C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_100C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_100C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

%NightTim1 = Night1(1200:1680);
NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);

mydataDay = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];

rect = [0.1, 0.32, 0.35, 0.18];axes('Position', rect); % Nighttime

 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs));colormap('jet');  % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:481:2405);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(e) ",'Color','w', 'FontWeight','bold','FontSize',16)


%%   NIGHTTIME   NAA(EW)                                                                FIGURE 19(f) 

clc; set(gcf,'color','w');
window_length = 63; polynomial_order = 3;  

load('AL230307000000NAA_101A.mat');   dat7   = resample(data,1,60);
load('AL230308000000NAA_101A.mat');   dat8   = resample(data,1,60);
load('AL230309000000NAA_101A.mat');   dat9   = resample(data,1,60);
load('AL230310000000NAA_101A.mat');   dat10  = resample(data,1,60);
load('AL230311000000NAA_101A.mat');   dat11  = resample(data,1,60);
load('AL230312000000NAA_101A.mat');   dat12  = resample(data,1,60);
load('AL230313000000NAA_101A.mat');   dat13  = resample(data,1,60);
load('AL230314000000NAA_101A.mat');   dat14  = resample(data,1,60);
load('AL230317000000NAA_101A.mat');   dat17  = resample(data,1,60);
load('AL230318000000NAA_101A.mat');   dat18  = resample(data,1,60);
load('AL230319000000NAA_101A.mat');   dat19  = resample(data,1,60);
load('AL230320000000NAA_101A.mat');   dat20  = resample(data,1,60);
load('AL230321000000NAA_101A.mat');   dat21  = resample(data,1,60);
load('AL230322000000NAA_101A.mat');   dat22  = resample(data,1,60);
load('AL230323000000NAA_101A.mat');   dat23  = resample(data,1,60);
load('AL230324000000NAA_101A.mat');   dat24  = resample(data,1,60);
load('AL230325000000NAA_101A.mat');   dat25  = resample(data,1,60);
load('AL230326000000NAA_101A.mat');   dat26  = resample(data,1,60);
load('AL230327000000NAA_101A.mat');   dat27  = resample(data,1,60);                                 
load('AL230329000000NAA_101C.mat');   dat29  = resample(data,1,3000);
load('AL230330000000NAA_101C.mat');   dat30  = resample(data,1,3000);
load('AL230331000000NAA_101C.mat');   dat31  = resample(data,1,3000);

dataAll_NS = [dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat17,dat18,dat19,dat20,dat21,dat22,dat25,dat26,dat29,dat30,dat31];
mydata_NS = sgolayfilt(dataAll_NS, polynomial_order, window_length);
meanData = mean(mydata_NS,2,'omitnan');

%Day20 = sgolayfilt(dat20, polynomial_order, window_length);
Day21 = sgolayfilt(dat21, polynomial_order, window_length);
Day22 = sgolayfilt(dat22, polynomial_order, window_length);
Day23 = sgolayfilt(dat23, polynomial_order, window_length);
Day24 = sgolayfilt(dat24, polynomial_order, window_length);
Day25 = sgolayfilt(dat25, polynomial_order, window_length);
Day26 = sgolayfilt(dat26, polynomial_order, window_length);

%day20NS = Day20-meanData;
day21NS = Day21-meanData;
day22NS = Day22-meanData;
day23NS = Day23-meanData;
day24NS = Day24-meanData;
day25NS = Day25-meanData;
day26NS = Day26-meanData;

%Night1 = [day20NS;day21NS];
Night2 = [day21NS;day22NS];
Night3 = [day22NS;day23NS];
Night4 = [day23NS;day24NS];
Night5 = [day24NS;day25NS];
Night6 = [day25NS;day26NS];

%NightTim1 = Night1(1200:1680);
NightTim2 = Night2(1200:1680);
NightTim3 = Night3(1200:1680);
NightTim4 = Night4(1200:1680);
NightTim5 = Night5(1200:1680);
NightTim6 = Night6(1200:1680);

mydataDay = [NightTim2;NightTim3;NightTim4;NightTim5;NightTim6];
meanDataDay = mean(mydataDay,2,'omitnan');

rect = [0.5, 0.32, 0.35, 0.18];axes('Position', rect); % Nighttime

 t = (0:length(mydataDay)-1)';
% Perform the Continuous Wavelet Transform using the 'amor' (Morlet) wavelet
[cwt_coeffs, freqs] = cwt(mydataDay, 'amor', 1);  % Sampling period = 1 minute
imagesc(t, freqs, abs(cwt_coeffs)); colormap('jet'); % Plot absolute values of CWT coefficients
set(gca,'FontWeight','bold','FontSize',12);
axis xy;  % Ensure that the y-axis is properly oriented
xlabel('Time (minutes)');
ylabel('Freq. (Hz)');
%title('Continuous Wavelet Transform (CWT) of mydata');
colorbar;
xticks(0:481:2405);
xticklabels({'21/22', '22/23', '23/24', '24/25', '25/26'})
xlabel("Days in March 2023")
ylabel("Freq. (mHz)")
text(100,0.35,"(f) ",'Color','w', 'FontWeight','bold','FontSize',16)%Ariel-NAA(EW) CWT for Nighttime
