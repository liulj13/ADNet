clear;clc;
benchmarkSeqHome = '/home/liulj/Desktop/Downloads/tracker_benchmark-master/data/';
base_path = benchmarkSeqHome;
%list all sub-folders
contents = dir(base_path);
names = {};
for k = 1:numel(contents)
    name = contents(k).name;
    if isdir([base_path name]) && ~strcmp(name, '.') && ~strcmp(name, '..')
        names{end+1} = name;  
    end
end

for k = 1:numel(names)
    vid_path = [base_path names{k} '/'];
    resultdir = './result';
    if ~exist(resultdir,'dir')
        mkdir(resultdir);
    end
    filename=['result/',names{k},'_ADNet','.mat'];
    saveimgdir = strcat('./result_fig/',names{k});
    if ~exist(saveimgdir,'dir')
        mkdir(saveimgdir);
    end
    if(exist(filename)==0)
        [result, t, p] = adnet_demo(vid_path); 
        results.res  = result;
        results.type  = 'rect';
        results.len = length(result);
        results.annoBegin = 1;
        results.startFrame = 1;
        save(filename,'results');
    end
end


