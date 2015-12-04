function []=clear_cache()
    delete('bounding_box/*.mat');
    delete('sift_features/*.mat');
end