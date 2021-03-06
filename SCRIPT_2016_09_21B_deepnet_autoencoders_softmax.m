% training softmax layer for channel R
softnet_R_input_4000 = trainSoftmaxLayer( ...
    feat2_R, dataset_categorical_label_softmax);
deepnet_R2 = stack(auto_encoder_channelR, ...
    autoEncoder_channelR_second_layer_400, ...
    softnet_R_input_4000);
Y_R = deepnet_R2(middle_frame_channelR_matrix);

% training softmax layer for channel G
% softnet_G_input_4000 = trainSoftmaxLayer( ...
%     feat2_G, dataset_categorical_label_softmax);
% deepnet_G2 = stack(auto_encoder_channelG, ...
%     autoEncoder_channelG_second_layer_400, ...
%     softnet_G_input_4000);
% Y_G = deepnet_G2(middle_frame_channelG_matrix);
% % plotconfusion(dataset_categorical_label_softmax,Y_G);
% 
% % training softmax layer for channel B
% softnet_B_input_4000 = trainSoftmaxLayer( ...
%     feat2_B, dataset_categorical_label_softmax);
% deepnet_B2 = stack(auto_encoder_channelB, ...
%     autoEncoder_channelB_second_layer_400, ...
%     softnet_B_input_4000);
% Y_B = deepnet_B2(middle_frame_channelB_matrix);
% plotconfusion(dataset_categorical_label_softmax,Y_B);

Y_all = result_by_majority_vote(Y_R, Y_G, Y_B);