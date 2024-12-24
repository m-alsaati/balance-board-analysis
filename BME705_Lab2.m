%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BME705: Rehabilitation Engineering
% Lab 2: Balance Board Signal Analysis
            
%%%%%%%%%%%%%%% Part 2 : %%%%%%%%%%%%%%%

%% 2.1

% Load the data from all subjects and reference and define time
datadir = ('D:\Documents\Fourth Year (Final year... maybe)\BME 705\BME 705 matlab stuff\Lab 2')

ref_data = xlsread('Reference_Part2.xlsx');
subject_data1 = xlsread('Subject1_Part2.xlsx');
subject_data2 = xlsread('Subject2_Part2.xlsx');

fs = 30;
t= [0:length(ref_data)-1]/fs;

% Extract individual axis data from Columns 2 and 3
ref_xaxis = ref_data(:,2);
ref_yaxis = ref_data(:,3);

subject1_xaxis = subject_data1(:,2);
subject1_yaxis = subject_data1(:,3);

subject2_xaxis = subject_data2(:,2);
subject2_yaxis = subject_data2(:,3);

% Find the cross-correlation between all subjects and reference signal
xaxis_corr1 = xcorr(ref_xaxis,subject1_xaxis);
yaxis_corr1 = xcorr(ref_yaxis,subject1_yaxis);

xaxis_corr2 = xcorr(ref_xaxis,subject2_xaxis);
yaxis_corr2 = xcorr(ref_yaxis,subject2_yaxis);

% Plot all cross correlations
t1 = [0:length(xaxis_corr1)-1]/fs;

plot(t1,xaxis_corr1)
axis tight
grid
xlabel('Time (s)');
ylabel('Amplitude');
title('Cross Correlation Between Reference and Subject 1 X-Axis Data');

figure;
plot(t1,xaxis_corr2)
axis tight
grid
xlabel('Time (s)');
ylabel('Amplitude');
title('Cross Correlation Between Reference and Subject 1 Y-Axis Data');

figure;
plot(t1,yaxis_corr1)
axis tight
grid
xlabel('Time (s)');
ylabel('Amplitude');
title('Cross Correlation Between Reference and Subject 2 X-Axis Data');

figure;
plot(t1,yaxis_corr2)
axis tight
grid
xlabel('Time (s)');
ylabel('Amplitude');
title('Cross Correlation Between Reference and Subject 2 Y-Axis Data');

%% 2.2

% Calculate the Correlation coefficients
coef_sub1_x = corrcoef(subject1_xaxis,ref_xaxis);
coef_sub1_y = corrcoef(subject1_yaxis,ref_yaxis);

coef_sub2_x = corrcoef(subject2_xaxis,ref_xaxis);
coef_sub2_y = corrcoef(subject2_yaxis,ref_yaxis);

%% 2.3

% Calculate the rms for each subject in each axis using the formula in the lab manual
% rmse1_x = 0;
% rmse1_y = 0;
% rmse2_x = 0;
% rmse2_y = 0;
% 
% N = length(ref_data);
% for i = 1:N
%     rmse1_x = rmse1_x + ((subject1_xaxis(i)-ref_xaxis(i)).^2)/N;
%     rmse1_y = rmse1_y + ((subject1_yaxis(i)-ref_yaxis(i)).^2)/N;
%     rmse2_x = rmse2_x + ((subject2_xaxis(i)-ref_xaxis(i)).^2)/N;
%     rmse2_y = rmse2_y + ((subject2_yaxis(i)-ref_yaxis(i)).^2)/N;
% end
% 
% rmse1_x = sqrt(rmse1_x);
% rmse1_y = sqrt(rmse1_y);
% rmse2_x = sqrt(rmse2_x);
% rmse2_y = sqrt(rmse2_y);

rmse1_x = rmse(ref_xaxis,subject1_xaxis);
rmse1_y = rmse(ref_yaxis,subject1_yaxis);
rmse2_x = rmse(ref_xaxis,subject2_xaxis);
rmse2_y = rmse(ref_yaxis,subject2_yaxis);

%% 2.4

% Plot all subjects on the same graph with their RMS
figure;
hold on;
% subplot(2,2,1)
plot(t,subject1_xaxis)
yline(rmse1_x, '--','Subject 1 X-Axis RMS');

% subplot(2,2,2)
plot(t,subject1_yaxis)
yline(rmse1_y, '--','Subject 1 Y-Axis RMS');

% subplot(2,2,3)
plot(t,subject2_xaxis)
yline(rmse2_x, '--','Subject 2 X-Axis RMS');

% subplot(2,2,4)
plot(t,subject2_yaxis)
yline(rmse2_y, '--','Subject 2 Y-Axis RMS');
hold off;
%% 2.5 

% Determine center of pressure and stretch it by a factor of 1000
stabilo1_xaxis = (subject1_xaxis/length(subject1_xaxis))*1000;
stabilo1_yaxis = (subject1_yaxis/length(subject1_yaxis))*1000;
stabilo2_xaxis = (subject2_xaxis/length(subject2_xaxis))*1000;
stabilo2_yaxis = (subject2_yaxis/length(subject2_yaxis))*1000;

% Plot stabilogram for all subjects including reference
figure;
plot(stabilo1_xaxis,stabilo1_yaxis)
grid
xlabel('X-Axis Data');
ylabel('Y-Axis Data');
title('Stabilogram of Subject 1');
xlim([-0.8 0.8]);
ylim([-1.2 1.2]);

% stabilo1_yaxis = stabilo1_yaxis*(-1);
% figure;
% plot(stabilo1_xaxis,stabilo1_yaxis)

figure;
plot(stabilo2_xaxis,stabilo2_yaxis)
grid
xlabel('X-Axis Data');
ylabel('Y-Axis Data');
title('Stabilogram of Subject 2');
xlim([-0.8 0.8]);
ylim([-1.2 1.2]);

% stabilo2_yaxis = stabilo2_yaxis*(-1);
% figure;
% plot(stabilo2_xaxis,stabilo2_yaxis)
 