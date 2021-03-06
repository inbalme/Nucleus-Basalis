%% plotting a figure 

close all
clear all

%opening saved figures:
%Long traces:
cd 'D:\Inbal M.Sc\Data PhD\NB-ES Data\Figures\Traces+std+mean+summary\Long Trace'
%spontaneous:
spont_trace_f16 = open('f16_traces_x1_v2.fig');    
spont_trace_f16_ax = get(gcf, 'children');

spont_mean_f16 = open('f16_mean_x1_v2.fig');    
spont_mean_f16_ax = get(gcf, 'children');

spont_std_f16 = open('f16_std_x1_mean-subt_v2.fig');    
spont_std_f16_ax = get(gcf, 'children');

%evoked

evoked_trace_Off_f16 = open('f16_traces_x2_v2.fig');    
evoked_trace_Off_f16_ax = get(gcf, 'children');

evoked_trace_On_f16 = open('f16_traces_x3_v2.fig');    
evoked_trace_On_f16_ax = get(gcf, 'children');

evoked_mean_f16 = open('f16_mean_x2+3_v2.fig');    
evoked_mean_f16_ax = get(gcf, 'children');

evoked_std_f16 = open('f16_std_x2+3_mean-subt_v2.fig');    
evoked_std_f16_ax = get(gcf, 'children');

%%
%Short traces:
cd 'D:\Inbal M.Sc\Data PhD\NB-ES Data\Figures\Traces+std+mean+summary\Zoom-in Trace'

%evoked
evoked_trace_Off_f16_zoom = open('f16_traces_x2_v2.fig');    
evoked_trace_Off_f16_zoom_ax = get(gcf, 'children');

evoked_trace_On_f16_zoom = open('f16_traces_x3_v2.fig');    
evoked_trace_On_f16_zoom_ax = get(gcf, 'children');

evoked_mean_f16_zoom = open('f16_mean_x2+3_v2.fig');    
evoked_mean_f16_zoom_ax = get(gcf, 'children');

evoked_std_f16_zoom = open('f16_std_x2+3_mean-subt_v2.fig');    
evoked_std_f16_zoom_ax = get(gcf, 'children');

cd 'D:\Inbal M.Sc\Data PhD\NB-ES Data\Figures\Traces+std+mean+summary\10_20Hz'

VmM = open('Vm M_Before During After Sensory stim_v2.fig');    
VmM_ax = get(gcf, 'children');

VmSTD = open('Vm STD_Before During After Sensory stim_v2.fig');    
VmSTD_ax = get(gcf, 'children');

Peak_amp = open('Train Amplitude Local_v2.fig');    
Peak_amp_ax = get(gcf, 'children');

SNR = open('SNR1_v2.fig');    
SNR_ax = get(gcf, 'children');

Amplitude_Signal = open('Amplitude_Signal_v2.fig');    
Amplitude_Signal_ax = get(gcf, 'children');

Amplitude_Noise = open('Amplitude_Noise1_v2.fig');    
Amplitude_Noise_ax = get(gcf, 'children');




%%
%open a new figure:
F = figure;
set(gcf,'color','w');
set(gcf,'DefaultAxesFontSize',18);
set(gcf,'DefaultAxesFontName','arial');
set(gcf, 'PaperType', 'A4');
set(gcf,'PaperUnits','centimeters','PaperPosition',[1.2 1.2 29 29.7]); %[left, bottom, width, height] 
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
spont_trace_f16_pos(1,:) = [0.05 , 0.79 , 0.2 , 0.13];
h_dist1=spont_trace_f16_pos(1,1)+spont_trace_f16_pos(1,3)+0.03;
spont_mean_f16_pos(1,:) = [h_dist1 , spont_trace_f16_pos(1,2) ,  spont_trace_f16_pos(1,3) ,  spont_trace_f16_pos(1,4)];
h_dist2=spont_mean_f16_pos(1,1)+spont_mean_f16_pos(1,3)+0.03;
spont_std_f16_pos(1,:) =[h_dist2 , spont_mean_f16_pos(1,2) ,  spont_mean_f16_pos(1,3) ,  spont_mean_f16_pos(1,4)];
    
