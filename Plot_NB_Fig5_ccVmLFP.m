%% plotting a figure 

close all
clear all

cd 'D:\Inbal M.Sc\Data PhD\NB-ES Data\Figures\Vm-LFP correlations\LFP filtered 49-51Hz'

%opening saved figures:

%spontaneous:
spont_trace_Off_f46 = open('Vm-LFP_spont_ES_Off_f46_t2.fig');    
spont_trace_Off_f46_ax = get(gcf, 'children');

spont_trace_On_f46 = open('Vm-LFP_spont_ES_On_f46_t2.fig');    
spont_trace_On_f46_ax = get(gcf, 'children');

%evoked
evoked_trace_Off_f46 = open('Vm-LFP_evoked_ES_Off_f46_t3.fig');    
evoked_trace_Off_f46_ax = get(gcf, 'children');

evoked_trace_On_f46 = open('Vm-LFP_evoked_ES_On_f46_t3.fig');    
evoked_trace_On_f46_ax = get(gcf, 'children');

%%
% cross-correlations
%spontaneous:
spont_cc_Off_f46 = open('Vm-LFPcc_spont_f46actual_data.fig');    
spont_cc_Off_f46_ax = get(gcf, 'children');

spont_cc_On_f46 = open('Vm-LFPcc_spont_f46shuffled_data.fig');    
spont_cc_On_f46_ax = get(gcf, 'children');

%evoked
evoked_cc_Off_f46 = open('Vm-LFPcc_evoked_f46actual_data.fig');    
evoked_cc_Off_f46_ax = get(gcf, 'children');

evoked_cc_On_f46 = open('Vm-LFPcc_evoked_f46shuffled_data.fig');    
evoked_cc_On_f46_ax = get(gcf, 'children');

%population parameters:
%actual_data
cc_paired_plot = open('Vm-LFPcc_spont+evoked_max-peak_paired_population.fig');    
cc_paired_plot_ax = get(gcf, 'children');
%shuffled data
cc_paired_plot_shuff = open('Vm-LFPcc_spont+evoked_max-peak_paired_population_shuff.fig');    
cc_paired_plot_shuff_ax = get(gcf, 'children');

%%
%open a new figure:
F = figure;
set(gcf,'color','w');
set(gcf,'DefaultAxesFontSize',18);
set(gcf,'DefaultAxesFontName','arial');
set(gcf, 'PaperType', 'A4');
set(gcf,'PaperUnits','centimeters','PaperPosition',[1.2 1.2 21 29.7]); %[left, bottom, width, height] 
set(gcf,'PaperOrientation','portrait');
set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[0 0 0 0]);
% annotation('textbox', [freq_1_zoom1_pos(1,1) freq_1_zoom1_pos_top 0 0]+[-0.06 0.01 0.04 0.04],...
%            'FitHeightToText', 'on', 'edgecolor', 'none','string', 'A',...
%            'FontName','arial', 'fontsize', 11, 'fontweight', 'bold')
% annotation('textbox', [freq_1_zoom2_pos(1,1) freq_1_zoom2_pos_top 0 0]+[-0.06 0.01 0.04 0.04],...
%            'FitHeightToText', 'on', 'edgecolor', 'none','string', 'B',...
%            'FontName','arial', 'fontsize', 11, 'fontweight', 'bold')    
% annotation('textbox', [freq_2_zoom1_pos(1,1) freq_2_zoom1_pos_top 0 0]+[-0.06 0.01 0.04 0.04],...
%            'FitHeightToText', 'on', 'edgecolor', 'none','string', 'C',...
%            'FontName','arial', 'fontsize', 11, 'fontweight', 'bold')  
%% xlimits, y limits, ticks etc.
 
%% Positions:
spont_trace_Off_f46_pos(1,:) = [0.05 , 0.8 , 0.4 , 0.14];
spont_trace_On_f46_pos(1,:) = [0.05 , 0.6 , 0.4 , 0.14]; spont_trace_On_f46_pos(1,2)=spont_trace_Off_f46_pos(1,2)-spont_trace_Off_f46_pos(1,4)-0.04;
spont_trace_Off_f46_pos_top = spont_trace_Off_f46_pos(1,2)+spont_trace_Off_f46_pos(1,4);
spont_trace_On_f46_pos_top = spont_trace_On_f46_pos(1,2)+spont_trace_On_f46_pos(1,4);

