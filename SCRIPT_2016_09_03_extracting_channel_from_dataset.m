middle_frame_dataset_channelR = cell(1,620);
% middle_frame_dataset_channelG = cell(1,620);
% middle_frame_dataset_channelB = cell(1,620);
for i=1:620
    middle_frame_dataset_channelR{1,i} = middle_frame_cropped_cell{1,i}(:,:,1);
%     middle_frame_dataset_channelG{1,i} = middle_frame_cropped_cell{1,i}(:,:,2);
%     middle_frame_dataset_channelB{1,i} = middle_frame_cropped_cell{1,i}(:,:,3);
% 
% 
% %    middle_frame_dataset_channelR{1,i} = middle_frame_dataset{1,i}(:,:,1);
% %    middle_frame_dataset_channelG{1,i} = middle_frame_dataset{1,i}(:,:,2);
% %    middle_frame_dataset_channelB{1,i} = middle_frame_dataset{1,i}(:,:,3);
end
% % 
% % 
% % 
hidden_size = 4000; %30720; % 10%
fprintf('Training autoencoder R...');
autoencoder_1stlayer_channelR_4000 = trainAutoencoder(middle_frame_dataset_channelB,hidden_size);
fprintf('DONE\n');
% % 
% % % training the 2nd layer of autoencoder
% feat1_R = encode(auto_encoder_channelR, middle_frame_dataset_channelR);
% feat1_G = encode(auto_encoder_channelG, middle_frame_dataset_channelG);
% feat1_B = encode(auto_encoder_channelB, middle_frame_dataset_channelB);
% % % autoEncoder_channelB_second_layer_400 = trainAutoencoder(feat1_B, 400);
% % 
% % % training the 3rd layer of autoencoder
% feat2_R = encode(autoEncoder_channelR_second_layer_400, feat1_R);
% feat2_G = encode(autoEncoder_channelG_second_layer_400, feat1_G);
% feat2_B = encode(autoEncoder_channelB_second_layer_400, feat1_B);
% % 
% autoencoder_channel_R_third_layer_40 = trainAutoencoder(feat2_R, 40);
% autoencoder_channel_G_third_layer_40 = trainAutoencoder(feat2_G, 40);
% autoencoder_channel_B_third_layer_40 = trainAutoencoder(feat2_B, 40);
% 
% feat3_R = encode(autoencoder_channel_R_third_layer_40, feat2_R);
% feat3_G = encode(autoencoder_channel_G_third_layer_40, feat2_G);
% feat3_B = encode(autoencoder_channel_B_third_layer_40, feat2_B);
% 
% autoencoder_channel_R_fourth_layer_10 = trainAutoencoder(feat3_R, 10);
% autoencoder_channel_G_fourth_layer_10 = trainAutoencoder(feat3_G, 10);
% autoencoder_channel_B_fourth_layer_10 = trainAutoencoder(feat3_B, 10);
% 
% feat4_R = encode(autoencoder_channel_R_fourth_layer_10, feat3_R);
% feat4_G = encode(autoencoder_channel_G_fourth_layer_10, feat3_G);
% feat4_B = encode(autoencoder_channel_B_fourth_layer_10, feat3_B);

% training softmax layer red
% softnet_R = trainSoftmaxLayer(feat4_R, dataset_categorical_label_softmax);
% softnet_G = trainSoftmaxLayer(feat4_G, dataset_categorical_label_softmax);
% softnet_B = trainSoftmaxLayer(feat4_B, dataset_categorical_label_softmax);
