%% Analize Intracellular

clear all
close all
global Exp
% cd 'D:\Inbal M.Sc\Data PhD\ChAT Data\Extracted Data';
load ChAT_Files
% load Set2-2013-02-13-004  %file 9, laser+galvano headers, zero current: 
% load Set2-2013-01-09-001 Depth 784: header 2 - intracellular, protocol airpuff (puff at 1.3sec), traces 1-29: 1-20: puff only, 21-29: puff+light, No response to airpuff

for fileind = 10 %1:length(files)
    
    fname = files(fileind).extracted_name;        
    path = files(fileind).extracted_path;
    cd(path)
    load(fname) 

cd 'C:\Users\Inbal\Dropbox\Inbal M.Sc\MATLAB\Project Brain States'
%     cd  'D:\Inbal M.Sc\MATLAB\Project Brain States';
    
    color_table = [0 0 1; 0 1 0; 1 0 0; 0 1 1; 1 0 1; 1 1 0; 0 0 0];

    data_laser = [];
    
    for header = 4; %1:length(files(1, fileind).headers);
        
exp_type = Param.header(header).general.exp_type;
exp_type_logical = strcmp('Standby', exp_type);
if exp_type_logical
    switch_type = 2;
else
    switch_type = 2;
end

switch switch_type

    case 2
        
%     header = 2;
%     x_value = 1;
    laser_flag = zeros(1,size(data.header(header).x_value,2));
    for x_value = 1:size(data.header(header).x_value,2)

        raw_data(:,:,x_value) = data.header(header).x_value(x_value).Vm;
        sf = Param.header(1,header).stim.sf;

        dt=1/sf; %[sec]
        time_axis(:,x_value) = (1:size(raw_data,1))*dt;
        sf_airpuff = Param.header(header).stim.sf_airpuff; %[1/sec]
        dt_airpuff = 1/sf_airpuff;
        sf_galvano = Param.header(header).stim.sf_galvano; %[1/sec]
        time_axis_airpuff(:,x_value) = size(data.header(header).x_value(x_value).airpuff,1)*dt_airpuff;    
        airpuff_vec(:,x_value) = data.header(header).x_value(x_value).airpuff(:,1)./...
            max(data.header(header).x_value(x_value).airpuff(:,1));
        dt_galvano = 1/sf_galvano;
        time_axis_galvano = size(data.header(header).x_value(x_value).galvano,1)*dt_galvano;
        sf_laser = Param.header(header).stim.sf_laser; %[1/sec]
        dt_laser = 1/sf_laser;
        time_axis_laser(:,x_value) = (1:size(data.header(header).x_value(x_value).laser,1))*dt_laser; 
        laser_vec(:,x_value) = zeros(length(data.header(header).x_value(x_value).laser(:,1)),1);
        laser_vec(data.header(header).x_value(x_value).laser(:,1) > 2, x_value)=1;   %turning the laser trace into binary
        locations_x_laser = [];
        
        if isempty(find(laser_vec(:,x_value)==1, 1))~=1%isempty(laser_begin(:,x_value))~=1 %condition will be fulfilled if there was laser activation.
            laser_vec_shifted(:,x_value) = laser_vec(2:end,x_value)-laser_vec(1:end-1, x_value);
            laser_begin(:,x_value) = find(laser_vec_shifted(:,x_value)==1); %find the locations where laser pulse starts
            laser_begin(:,x_value) = laser_begin(:,x_value)+1; %correction for the shift
            laser_end(:,x_value) = find(laser_vec_shifted(:,x_value)==-1); %find the locations where laser pulse ends
        
        
            laser_flag(x_value) = 1; %for each x_value: flag=0 for laser off, flag=1 for laser on
            locations_x_laser(1,:) = laser_begin(:,x_value); %arranging the laser begin and end locations in one variable for plotting
            locations_x_laser(2,:) = laser_end(:,x_value);
        end
    end
end
    end
end
    

%% Plotting a raw data trace
header_to_plot = header;
trace_to_plot = 5;
stim_X = locations_x_laser;

[Fig] = fn_Plot_Trace_intracellular(raw_data(:,:,2), header_to_plot, trace_to_plot, dt, dt_laser, stim_X);
