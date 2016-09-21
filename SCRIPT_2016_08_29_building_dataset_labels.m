% ===============
% LABEL: 0 = Calm; 1 = Stressful
% ===============
% the labels of the video based on Ramin's documents
% each row is the label for each segment of the video
% there are 20 segments in total
type1_label = [
1
1
1
0
0
0
0
1
0
1
1
1
0
1
0
1
0
1
0
0
];

% the labels for type 2 video's semgents
% each row is the label for each segment
% there are 20 segments in total
type2_label = [
1
1
1
0
0
0
1
0
1
0
0
0
1
0
1
0
1
0
1
1
];

% transposing the vectors
type2_label_row = type2_label';
type1_label_row = type1_label';

% the type of videos for each subject
% Subject   |   Type
% ------------------
%       1   |      1
%       2   |      1
%       3   |      2
%       4   |      1
%       5   |      1
%       6   |      2
%       7   |      2
%       8   |      2
%       9   |      1
%      10   |      1
%      11   |      1
%      12   |      1
%      13   |      2
%      14   |      1
%      15   |      2
%      16   |      1
%      17   |      2
%      18   |      2
%      19   |      2
%      20   |      2
%      21   |      2
%      22   |      1
%      23   |      2
%      24   |      1
%      25   |      2
%      26   |      2
%      27   |      1
%      28   |      2
%      29   |      1
%      30   |      1
%      31   |      1


% building the label
% the new dataset images is sorted on the order of the subject in an ascending order (from 1 - 31)
% each subject is comprised of 20 segments
new_dataset_label = [type1_label_row type1_label_row]; % subject 1 
new_dataset_label = [new_dataset_label type2_label_row];
new_dataset_label = [new_dataset_label type1_label_row type1_label_row];
new_dataset_label = [new_dataset_label type2_label_row type2_label_row type2_label_row type1_label_row type1_label_row];
new_dataset_label = [new_dataset_label type1_label_row type1_label_row type2_label_row type1_label_row type2_label_row];
new_dataset_label = [new_dataset_label type1_label_row type2_label_row type2_label_row type2_label_row type2_label_row];
new_dataset_label = [new_dataset_label type2_label_row type1_label_row type2_label_row type1_label_row type2_label_row];
new_dataset_label = [new_dataset_label type2_label_row type1_label_row type2_label_row type1_label_row type1_label_row type1_label_row];

% building the categorical label
dataset_categorical_label = categorical(new_dataset_label)';
% clearvars -except dataset_categorical_label;

% [UPDATE 2016-09-20]
% Try to use only 1 imageDatastore 
thermaldata_cropped_200_by_200_imds = imageDatastore('./img/cropped_200_by_200/');
thermaldata_cropped_200_by_200_imds.Labels = dataset_categorical_label;

% random image data store
random_ds = shuffle(thermaldata_cropped_200_by_200_imds);

% partition the random imageDatastore into half and take the first half
thermaldata_training_imds = partition(random_ds, 2, 1);

% partition the random imageDatastore into four quarters and take the third
% quarter
three_fourth_shuffle_subds = partition(random_ds, 4, 3);

% append the third quarter partition to the actual training dataset
% and also the labesl
thermaldata_training_imds.Files(311:465) = three_fourth_shuffle_subds.Files;
thermaldata_training_imds.Labels(311:465) = three_fourth_shuffle_subds.Labels;

% the testing datastore
thermaldata_testing_imds = partition(random_ds, 4, 4);

% the first 465 images are set into training
% training_categorical_label = dataset_categorical_label(1:465,:);

% the last 155 images are set into testing
% testing_categorical_label = dataset_categorical_label(466:620,:);

% building the thermal data imageDatastore object
% this is required since it's the type required by the ConvNets
% change the folder to the correct folder
% [IMPORTANT] : change the folder to the correct path
% thermaldata_training_imds = imageDatastore('./img/100percent/training');
% thermaldata_testing_imds = imageDatastore('./img/100percent/testing');

% this is to set the available categorical label to the imds object
% the imds object has a 'label' field for classification purposes

% ===== UPDATE 2016-09-21 ======
% categorical label for softmax layer
% needed for train the deepnet autoencoders + softmax
% dataset_categorical_label_softmax = zeros(2, 620);
% 
% for i=1:620
%     if new_dataset_label(1,i) == 1
%         fprintf('Label 1 (stressful)\n');
%         dataset_categorical_label_softmax(2, i) = 1;
%     else
%         fprintf('Label 0 (calm)\n');
%         dataset_categorical_label_softmax(1, i) = 1;
%     end
% end
% ====== END OF UPDATE ======

% the first 465 images are set into training
% training_categorical_label = dataset_categorical_label(1:465,:);
% 
% % the last 155 images are set into testing
% testing_categorical_label = dataset_categorical_label(466:620,:);
% 
% % building the thermal data imageDatastore object
% % this is required since it's the type required by the ConvNets
% % change the folder to the correct folder
% % [IMPORTANT] : change the folder to the correct path
% thermaldata_training_imds = imageDatastore('./img/100percent/training');
% thermaldata_testing_imds = imageDatastore('./img/100percent/testing');
% 
% % this is to set the available categorical label to the imds object
% % the imds object has a 'label' field for classification purposes

% thermaldata_training_imds.Labels = training_categorical_label;
% thermaldata_testing_imds.Labels = testing_categorical_label;