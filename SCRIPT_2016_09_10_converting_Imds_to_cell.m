% middle_frame_cropped_imds = imageDatastore('./img/cropped_200_by_200/');
% middle_frame_cropped_cell = cell(1,620);

% for i = 1:620
%     fprintf('Processing cell %d...', i);
%     middle_frame_cropped_cell{1,i} = readimage(middle_frame_cropped_imds,i);
%     fprintf('DONE\n');
% end

% using the random training dataset
n = size(thermaldata_training_imds.Files,1);
middle_frame_cropped_cell = cell(1,n);

for i = 1:n
    fprintf('Processing cell %d...', i);
    middle_frame_cropped_cell{1,i} = readimage(thermaldata_training_imds,i);
    fprintf('DONE\n');
end