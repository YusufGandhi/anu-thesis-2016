% ===== INSTRUCTIONS BEFORE RUNNING THE SCRIPT =====
% [MUST]
% use the EXP004C.mat file
% to run this script properly
% - END OF INSTRUCTION -
function [autoEnc_G_10, autoEnc_B_10, tendgreen, tendblue]  = SCRIPT_002_2016_08_19_trainingAutoEncoderEXP004_25_percent(channelG, channelB)

    % running the script 
    hiddenSize_10 = 1920; % 10% of the neurons


    filename = sprintf('EXP005-%s-autoencoder_result_25.mat', datetime('now','TimeZone','local','Format', 'yyyy-MM-dd'));

    disp('training autoencoder G...');
    disp('   training 10\%...')
    tstart = tic;
    autoEnc_G_10 = trainAutoencoder(channelG, hiddenSize_10, 'useGPU', true);
    tendgreen = toc(tstart);
    disp('   DONE')
    disp('training autoencoder G done');


    % saving to the file and clearing the workspace
    save(filename, 'autoEnc_G_10', 'tendgreen')
    clearvars -except hiddenSize_10

    disp('training autoencoder B...');
    disp('   training 10\%...')
    tstart = tic;
    autoEnc_B_10 = trainAutoencoder(channelB, hiddenSize_10, 'useGPU', true);
    tendblue = toc(tstart);
    disp('   DONE')
    disp('training autoencoder B done');


    % saving to the file and clearing the workspace
    save(filename, 'autoEnc_B_10','tendblue','-append')
    clearvars
    disp('Training autoencoders DONE');
end
