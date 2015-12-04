function [labels,sift_features]=get_sift_features_by_test_classes(test_classes)
    global SIFT_VECTOR_SIZE;
    global SIFT_VECTOR_NUM;
    data_size=0;
    for i=1:size(test_classes,2)
        class_name=char(test_classes(i));
        image_files=dir(['finalProjectData\class',class_name,'\*.JPEG']);
        data_size=data_size+size(image_files,1);
    end
    sift_features=zeros(data_size,SIFT_VECTOR_NUM*SIFT_VECTOR_SIZE);
    labels=zeros(data_size,1);
    data_fill=0;
    for i=1:size(test_classes,2)
        class_name=char(test_classes(i));
        class_sift_features=get_sift_features_by_class(class_name);
        st=data_fill+1;
        ed=data_fill+size(class_sift_features,1);
        sift_features(st:ed,:)=class_sift_features;
        labels(st:ed,1)=i;
        data_fill=data_fill+size(class_sift_features,1);
    end
end