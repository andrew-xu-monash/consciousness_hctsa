%% Description

%{

Inspection of quality of hctsa outputs - visualising errors, NaN values, and infinity values

%}

%% Load files
file_directory = ;% put directory here
load(file_directory);

%% Inspecting via special values
figure;

% plotting errors
hctsa_error = TS_Quality == 1;
subplot(3, 1, 1);
plot(sum(hctsa_error));
plot(sum(hctsa_error)/size(hctsa_error, 1));
title('epoch errors');
ylabel('prop.');

% plotting nan values
hctsa_nan = TS_Quality == 2;
subplot(3, 1, 2);
plot(sum(hctsa_nan)/size(hctsa_nan, 1));
title('epoch nans');
subplot(3, 1, 3);

% plotting infs
hctsa_inf = TS_Quality == 3 | TS_Quality == 4;
plot(sum(hctsa_inf)/size(hctsa_inf, 1));
title('epoch infs');
xlabel('feature');

%% Constant values
same_thresh = repmat(TS_DataMat(1, :), [size(TS_DataMat, 1) 1]);
subtracted = TS_DataMat - same_thresh;
hctsa_const = all(subtracted == 0, 1);

%% Looking at number of features with special cases
nNan_any = sum(any(hctsa_error | hctsa_nan, 1));
nNan_all = sum(any(hctsa_error | hctsa_nan, 1));

nConst = sum(hctsa_const & ~all(hctsa_error | hctsa_nan, 1));