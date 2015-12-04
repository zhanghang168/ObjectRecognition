function []=init()
    run('vlfeat-0.9.20/toolbox/vl_setup')
    if ~exist('bounding_box','dir')
        mkdir('bounding_box');
    end
    if ~exist('sift_features','dir');
        mkdir('sift_features');
    end
    
end