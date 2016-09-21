% converting the cell data to images
for i = 1:620
    filename = sprintf('%03d.png',i);
    imwrite(middle_frame_dataset{1,i}, filename);
end
    