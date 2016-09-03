% copied from http://au.mathworks.com/help/nnet/ref/trainnetwork.html
% just changing the input layer to the correct dimension (160x120)
% and to 3 channels

layers = [imageInputLayer([480 640 3],'Normalization','none');
          convolution2dLayer(5,20,'Stride',3);
          reluLayer();
          maxPooling2dLayer(2,'Stride',2);
          dropoutLayer(0.2);
          convolution2dLayer(5,16);
          reluLayer();
          maxPooling2dLayer(2,'Stride',2);
          dropoutLayer(0.3);
          fullyConnectedLayer(256);
          reluLayer();
          fullyConnectedLayer(2);
          softmaxLayer();
          classificationLayer()];

%  1st experiment
%  layers = [imageInputLayer([480 640 3],'Normalization','none');
%           convolution2dLayer(5,20,'Stride',3);
%           reluLayer();
%           maxPooling2dLayer(2,'Stride',2);
%           convolution2dLayer(5,16);
%           reluLayer();
%           maxPooling2dLayer(2,'Stride',2);
%           fullyConnectedLayer(256);
%           reluLayer();
%           fullyConnectedLayer(2);
%           softmaxLayer();
%           classificationLayer()];
      
% training options = stochastic gradient descent with momentum
opts = trainingOptions('sgdm');

tic;
% train the network
[net, trainInfo] = trainNetwork(thermaldata_training_imds, layers, opts);
toc;

% testing the accuracy
YTest = classify(net, thermaldata_testing_imds);
accuracy = sum(YTest == testing_categorical_label)/ ...
            numel(testing_categorical_label);