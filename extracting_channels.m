new_dataset_50percent = cell(1,620);
new_dataset_25percent = cell(1,620);

for i = 1:620
    new_dataset_50percent{1,i} = imresize(new_dataset{1,i},0.5);
    new_dataset_25percent{1,i} = imresize(new_dataset{1,i},0.25);
end

channel_R_dataset50 = cell(1,620);
channel_G_dataset50 = cell(1,620);
channel_B_dataset50 = cell(1,620);

channel_R_dataset25 = cell(1,620);
channel_G_dataset25 = cell(1,620);
channel_B_dataset25 = cell(1,620);


for i=1:620
    channel_R_dataset50{1,i} = new_dataset_50percent{1,i}(:,:,1);
    channel_G_dataset50{1,i} = new_dataset_50percent{1,i}(:,:,2);
    channel_B_dataset50{1,i} = new_dataset_50percent{1,i}(:,:,3);
    
    channel_R_dataset25{1,i} = new_dataset_25percent{1,i}(:,:,1);
    channel_G_dataset25{1,i} = new_dataset_25percent{1,i}(:,:,2);
    channel_B_dataset25{1,i} = new_dataset_25percent{1,i}(:,:,3);

end
