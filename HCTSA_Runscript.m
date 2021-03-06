% Remember home directory
myStartingDir = pwd;

% Load paths for the hctsa package
cd('~/qb48_scratch/dxuu0007')
toolbox_dir = 'toolboxes/';
addpath(genpath(toolbox_dir));

% Move Matlab back to the working PBS directory
cd(myStartingDir)

% ------------------------------------------------------------------------------
%% SET RANGE OF TS_IDs TO COMPUTE:
% ------------------------------------------------------------------------------
tsid_min = 1; % Calculate from this ts_id...
tsid_max = 9840; % To this ts_id

% ------------------------------------------------------------------------------
%% Default parameters for computation:
% ------------------------------------------------------------------------------
nSeriesPerGo = 18;
useParralel = true;
opRange = [];
customFile = 'HCTSA_subset.mat';


%-------------------------------------------------------------------------------
% Defining number of cores available for partitioning
%-------------------------------------------------------------------------------
nCores = feature('numcores');
parpool(nCores);

%-------------------------------------------------------------------------------
% Make the required subset from the master HCTSA file:
%-------------------------------------------------------------------------------
TS_Subset('../HCTSA.mat',tsid_min:tsid_max,[],1,customFile);

% ------------------------------------------------------------------------------
%% Start calculating:
% ------------------------------------------------------------------------------

% Provide a quick message:
fprintf(1,'About to calculate time series (ts_ids %u--%u), %u at a time\n', ...
                tsid_min,tsid_max,nSeriesPerGo);

% Calculate nSeriesPerGo time series at a time (so results are regularly saved)
currentId = tsid_min;
while currentId <= tsid_max
    tsRange = (currentId:currentId + nSeriesPerGo);
    tsRange(2) = min([tsRange(2),tsid_max]);
    TS_Compute(useParralel,tsRange,opRange,'bad',customFile);
    currentId = currentId + nSeriesPerGo + 1;
end

fprintf(1,'Finished calculating ts_ids %u--%u!\n',tsid_min,tsid_max);
