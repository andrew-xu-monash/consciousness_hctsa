function [output] = subtractMean(data)
%Inputs:
%   data = cell (time x channels/epochs)
%
%Outputs:
%   output = processed data (same dimensions)

dims = size(data);
data_mean = mean(data, 1);
data_mean = repmat(data_mean, [dims(1) ones(1, length(dims)-1)]);
output = data - data_mean;

end