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

% building the categoricla label
dataset_categorical_label = categorical(new_dataset_label)';
clearvars -except dataset_categorical_label;

% the first 465 images are set into training
training_categorical_label = dataset_categorical_label(1:465,:);

% the last 155 images are set into testing
testing_categorical_label = dataset_categorical_label(466:620,:);

% building the thermal data imageDatastore object
% this is required since it's the type required by the ConvNets
% change the folder to the correct folder
% 
thermaldata_training_imds = imageDatastore('./img/training');
thermaldata_testing_imds = imageDatastore('./img/testing')

% this is to set the available categorical label to the imds object
% the imds object has a 'label' field for classification purposes
thermaldata_imds.Labels = training_categorical_label;