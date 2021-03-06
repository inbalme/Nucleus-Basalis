%% Plotting a single trace
%stim_X is a two-row matrix, row 1:locations of laser pulse begin, row 2:
%locations of laser pulse end.
%if raw_data is a matrix, each column will be plotted separately on the
%same axes.
%F is the handle of the figure
%obj is the handle of the plotted traces, without the plot of the stimulus

function [F,obj] = fn_Plot_Trace(raw_data, header_to_plot, trace_to_plot,dt_data, dt_stim, stim_X);

global Exp

% cd 'C:\Users\inbalme\Dropbox\Inbal M.Sc\MATLAB\Project Brain States'
% cd 'D:\Inbal M.Sc\MATLAB\Project Brain States'

max_time_axis = ceil(size(raw_data,1).*dt_data);
max_data = max(max(raw_data(:,trace_to_plot)));
min_data = min(min(raw_data(:,trace_to_plot)));
five_percent = (max_data-min_data).*0.05;
min_data_wide = min_data-2.*five_percent;
max_data_wide = max_data+2.*five_percent;

 x1limits = [0 max_time_axis];
 x1ticks = [0 0.5.*max_time_axis max_time_axis];
 if abs(min_data_wide) < 1
     min_data_wide = (floor(min_data_wide.*10))./10;
 else
     min_data_wide = floor(min_data_wide);
 end
 if abs(max_data_wide) < 1 
      max_data_wide = (ceil(max_data_wide.*10))./10;
 else
      max_data_wide = ceil(max_data_wide);
 end
 
 if abs(min_data_wide) > 10
     min_data_wide = (floor(min_data_wide./10)).*10;
 else
     min_data_wide = floor(min_data_wide);
 end
 if abs(max_data_wide) > 1 
      max_data_wide = (ceil(max_data_wide./10)).*10;
 else
      max_data_wide = ceil(max_data_wide);
 end
 
 y1limits = [min_data_wide max_data_wide]; %[-0.3 0.5]; [0.5 1.5]
 y1ticks =  [min_data_wide:10:max_data_wide]; %[-0.3 0 0.5]; %y1limits; [0.5 1 1.5]

     color_table = [0 0 1; 1 0 0; 0 1 0; 0 1 1; 1 0 1; 1 1 0; 0 0 0];
     if trace_to_plot > size(color_table,1)
         color_table = rand(trace_to_plot,3);
     end
     
F=figure;

% axes('position', position_trace);
        set( gca, 'xlim', x1limits, 'ylim', y1limits,'xtick', x1ticks,'ytick', y1ticks,...
        'XMinorTick','on','ticklength', [0.010 0.010],...
        'fontname', 'helvetica', 'fontweight', 'bold', 'box', 'off' );
        xlabel('Time [sec]' ,'FontSize', 12);
        ylabel('Vm [mV]', 'FontSize', 12);
        

hold on
for i = 1:length(trace_to_plot);
    obj(i)=plot((1:size(raw_data,1)).*dt_data,raw_data(:,trace_to_plot(i)), 'LineWidth',0.5,'color', [0 0 0]); %color_table(i,:));
end
if nargin == 6
    stim_Y = ones(size(stim_X)).*(max_data+five_percent); 
    line(stim_X.*dt_stim,stim_Y,'LineWidth',6,'Color','b')
end
hold off