v_dist=0.05;
evoked_trace_Off_f16_pos(1,:) = [spont_trace_f16_pos(1,1)-0.01 , spont_trace_f16_pos(1,2)-spont_trace_f16_pos(1,4)-0.08 ,  0.25 ,  spont_trace_f16_pos(1,4)];
evoked_trace_On_f16_pos(1,:) = [evoked_trace_Off_f16_pos(1,1), evoked_trace_Off_f16_pos(1,2)-evoked_trace_Off_f16_pos(1,4)-v_dist, evoked_trace_Off_f16_pos(1,3), evoked_trace_Off_f16_pos(1,4)];
evoked_mean_f16_pos(1,:) = [evoked_trace_Off_f16_pos(1,1), evoked_trace_On_f16_pos(1,2)-evoked_trace_On_f16_pos(1,4)-v_dist, evoked_trace_Off_f16_pos(1,3), evoked_trace_Off_f16_pos(1,4)];
evoked_std_f16_pos(1,:) = [evoked_trace_Off_f16_pos(1,1), evoked_mean_f16_pos(1,2)-evoked_mean_f16_pos(1,4)-v_dist, evoked_trace_Off_f16_pos(1,3), evoked_trace_Off_f16_pos(1,4)];

h_dist3=evoked_trace_Off_f16_pos(1,1)+evoked_trace_Off_f16_pos(1,3)+0.02;

evoked_trace_Off_f16_zoom_pos(1,:) = [h_dist3, evoked_trace_Off_f16_pos(1,2) ,  0.4 ,  evoked_trace_Off_f16_pos(1,4)];
evoked_trace_On_f16_zoom_pos(1,:) = [h_dist3, evoked_trace_On_f16_pos(1,2) ,  0.4 ,  evoked_trace_Off_f16_pos(1,4)];
evoked_mean_f16_zoom_pos(1,:) = [h_dist3, evoked_mean_f16_pos(1,2) ,  0.4 ,  evoked_trace_Off_f16_pos(1,4)];
evoked_std_f16_zoom_pos(1,:) = [h_dist3, evoked_std_f16_pos(1,2) ,  0.4 ,  evoked_trace_Off_f16_pos(1,4)];

h_dist4=evoked_std_f16_zoom_pos(1,1)+evoked_std_f16_zoom_pos(1,3)+0.08;
v_dist2=0.03;
VmM_pos(1,:)=[h_dist4, spont_trace_f16_pos(1,2)+0.02, 0.14, 0.12];
VmSTD_pos(1,:)= VmM_pos; VmSTD_pos(1,2)=VmM_pos(1,2)-VmM_pos(1,4)-0.02;
Peak_amp_pos(1,:)=VmSTD_pos; Peak_amp_pos(1,2)=VmSTD_pos(1,2)-VmSTD_pos(1,4)-0.06;
SNR_pos(1,:)=Peak_amp_pos; SNR_pos(1,2)=Peak_amp_pos(1,2)-Peak_amp_pos(1,4)-0.04;
Amplitude_Signal_pos(1,:)=SNR_pos; Amplitude_Signal_pos(1,2)=SNR_pos(1,2)-SNR_pos(1,4)-0.02;
Amplitude_Noise_pos(1,:)=Amplitude_Signal_pos; Amplitude_Noise_pos(1,2)=Amplitude_Signal_pos(1,2)-Amplitude_Signal_pos(1,4)-0.02;

%position of top of each panel
spont_trace_f16_pos_top = spont_trace_f16_pos(1,2)+spont_trace_f16_pos(1,4);
spont_mean_f16_pos_top = spont_mean_f16_pos(1,2)+spont_mean_f16_pos(1,4);
spont_std_f16_pos_top = spont_std_f16_pos(1,2)+spont_std_f16_pos(1,4);
evoked_trace_Off_f16_pos_top = evoked_trace_Off_f16_pos(1,2)+evoked_trace_Off_f16_pos(1,4);
evoked_trace_On_f16_pos_top = evoked_trace_On_f16_pos(1,2)+evoked_trace_On_f16_pos(1,4);
evoked_mean_f16_pos_top = evoked_mean_f16_pos(1,2)+evoked_mean_f16_pos(1,4);
evoked_std_f16_pos_top = evoked_std_f16_pos(1,2)+evoked_std_f16_pos(1,4);
evoked_trace_Off_f16_zoom_pos_top = evoked_trace_Off_f16_zoom_pos(1,2)+evoked_trace_Off_f16_zoom_pos(1,4);
evoked_trace_On_f16_zoom_pos_top = evoked_trace_On_f16_zoom_pos(1,2)+evoked_trace_On_f16_zoom_pos(1,4);
evoked_mean_f16_zoom_pos_top = evoked_mean_f16_zoom_pos(1,2)+evoked_mean_f16_zoom_pos(1,4);
evoked_std_f16_zoom_pos_top = evoked_std_f16_zoom_pos(1,2)+evoked_std_f16_zoom_pos(1,4);
VmM_pos_top = VmM_pos(1,2)+VmM_pos(1,4);
VmSTD_pos_top = VmSTD_pos(1,2)+VmSTD_pos(1,4);
Peak_amp_pos_top = Peak_amp_pos(1,2)+Peak_amp_pos(1,4);
SNR_pos_top = SNR_pos(1,2)+SNR_pos(1,4);
Amplitude_Signal_pos_top = Amplitude_Signal_pos(1,2)+Amplitude_Signal_pos(1,4);
Amplitude_Noise_pos_top = Amplitude_Noise_pos(1,2)+Amplitude_Noise_pos(1,4);
%%
%Placing plots in the figure:
%Cell 16 - spont

