function []=init()
    global SIFT_VECTOR_SIZE;
    global SIFT_VECTOR_NUM;
    SIFT_VECTOR_SIZE=128;
    SIFT_VECTOR_NUM=20;
    run('vlfeat-0.9.20/toolbox/vl_setup')
    addpath('libsvm-3.20/windows')
    if ~exist('bounding_box','dir')
        mkdir('bounding_box');
    end
    if ~exist('sift_features','dir');
        mkdir('sift_features');
    end
end