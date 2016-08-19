% ===== INSTRUCTIONS BEFORE RUNNING THE SCRIPT =====
% [MUST]
% use the EXP004-2016-08-10-RGB_channels_from_the_dataset.mat file
% to run this script properly
% - END OF INSTRUCTION -

% Test plan:
% Compress using the following
% 1)  Using 10% of the total pixels
% 1-a)[ADDED] Using 25% of the total pixels 
% 2)  Using 50% of the total pixels
% 3)  [CANCELLED] Using 75% of the total pixels
% 4)  Sparse autoencoder: 1,000,000 hidden neurons

hiddenSize_10 = 30720 % 10% of the neurons
hiddenSize_25 = 76800
hiddenSize_50 = 153600

filename = sprintf('EXP005-%s-autoencoder result.mat', datetime('now','TimeZone','local','Format', 'yyyy-MM-dd'))


disp('training autoencoder R...');
disp('   training 10\%...')
autoEnc_R_10 = trainAutoencoder(channel_R_dataset,hiddenSize_10, 'useGPU', true);
disp('   DONE')
disp('   training 25\%...')
autoEnc_R_25 = trainAutoencoder(channel_R_dataset, hiddenSize_25, 'useGPU', true);
disp('   DONE')
disp('   training 50\%...')
autoEnc_R_50 = trainAutoencoder(channel_R_dataset, hiddenSize_50, 'useGPU', true);
disp('   DONE')
disp('training autoencoder R done');

% saving to the file and clearing the workspace
save(filename, 'autoEnc_R_10', 'autoEnc_R_25', 'autoEnc_R_50')
clearvars -except hiddenSize_10 hiddenSize_25 hiddenSize_50 filename


disp('training autoencoder G...');
disp('   training 10\%...')
autoEnc_G_10 = trainAutoencoder(channel_G_dataset, hiddenSize_10, 'useGPU', true);
disp('   DONE')
disp('   training 25\%...')
autoEnc_G_25 = trainAutoencoder(channel_G_dataset, hiddenSize_25, 'useGPU', true);
disp('   DONE')
disp('   training 50\%...')
autoEnc_G_50 = trainAutoencoder(channel_G_dataset, hiddenSize_50, 'useGPU', true);
disp('   DONE')
disp('training autoencoder G done');


% saving to the file and clearing the workspace
save(filename, 'autoEnc_G_10', 'autoEnc_G_25', 'autoEnc_G_50', '-append')
clearvars -except hiddenSize_10 hiddenSize_25 hiddenSize_50 filename

disp('training autoencoder B...');
disp('   training 10\%...')
autoEnc_B_10 = trainAutoencoder(channel_B_dataset, hiddenSize_10, 'useGPU', true);
disp('   DONE')
disp('   training 25\%...')
autoEnc_B_25 = trainAutoencoder(channel_B_dataset, hiddenSize_25, 'useGPU', true);
disp('   DONE')
disp('   training 50\%...')
autoEnc_B_50 = trainAutoencoder(channel_B_dataset, hiddenSize_50, 'useGPU', true);
disp('   DONE')
disp('training autoencoder B done');

% saving to the file and clearing the workspace
save(filename, 'autoEnc_B_10', 'autoEnc_B_25', 'autoEnc_B_50', '-append')
clearvars -except hiddenSize_10 hiddenSize_25 hiddenSize_50 filename