h_dist1=spont_trace_Off_f46_pos(1,1)+spont_trace_Off_f46_pos(1,3)+0.02;
evoked_trace_Off_f46_pos(1,:) = [h_dist1 , spont_trace_Off_f46_pos(1,2) ,  spont_trace_Off_f46_pos(1,3)+0.05 ,  spont_trace_Off_f46_pos(1,4)];
evoked_trace_On_f46_pos(1,:) = [h_dist1, spont_trace_On_f46_pos(1,2) ,  evoked_trace_Off_f46_pos(1,3) ,  spont_trace_Off_f46_pos(1,4)];
evoked_trace_Off_f46_pos_top = evoked_trace_Off_f46_pos(1,2)+evoked_trace_Off_f46_pos(1,4);
evoked_trace_On_f46_pos_top = evoked_trace_On_f46_pos(1,2)+evoked_trace_On_f46_pos(1,4);

spont_cc_Off_f46_pos(1,:) = [0.12 , spont_trace_On_f46_pos(1,2)-spont_trace_On_f46_pos(1,4) , 0.35 , 0.1];
spont_cc_On_f46_pos(1,:) = [0.12 , 0.5 , 0.35 , 0.1]; spont_cc_On_f46_pos(1,2)=spont_cc_Off_f46_pos(1,2)-spont_cc_On_f46_pos(1,4)-0.06;
spont_cc_Off_f46_pos_top = spont_cc_Off_f46_pos(1,2)+spont_cc_Off_f46_pos(1,4);
spont_cc_On_f46_pos_top = spont_cc_On_f46_pos(1,2)+spont_cc_On_f46_pos(1,4);

h_dist2=spont_cc_Off_f46_pos(1,1)+spont_cc_Off_f46_pos(1,3)+0.1;
evoked_cc_Off_f46_pos(1,:) = [h_dist2 , spont_cc_Off_f46_pos(1,2) ,  spont_cc_Off_f46_pos(1,3) ,  spont_cc_Off_f46_pos(1,4)];
evoked_cc_On_f46_pos(1,:) = [h_dist2 , spont_cc_On_f46_pos(1,2) , evoked_cc_Off_f46_pos(1,3) ,  spont_cc_On_f46_pos(1,4)];
evoked_cc_Off_f46_pos_top = evoked_cc_Off_f46_pos(1,2)+evoked_cc_Off_f46_pos(1,4);
evoked_cc_On_f46_pos_top = evoked_cc_On_f46_pos(1,2)+evoked_cc_On_f46_pos(1,4);

cc_paired_plot_pos(1,:) = [h_dist2 , 0.04 , 0.35 , 0.17];  
cc_paired_plot_pos_top = cc_paired_plot_pos(1,2)+cc_paired_plot_pos(1,4);
cc_paired_plot_shuff_pos(1,:) = [spont_cc_Off_f46_pos(1,1) , 0.04 , 0.35 , 0.17];
cc_paired_plot_shuff_pos_top = cc_paired_plot_shuff_pos(1,2)+cc_paired_plot_shuff_pos(1,4);

%%
%Placing plots in the figure:
%Cell 46 - spont
spont_trace_Off_f46_ax_copy(1) = copyobj(spont_trace_Off_f46_ax(2),F); % copy axes to new fig
set(spont_trace_Off_f46_ax_copy(1),'position',spont_trace_Off_f46_pos(1,:))
   %    'fontname', 'arial','fontsize',13,'linewidth',1.5, 'ylim', y1limits(1,:),'ytick', y1ticks(1,:));

spont_trace_On_f46_ax_copy(1) = copyobj(spont_trace_On_f46_ax(2),F); % copy axes to new fig
set(spont_trace_On_f46_ax_copy(1),'position',spont_trace_On_f46_pos(1,:))
      
%    l=legend('Vm','LFP'); set(l,'box','off'), set(l,'FontSize', 8) ; set(l,'linewidth',1.5);set(l,'position',[0.73 0.89 0.03 0.03]);

   %Cell 46 evoked
   evoked_trace_Off_f46_ax_copy = copyobj(evoked_trace_Off_f46_ax,F); % copy axes to new fig
