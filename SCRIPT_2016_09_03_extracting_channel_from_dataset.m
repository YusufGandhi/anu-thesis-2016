middle_frame_dataset_channelR = cell(1,620);
middle_frame_dataset_channelG = cell(1,620);
middle_frame_dataset_channelB = cell(1,620);
for i=1:620
   middle_frame_dataset_channelR{1,i} = middle_frame_dataset{1,i}(:,:,1);
   middle_frame_dataset_channelG{1,i} = middle_frame_dataset{1,i}(:,:,2);
   middle_frame_dataset_channelB{1,i} = middle_frame_dataset{1,i}(:,:,3);
end

hidden_size = 30720; % 10%

auto_encoder_channelR = trainAutoencoder(middle_frame_dataset_channelR,hidden_size, 'useGPU', false);