spont_trace_f16_ax_copy = copyobj(spont_trace_f16_ax,F); % copy axes to new fig
set(spont_trace_f16_ax_copy,'position',spont_trace_f16_pos(1,:))
   %    'fontname', 'arial','fontsize',13,'linewidth',1.5, 'ylim', y1limits(1,:),'ytick', y1ticks(1,:));
spont_mean_f16_ax_copy = copyobj(spont_mean_f16_ax,F); % copy axes to new fig
set(spont_mean_f16_ax_copy,'position',spont_mean_f16_pos(1,:))

spont_std_f16_ax_copy = copyobj(spont_std_f16_ax,F); % copy axes to new fig
set(spont_std_f16_ax_copy,'position',spont_std_f16_pos(1,:))
%% evoked 
evoked_trace_Off_f16_ax_copy = copyobj(evoked_trace_Off_f16_ax,F); % copy axes to new fig
set(evoked_trace_Off_f16_ax_copy,'position',evoked_trace_Off_f16_pos(1,:))

evoked_trace_On_f16_ax_copy = copyobj(evoked_trace_On_f16_ax,F); % copy axes to new fig
set(evoked_trace_On_f16_ax_copy,'position',evoked_trace_On_f16_pos(1,:))

evoked_mean_f16_ax_copy = copyobj(evoked_mean_f16_ax(2),F); % copy axes to new fig
set(evoked_mean_f16_ax_copy,'position',evoked_mean_f16_pos(1,:))

evoked_std_f16_ax_copy = copyobj(evoked_std_f16_ax,F); % copy axes to new fig
set(evoked_std_f16_ax_copy,'position',evoked_std_f16_pos(1,:))

%% zoom-in traces
evoked_trace_Off_f16_zoom_ax_copy = copyobj(evoked_trace_Off_f16_zoom_ax,F); % copy axes to new fig
set(evoked_trace_Off_f16_zoom_ax_copy,'position',evoked_trace_Off_f16_zoom_pos(1,:))

evoked_trace_On_f16_zoom_ax_copy = copyobj(evoked_trace_On_f16_zoom_ax,F); % copy axes to new fig
set(evoked_trace_On_f16_zoom_ax_copy,'position',evoked_trace_On_f16_zoom_pos(1,:))

evoked_mean_f16_zoom_ax_copy = copyobj(evoked_mean_f16_zoom_ax(2),F); % copy axes to new fig
set(evoked_mean_f16_zoom_ax_copy,'position',evoked_mean_f16_zoom_pos(1,:))

evoked_std_f16_zoom_ax_copy = copyobj(evoked_std_f16_zoom_ax,F); % copy axes to new fig
set(evoked_std_f16_zoom_ax_copy,'position',evoked_std_f16_zoom_pos(1,:))

%population panels:
VmM_ax_copy = copyobj(VmM_ax,F); % copy axes to new fig
set(VmM_ax_copy(2),'position',VmM_pos(1,:))
set(F, 'currentaxes', VmM_ax_copy(2)); xl=xlabel('');  tl=title('');
VmM_ax_copy(2).FontSize=12;
VmM_ax_copy(2).XTickLabel=[];

VmSTD_ax_copy = copyobj(VmSTD_ax(2),F); % copy axes to new fig
set(VmSTD_ax_copy,'position',VmSTD_pos(1,:))
set(F, 'currentaxes', VmSTD_ax_copy);  tl=title('');
VmSTD_ax_copy.FontSize=12;


Peak_amp_ax_copy = copyobj(Peak_amp_ax,F); % copy axes to new fig
set(Peak_amp_ax_copy,'position',Peak_amp_pos(1,:))
set(F, 'currentaxes', Peak_amp_ax_copy); xl=xlabel('');  tl=title('');
Peak_amp_ax_copy.FontSize=12;

SNR_ax_copy = copyobj(SNR_ax,F); % copy axes to new fig
set(SNR_ax_copy,'position',SNR_pos(1,:))
set(F, 'currentaxes', SNR_ax_copy);  xl=xlabel('');  tl=title('');
SNR_ax_copy.FontSize=12;
SNR_ax_copy.XTickLabel=[];


