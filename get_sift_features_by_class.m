function [sift_features]=get_sift_features_by_class(class_name)
    global SIFT_VECTOR_SIZE;
    global SIFT_VECTOR_NUM;
    image_files=dir(['finalProjectData\class',class_name,'\*.JPEG']);
    sift_features=zeros(size(image_files,1),SIFT_VECTOR_NUM*SIFT_VECTOR_SIZE);
    for j=1:size(image_files)
        [~,file_name,~]=fileparts(image_files(j).name);
        [~,D]=get_sift_features_by_file(class_name,file_name);
        if size(D,2)>SIFT_VECTOR_NUM
            DD=D(:,1:SIFT_VECTOR_NUM);
        else
            DD=[D,zeros(size(D,1),SIFT_VECTOR_NUM-size(D,2))];
        end
        sift_features(j,:)=DD(:)';
    end
end