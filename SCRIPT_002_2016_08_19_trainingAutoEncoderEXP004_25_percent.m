% ===== INSTRUCTIONS BEFORE RUNNING THE SCRIPT =====
% [MUST]
% use the EXP004C.mat file
% to run this script properly
% - END OF INSTRUCTION -

% param channel -> The channel you want to train
% param channelType -> The string representation of the channel (useful for
% 
function [autoEncoderResult, tend]  = SCRIPT_002_2016_08_19_trainingAutoEncoderEXP004_25_percent(channel, channelType)

    % running the script 
    hiddenSize_10 = 1920; % 10% of the neurons

    
    filename = sprintf('EXP005-%s-autoencoder%s_result_25.mat', datetime('now','TimeZone','local','Format', 'yyyy-MM-dd', channelType));

    disp('training autoencoder');
    disp('   training 10\%...');
    tstart = tic;
    autoEncoderResult = trainAutoencoder(channel, hiddenSize_10, 'useGPU', true);
    tend = toc(tstart);
    disp('   DONE');
    disp('training autoencoder done');

    % saving to the file and clearing the workspace
    disp('Saving %s...', filename);
    save(filename, 'autoEncoderResult', 'tend');
    disp('DONE');
end
