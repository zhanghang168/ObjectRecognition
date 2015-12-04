function [sift_features]=save_sift_features_by_class(class_name)
    if ~exist('sift_features','dir')
        mkdir('sift_features');
    end
    image_files=dir(['finalProjectData\class',class_name,'\*.JPEG']);
    sift_features=[];
    for i=1:size(image_files)
        [~,file_name,~]=fileparts(image_files(i).name);
        [~,D]=get_sift_features_by_file(class_name,file_name);
        save(['sift_features\',class_name,'_',file_name,'.mat'],'D');
    end
end