set(evoked_trace_Off_f46_ax_copy(2),'position',evoked_trace_Off_f46_pos(1,:))
%position legend:
a=evoked_trace_Off_f46_ax_copy(1).Position;
set(evoked_trace_Off_f46_ax_copy(1),'position',[0.88 evoked_trace_Off_f46_pos_top-0.025 0.08 0.05])
evoked_trace_Off_f46_ax_copy(1).FontSize=11;
evoked_trace_Off_f46_ax_copy(1).LineWidth=1.5;  
%   
evoked_trace_On_f46_ax_copy = copyobj(evoked_trace_On_f46_ax,F); % copy axes to new fig
set(evoked_trace_On_f46_ax_copy(2),'position',evoked_trace_On_f46_pos(1,:))
%position legend
set(evoked_trace_On_f46_ax_copy(1),'position',[0.88 evoked_trace_On_f46_pos_top-0.025 0.08 0.05]) 
evoked_trace_On_f46_ax_copy(1).FontSize=11;
evoked_trace_On_f46_ax_copy(1).LineWidth=1.5;  
 %%
 %Spontaneous Cross-correlations file 46 actual data+shuffled data
spont_cc_Off_f46_ax_copy(1) = copyobj(spont_cc_Off_f46_ax(2),F); % copy axes to new fig
set(spont_cc_Off_f46_ax_copy(1),'position',spont_cc_Off_f46_pos(1,:), 'xticklabel',[])
    set(F, 'currentaxes', spont_cc_Off_f46_ax_copy(1));  xl=xlabel('');  
spont_cc_Off_f46_ax_copy(1).FontSize=12;    
 
spont_cc_On_f46_ax_copy(1) = copyobj(spont_cc_On_f46_ax(2),F); % copy axes to new fig
set(spont_cc_On_f46_ax_copy(1),'position',spont_cc_On_f46_pos(1,:))
spont_cc_On_f46_ax_copy(1).FontSize=12;
   
%   set(F, 'currentaxes', spont_trace_On_f33_ax_copy); t=title('NB+'); yl=ylabel(''); xl=xlabel('');
%    l=legend('Vm','LFP'); set(l,'box','off'), set(l,'FontSize', 8) ; set(l,'linewidth',1.5);set(l,'position',[0.73 0.89 0.03 0.03]);

%Evoked Cross-correlations file 46 actual data+shuffled data
evoked_cc_Off_f46_ax_copy = copyobj(evoked_cc_Off_f46_ax,F); % copy axes to new fig
set(evoked_cc_Off_f46_ax_copy(2),'position',evoked_cc_Off_f46_pos(1,:),'xticklabel',[])
set(F, 'currentaxes', evoked_cc_Off_f46_ax_copy(2)); yl=ylabel(''); xl=xlabel('');  
evoked_cc_Off_f46_ax_copy(2).FontSize=12;
%position legend:
set(evoked_cc_Off_f46_ax_copy(1),'position',[0.88 evoked_cc_Off_f46_pos_top-0.03 0.08 0.05]) 
evoked_cc_Off_f46_ax_copy(1).FontSize=11;
evoked_cc_Off_f46_ax_copy(1).LineWidth=1.5;

evoked_cc_On_f46_ax_copy = copyobj(evoked_cc_On_f46_ax,F); % copy axes to new fig
set(evoked_cc_On_f46_ax_copy(2),'position',evoked_cc_On_f46_pos(1,:))
   set(F, 'currentaxes', evoked_cc_On_f46_ax_copy(2)); yl=ylabel(''); 
   evoked_cc_On_f46_ax_copy(2).FontSize=12;
   %position legend
 set(evoked_cc_On_f46_ax_copy(1),'position',[0.84 evoked_cc_On_f46_pos_top-0.03 0.08 0.05]) 
evoked_cc_On_f46_ax_copy(1).FontSize=11;
evoked_cc_On_f46_ax_copy(1).LineWidth=1.5;

%   annotation:
annotation('textbox', [spont_trace_Off_f46_pos(1,1) spont_trace_Off_f46_pos_top 0 0]+[0.1 0 0.5 0.05],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'Spontaneous Activity', 'FontName','arial', 'fontsize', 14, 'fontweight', 'bold')
annotation('textbox', [evoked_trace_Off_f46_pos(1,1) evoked_trace_Off_f46_pos_top 0 0]+[0.12 0 0.5 0.05],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'Sensory-evoked Responses', 'FontName','arial', 'fontsize', 14, 'fontweight', 'bold')
 
 a_pos1=[0.03 -0.01 0.04 0.04];
 a_pos2=[0.06 -0.01 0.04 0.04];
 a_pos3=[-0.04 -0.01 0.04 0.04];
 a_pos4=[-0.04 0.01 0.04 0.04];
