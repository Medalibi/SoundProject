function adpcm_GUI25
% Modifiable runGUI file
clc;
clear all;

%USER - ENTER FILENAME
fileName = 'adpcm.mat';    
fileData=load(fileName);
temp=fileData(1).temp;

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off');

%SENSE COMPUTER AND SET FILE DELIMITER
switch(computer)				
    case 'MACI64',		char= '/';
    case 'GLNX86',  char='/';
    case 'PCWIN',	char= '\';
    case 'PCWIN64', char='\';
    case 'GLNXA64', char='/';
end


% find speech files directory by going up one level and down one level
% on the directory chain; as follows:
    dir_cur=pwd; % this is the current Matlab exercise directory path 
    s=regexp(dir_cur,char); % find the last '\' for the current directory
    s1=s(length(s)); % find last '\' character; this marks upper level directory
    dir_fin=strcat(dir_cur(1:s1),'speech_files'); % create new directory
    start_path=dir_fin; % save new directory for speech files location

% USER - ENTER PROPER CALLBACK FILE
Callbacks_adpcm_GUI25(f,temp,start_path);    
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% GUI Lite 2.5 for cepstral pitch detector
% 2 Panels
%   #1 - input parameters
%   #2 - graphics displays
% 3 Graphic Panels
%   #1 - original waveform/quantized signal/error signal
%   #2 - signal/error power spectrum
%   #3 - error signal histogram
% 1 TitleBox
% 12 Buttons
%   #1 - pushbutton - Speech Directory
%   #2 - popupmenu - Speech Files
%   #3 - editable button - nbits: number of quantizer bits
%   #4 - editable button - alpha: prediction coefficient
%   #5 - editable button - deltamin: minimum value of delta
%   #6 - editable button - deltamax: maximum value of delta
%   #7 - editable button - snr: display of snr
%   #8 - pushbutton - Play Original Signal
%   #9 - pushbutton - Play Quantized Signal
%   #10 - pushbutton - Play Error Signal
%   #11 - pushbutton - Run ADPCM Coder
%   #12 - pushbutton - Close GUI