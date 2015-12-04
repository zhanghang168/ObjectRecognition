function [bounding_box]=get_bounding_box_by_file(class_name,file_name)
    if exist(['bounding_box\',class_name,'_',file_name,'.mat'],'file')
        load(['bounding_box\',class_name,'_',file_name,'.mat'],'bounding_box');
    else
        xml_doc = xmlread(['FinalProject_BBOX\bbox_class',class_name,'\',file_name,'.xml']);
        xml_xmin = xml_doc.getElementsByTagName('xmin');
        xmin=str2double(xml_xmin.item(0).getFirstChild.getData);
        xml_xmax = xml_doc.getElementsByTagName('xmax');
        xmax=str2double(xml_xmax.item(0).getFirstChild.getData);
        xml_ymax = xml_doc.getElementsByTagName('ymax');
        ymax=str2double(xml_ymax.item(0).getFirstChild.getData);
        xml_ymin = xml_doc.getElementsByTagName('ymin');
        ymin=str2double(xml_ymin.item(0).getFirstChild.getData);
        bounding_box=[xmin xmax ymin ymax];
        save(['bounding_box\',class_name,'_',file_name,'.mat'],'bounding_box');
    end
end