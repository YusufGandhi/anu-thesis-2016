imageWidth = 200;
imageHeight = 200;
inputSize = imageWidth * imageHeight;

middle_frame_channelR_matrix = zeros(inputSize, 620);
middle_frame_channelG_matrix = zeros(inputSize, 620);
middle_frame_channelB_matrix = zeros(inputSize, 620);

for i = 1:620
    middle_frame_channelR_matrix(:,i) = middle_frame_dataset_channelR{i}(:); 
    middle_frame_channelG_matrix(:,i) = middle_frame_dataset_channelG{i}(:);
    middle_frame_channelB_matrix(:,i) = middle_frame_dataset_channelB{i}(:);
end