annotation('textbox', [spont_trace_Off_f46_pos(1,1) spont_trace_Off_f46_pos_top 0 0]+a_pos1,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'A', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
 annotation('textbox', [spont_trace_On_f46_pos(1,1) spont_trace_On_f46_pos_top 0 0]+a_pos1,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'B', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
 annotation('textbox', [evoked_trace_Off_f46_pos(1,1) evoked_trace_Off_f46_pos_top 0 0]+a_pos2,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'C', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
 annotation('textbox', [evoked_trace_On_f46_pos(1,1) evoked_trace_On_f46_pos_top 0 0]+a_pos2,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'D', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
 annotation('textbox', [spont_cc_Off_f46_pos(1,1) spont_cc_Off_f46_pos_top 0 0]+a_pos3,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'E', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
 annotation('textbox', [spont_cc_On_f46_pos(1,1) spont_cc_On_f46_pos_top 0 0]+a_pos4,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'F', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
 annotation('textbox', [evoked_cc_Off_f46_pos(1,1) evoked_cc_Off_f46_pos_top 0 0]+a_pos3,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'G', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
 annotation('textbox', [evoked_cc_On_f46_pos(1,1) evoked_cc_On_f46_pos_top 0 0]+a_pos4,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'H', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
  annotation('textbox', [cc_paired_plot_shuff_pos(1,1) cc_paired_plot_shuff_pos_top 0 0]+a_pos4,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'I', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
  annotation('textbox', [cc_paired_plot_pos(1,1) cc_paired_plot_pos_top 0 0]+a_pos4,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'J', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')

 annotation('textbox', [spont_trace_Off_f46_pos(1,1) spont_trace_Off_f46_pos_top 0 0]+[0.08 -0.02 0.1 0.04],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'NB-', 'FontName','arial', 'fontsize', 12, 'color', [0 0 153]/256)
 annotation('textbox', [spont_trace_On_f46_pos(1,1) spont_trace_On_f46_pos_top 0 0]+[0.08 -0.02 0.1 0.04],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'NB+', 'FontName','arial', 'fontsize', 12, 'color', [0 0 153]/256)
 
 annotation('textbox', [cc_paired_plot_pos(1,1) cc_paired_plot_pos_top 0 0]+[0.02 0.0 0.2 0.04],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'Noise Correlations', 'FontName','arial', 'fontsize', 12,'color', [0 0 153]/256)
  annotation('textbox', [cc_paired_plot_shuff_pos(1,1) cc_paired_plot_shuff_pos_top 0 0]+[0.02 0.0 0.2 0.04],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'Signal correlations', 'FontName','arial', 'fontsize', 12,'color', [0 0 153]/256)
%% 
 %cc population paired plots
cc_paired_plot_ax_copy = copyobj(cc_paired_plot_ax,F); % copy axes to new fig
set(cc_paired_plot_ax_copy,'position',cc_paired_plot_pos(1,:))
cc_paired_plot_ax_copy.FontSize=14;

cc_paired_plot_shuff_ax_copy = copyobj(cc_paired_plot_shuff_ax,F); % copy axes to new fig
set(cc_paired_plot_shuff_ax_copy,'position',cc_paired_plot_shuff_pos(1,:))
cc_paired_plot_shuff_ax_copy.FontSize=14;
    %   'fontname', 'arial','fontsize',13,'linewidth',1.5,'box','off'); %, 'ylim', y6limits,'ytick', y6ticks,'xlim',x6limits,'xtick',x6ticks, 'xticklabel',x6ticklab);
%  set(F, 'currentaxes', Response_modulation_ax_copy); t=title(''); yl=ylabel('Spikes/Stim. train','fontsize',13);

cd 'D:\Inbal M.Sc\Data PhD\NB-ES Data\Figures\Paper Figures'
filename='Fig 5 ccVmLFP';
saveas(F,'Fig 5 ccVmLFP.fig'); 
print(F,filename,'-dpng','-r600','-opengl') 
print(F, '-depsc2', filename);
