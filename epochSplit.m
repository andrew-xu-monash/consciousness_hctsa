function [table] = epochSplit(data, sampling_freq, epoch_length)
% Inputs:
%   data = cell (time x channels)
%   sampling_freq = sampling frequency (in Hz)
%   epoch_length = desired length of each epoch (in seconds)
%
%Outputs:
%   table = cell (epoch length x (channels * number of available epochs))

% number of rows for each epoch
r = sampling_freq*epoch_length;

% number of possible epochs to make
e_n = size(data);
e_n = floor(e_n(1)/r);

% number of channels
ch = size(data);
ch = ch(2);

% creating table
for i = 1:e_n
    table(1:r, (i-1)*ch+1:(i-1)*ch+ch) = data((i-1)*r+1:(i-1)*r+r, 1:ch);
end

end