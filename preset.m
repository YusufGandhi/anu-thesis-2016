addpath ../../../../Volumes/MySGDrive/NS_DataSet/
addpath ../../../../Volumes/MySGDrive/NS_DataSet/images/images/

N=18132; % number of the training data

hiddenSize = 300;

channelR = cell(1,N);
channelG = cell(1,N);
channelB = cell(1,N);

for i=1:N
    fileName = sprintf('%03d.jpg',i);
    str = sprintf('Processing %s',fileName);
    disp(str);
    current_image_rep = im2double(imresize(imread(fileName),0.1));
    channelR{1,i} = current_image_rep(:,:,1);
    channelG{1,i} = current_image_rep(:,:,2);
    channelB{1,i} = current_image_rep(:,:,3);
end

%training the autoencoder
disp('training autoencoder R...');
autoEnc_R = trainAutoencoder(channelR,hiddenSize);
disp('training autoencoder R done');

disp('training autoencoder G...');
autoEnc_G = trainAutoencoder(channelG, hiddenSize);
disp('training autoencoder G done');

disp('training autoencoder B...');
autoEnc_B = trainAutoencoder(channelB, hiddenSize);
disp('training autoencoder B done');