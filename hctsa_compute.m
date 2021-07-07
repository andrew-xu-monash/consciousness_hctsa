function [] = hctsa_compute(hctsa_mat)
% Compute hctsa features on initialised hctsa matrix
%
% Inputs:
%   hctsa_mat = string; initalised hctsa .mat file

hctsa_dir = 'data/';

TS_Compute(true, [], [], [], [hctsa_dir hctsa_mat]);

end