function [timeSeriesData, labels, keywords] = hctsaSave(data, epoch_length, intervention_type)
%Purpose:
%   reshapes/modifies data into format for saving data as hctsa files
%
%Inputs:
%   data = cell (time x channels/epochs)
%   epoch_length = double (length/number of rows per epoch)
%   intervention_type = string (type of drug, and type of intervention)
%
%Outputs:
%   timeSeriesData = cell (channels/epochs x 1)
%   labels = strings (channels/epochs x 1)
%   keywords = strings (channels/epochs x 1)

e_n = size(data);
e_n = e_n(2);

timeSeriesData = cell(e_n, 1);
labels = strings(e_n, 1);
keywords = strings(e_n, 1);

for i = 1:e_n
    time_series = data(1:epoch_length, i);
    timeSeriesData(i) = {time_series};
    label = strcat('epoch_', num2str(i));
    labels(i) = label;
    keyword = strcat(intervention_type, ',epoch_', num2str(i));
    keywords(i) = keyword;
end

labels = cellstr(labels);
keywords = cellstr(keywords);

end

