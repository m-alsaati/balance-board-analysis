%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BME705: Rehabilitation Engineering
% Lab 2: Balance Board Signal Analysis
%
% Created by: Daniel Genkin, 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Names:
%
% Student IDs: 
%
clear, clc, close all

%%%%%%%%%%%%%%% Part 1 : %%%%%%%%%%%%%%%
%% 1.1

% Load the reference accelerometer data for part 1
datadir = ('D:\Documents\Fourth Year (Final year... maybe)\BME 705\BME 705 matlab stuff\Lab 2')
ref_data = xlsread("Reference_Part1.xlsx");

% Define sampling frequency and create the time vector 
fs = 30
t= [0:length(ref_data)-1]/fs;

% Separate the X-axis and Y-axis from the ref data (column 2 and column 3)

refxdir = xlsread("Reference_Part1.xlsx","B:B");
refydir = xlsread("Reference_Part1.xlsx","C:C");

% Plot the X and Y data seperately
figure(1)
plot(t,refxdir)
xlabel("Time (s)")
ylabel("Amplitude")
title("X Direction Data")
figure(2)
plot(t,refydir)
xlabel("Time (s)")
ylabel("Amplitude")
title("Y Direction Data")

% Align the signals
start_point = 75;
end_point = 75+1050;
talign = t(start_point:end_point)
refxdiralign = refxdir(start_point:end_point)
refydiralign = refydir(start_point:end_point)
% Plot the aligned X and Y data seperately
figure(4)
plot(talign,refxdiralign)
hold on;
plot(talign,refydiralign)
xlabel("Time (s)")
ylabel("Amplitude")
title("X and Y Direction Aligned Data")

%% 1.2

% Load all subject data
sub1_data = xlsread("Subject1_Part1.xlsx");
sub2_data = xlsread("Subject2_Part1.xlsx")

fs = 30
tsub1= [0:length(sub1_data)-1]/fs;
sub1xdir = xlsread("Subject1_Part1.xlsx","B:B");
sub1ydir = xlsread("Subject1_Part1.xlsx","C:C");

tsub2= [0:length(sub2_data)-1]/fs;
sub2xdir = xlsread("Subject2_Part1.xlsx","B:B");
sub2ydir = xlsread("Subject2_Part1.xlsx","C:C");

figure(6)
subplot(211)
plot(tsub1,sub1xdir)
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 1 X Direction Data")
subplot(212)
plot(tsub1,sub1ydir)
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 1 Y Direction Data")

figure(7)
subplot(211)
plot(tsub2,sub2xdir)
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 2 X Direction Data")
subplot(212)
plot(tsub2,sub2ydir)
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 2 Y Direction Data")

% Align the signals of the subjects by finding the plotting and finding their start point

start_point = 50;
end_point = 50+1050;

talign = tsub1(start_point:end_point)
sub1xdiralign = sub1xdir(start_point:end_point)
sub1ydiralign = sub1ydir(start_point:end_point)
% Plot the aligned X and Y data seperately
figure(8)
plot(talign,sub1xdiralign)
hold on;
plot(talign,sub1ydiralign)
xlabel("Time (s)")
ylabel("Amplitude")
title("X and Y Direction Subject 1 Aligned Data")

talign = tsub2(start_point:end_point)
sub2xdiralign = sub2xdir(start_point:end_point)
sub2ydiralign = sub2ydir(start_point:end_point)
% Plot the aligned X and Y data seperately
figure(9)
plot(talign,sub2xdiralign)
hold on;
plot(talign,sub2ydiralign)
xlabel("Time (s)")
ylabel("Amplitude")
title("X and Y Direction Subject 2 Aligned Data")

% Find the cross-correlation between all subjects and reference signal
xcorr_xaxis1 = xcorr(refxdiralign,sub1xdiralign);
xcorr_yaxis1 = xcorr(refydiralign,sub1ydiralign);

xcorr_xaxis2 = xcorr(refxdiralign,sub2xdiralign);
xcorr_yaxis2 = xcorr(refydiralign,sub2ydiralign);

txcorsub1 = [0:length(xcorr_xaxis1)-1]/fs;
txcorsub2 = [0:length(xcorr_xaxis2)-1]/fs;

% Plot the cross correlations for each subject

figure(10)
plot(txcorsub1,xcorr_xaxis1);
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 1 X Direction Cross Correlation")
figure(11)
plot(txcorsub1,xcorr_yaxis1);
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 1 Y Direction Cross Correlation")
figure(12)
plot(txcorsub2,xcorr_xaxis2);
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 2 X Direction Cross Correlation")
figure(13)
plot(txcorsub2,xcorr_yaxis2);
xlabel("Time (s)")
ylabel("Amplitude")
title("Subject 2 Y Direction Cross Correlation")
%% 1.3

% Calculate the Correlation coefficients
corrcoefx1 = corrcoef(refxdiralign,sub1xdiralign);
corrcoefy1 = corrcoef(refydiralign,sub1ydiralign);
corrcoefx2 = corrcoef(refxdiralign,sub2xdiralign);
corrcoefy2 = corrcoef(refydiralign,sub2ydiralign);
