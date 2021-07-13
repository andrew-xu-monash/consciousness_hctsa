%% Description

%{


Exludes any features which has >= 1 NaN value across the time series,
Excludes any features whihch has a constant value across time series,

NB: exclusion is done on a per-channel basis

%}

%% Settings
file_prefix = 'HCTSA_k_a'; % HCTSA_k_a, HCTSA_k_w, HCTSA_p_a, HCTSA_p_w, HCTSA_x_a, HCTSA_x_w
file_suffix = '.mat';
nChannels = 60;
out_dir = [file_prefix 'data/'];

%% Load files
file_directory = ;% put directory here
load(file_directory);

%% Separate data into channels

% Separate out channels into separate HCTSA files
for ch = 1:nChannels
    ch_string = ['channel' num2str(ch)];
    
end