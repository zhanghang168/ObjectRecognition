function [bounding_boxes]=get_bounding_box_by_class(class_name)
    xml_files=dir(['FinalProject_BBOX\bbox_class',class_name,'\*.xml']);
    bounding_boxes=zeros(size(xml_files,1),4);
    for i=1:size(xml_files)
        [~,file_name,~]=fileparts(xml_files(i).name);
        bounding_boxes(i,1:4)=get_bounding_box_by_file(class_name,file_name);
    end
end