Amplitude_Signal_ax_copy = copyobj(Amplitude_Signal_ax,F); % copy axes to new fig
set(Amplitude_Signal_ax_copy,'position',Amplitude_Signal_pos(1,:))
set(F, 'currentaxes', Amplitude_Signal_ax_copy); xl=xlabel('');  tl=title('');
Amplitude_Signal_ax_copy.FontSize=12;
Amplitude_Signal_ax_copy.XTickLabel=[];

Amplitude_Noise_ax_copy = copyobj(Amplitude_Noise_ax,F); % copy axes to new fig
set(Amplitude_Noise_ax_copy,'position',Amplitude_Noise_pos(1,:))
set(F, 'currentaxes', Amplitude_Noise_ax_copy); tl=title('');
Amplitude_Noise_ax_copy.FontSize=12;

%position legend:

set(VmM_ax_copy(1),'position',[0.9 VmM_pos_top+0.015 0.08 0.04])
% set(evoked_mean_f16_zoom_ax_copy(1),'position',[0.9 spont_std_f16_pos_top+0.01 0.08 0.05])
% evoked_mean_f16_zoom_ax_copy(1).FontSize=11;
% evoked_mean_f16_zoom_ax_copy(1).LineWidth=1.5;  
%   annotation:
annotation('textbox', [spont_trace_f16_pos(1,1) spont_trace_f16_pos_top 0 0]+[0.06 0.01 0.5 0.05],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'Spontaneous Activity', 'FontName','arial', 'fontsize', 14, 'fontweight', 'bold')
annotation('textbox', [evoked_trace_Off_f16_pos(1,1) evoked_trace_Off_f16_pos_top 0 0]+[0.06 0.01 0.5 0.05],...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'Sensory-evoked Responses', 'FontName','arial', 'fontsize', 14, 'fontweight', 'bold')
 
 a_pos1=[0.01 -0.01 0.04 0.04];
  a_pos4=[0.02 -0.01 0.04 0.04];
 a_pos2=[0.06 -0.01 0.04 0.04];
 a_pos3=[-0.06 -0.01 0.04 0.04];
annotation('textbox', [spont_trace_f16_pos(1,1) spont_trace_f16_pos_top 0 0]+a_pos1,...
     'FitHeightToText', 'on', 'edgecolor', 'none','string', 'A', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [spont_mean_f16_pos(1,1) spont_mean_f16_pos_top 0 0]+a_pos1,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'B', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [spont_std_f16_pos(1,1) spont_std_f16_pos_top 0 0]+a_pos1,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'C', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_trace_Off_f16_pos(1,1) evoked_trace_Off_f16_pos_top 0 0]+a_pos4,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'D', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_trace_On_f16_pos(1,1) evoked_trace_On_f16_pos_top 0 0]+a_pos4,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'E', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_mean_f16_pos(1,1) evoked_mean_f16_pos_top 0 0]+a_pos4,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'F', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_std_f16_pos(1,1) evoked_std_f16_pos_top 0 0]+a_pos4,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'G', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_trace_Off_f16_zoom_pos(1,1) evoked_trace_Off_f16_zoom_pos_top 0 0]+a_pos2,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'H', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_trace_On_f16_zoom_pos(1,1) evoked_trace_On_f16_zoom_pos_top 0 0]+a_pos2,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'I', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_mean_f16_zoom_pos(1,1) evoked_mean_f16_zoom_pos_top 0 0]+a_pos2,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'J', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [evoked_std_f16_zoom_pos(1,1) evoked_std_f16_zoom_pos_top 0 0]+a_pos2,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'K', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [VmM_pos(1,1) VmM_pos_top 0 0]+a_pos3,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'L', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [VmSTD_pos(1,1) VmSTD_pos_top 0 0]+a_pos3,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'M', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [Peak_amp_pos(1,1) Peak_amp_pos_top 0 0]+a_pos3,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'N', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [SNR_pos(1,1) SNR_pos_top 0 0]+a_pos3,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'O', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [Amplitude_Signal_pos(1,1) Amplitude_Signal_pos_top 0 0]+a_pos3,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'P', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')
annotation('textbox', [Amplitude_Noise_pos(1,1) Amplitude_Noise_pos_top 0 0]+a_pos3,...
    'FitHeightToText', 'on', 'edgecolor', 'none','string', 'Q', 'FontName','arial', 'fontsize', 12, 'fontweight', 'bold')

cd 'D:\Inbal M.Sc\Data PhD\NB-ES Data\Figures\Paper Figures'
filename='Fig 3 intracellular traces+SNR_f16_v2';
saveas(F,'Fig 3 intracellular traces+SNR_f16_v2.fig'); 
print(F,filename,'-dpng','-r600','-opengl') 
print(F, '-depsc2', filename);
