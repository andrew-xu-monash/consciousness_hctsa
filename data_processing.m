%% Description

%{
Reshaping data into epochs of 2 seconds (1450*2 samples)
Data pre-processing (mean subtraction, line noise removal)
%}


%% reading files
% propofol
p_a = struct2cell(load('data/H0010P.mat')); % using cells as it integrates well with hctsa analysis
p_a_eeg = p_a{2};
p_w = struct2cell(load('data/H0010W.mat'));
p_w_eeg = p_w{2};
% xenon
x_a = struct2cell(load('data/H0081X.mat'));
x_a_eeg = x_a{2};
x_w = struct2cell(load('data/H0081W.mat'));
x_w_eeg = x_w{2};
% ketamine
k_a = struct2cell(load('data/H0109K.mat'));
k_a_eeg = k_a{2};
k_w = struct2cell(load('data/H0109W.mat'));
k_w_eeg = k_w{2};

%% splitting data into 2-second epochs
p_a_eeg_proc = epochSplit(p_a_eeg, 1450, 2);
p_w_eeg_proc = epochSplit(p_w_eeg, 1450, 2);
x_a_eeg_proc = epochSplit(x_a_eeg, 1450, 2);
x_w_eeg_proc = epochSplit(x_w_eeg, 1450, 2);
k_a_eeg_proc = epochSplit(k_a_eeg, 1450, 2);
k_w_eeg_proc = epochSplit(k_w_eeg, 1450, 2);

%% pre-processing
% defining common parameters
sample_rate = 1450;
params = struct();
params.Fs = sample_rate;
params.tapers = [5,9];
params.pad = 2;
params.removeFreq = [];

% subtracting mean from each channel
p_a_eeg_proc = subtractMean(p_a_eeg_proc);
p_w_eeg_proc = subtractMean(p_w_eeg_proc);
x_a_eeg_proc = subtractMean(x_a_eeg_proc);
x_w_eeg_proc = subtractMean(x_w_eeg_proc);
k_a_eeg_proc = subtractMean(k_a_eeg_proc);
k_w_eeg_proc = subtractMean(k_w_eeg_proc);

% removing line noise
[p_a_eeg_proc, p_a_eeg_fit] = removeLineNoise(p_a_eeg_proc, params);
[p_w_eeg_proc, p_w_eeg_fit] = removeLineNoise(p_w_eeg_proc, params);
[x_a_eeg_proc, x_a_eeg_fit] = removeLineNoise(x_a_eeg_proc, params);
[x_w_eeg_proc, x_w_eeg_fit] = removeLineNoise(x_w_eeg_proc, params);
[k_a_eeg_proc, k_a_eeg_fit] = removeLineNoise(k_a_eeg_proc, params);
[k_w_eeg_proc, k_w_eeg_fit] = removeLineNoise(k_w_eeg_proc, params);

%% saving variables into .mat file for hctsa
[timeSeriesData, labels, keywords] = hctsaSave(p_a_eeg_proc, 2900, 'p_a');
save('p_a_hctsa.mat', 'timeSeriesData', 'labels', 'keywords');
[timeSeriesData, labels, keywords] = hctsaSave(p_w_eeg_proc, 2900, 'p_w');
save('p_w_hctsa.mat', 'timeSeriesData', 'labels', 'keywords');
[timeSeriesData, labels, keywords] = hctsaSave(x_a_eeg_proc, 2900, 'x_a');
save('x_a_hctsa.mat', 'timeSeriesData', 'labels', 'keywords');
[timeSeriesData, labels, keywords] = hctsaSave(x_w_eeg_proc, 2900, 'x_w');
save('x_w_hctsa.mat', 'timeSeriesData', 'labels', 'keywords');
[timeSeriesData, labels, keywords] = hctsaSave(k_a_eeg_proc, 2900, 'k_a');
save('k_a_hctsa.mat', 'timeSeriesData', 'labels', 'keywords');
[timeSeriesData, labels, keywords] = hctsaSave(k_w_eeg_proc, 2900, 'k_w');
save('k_w_hctsa.mat', 'timeSeriesData', 'labels', 'keywords');