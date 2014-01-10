function Callbacks_adpcm_GUI25(f,C,start_path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SENSE COMPUTER AND SET FILE DELIMITER
switch(computer)				
    case 'MACI64',		char= '/';
    case 'GLNX86',  char='/';
    case 'PCWIN',	char= '\';
    case 'PCWIN64', char='\';
    case 'GLNXA64', char='/';
end

x=C{1,1};
y=C{1,2};
a=C{1,3};
b=C{1,4};
u=C{1,5};
v=C{1,6};
m=C{1,7};
n=C{1,8};
lengthbutton=C{1,9};
widthbutton=C{1,10};
enterType=C{1,11};
enterString=C{1,12};
enterLabel=C{1,13};
noPanels=C{1,14};
noGraphicPanels=C{1,15};
noButtons=C{1,16};
labelDist=C{1,17};%distance that the label is below the button
noTitles=C{1,18};
buttonTextSize=C{1,19};
labelTextSize=C{1,20};
textboxFont=C{1,21};
textboxString=C{1,22};
textboxWeight=C{1,23};
textboxAngle=C{1,24};
labelHeight=C{1,25};
fileName=C{1,26};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PANELS
for j=0:noPanels-1
uipanel('Parent',f,...
'Units','Normalized',...
'Position',[x(1+4*j) y(1+4*j) x(2+4*j)-x(1+4*j) y(3+4*j)-y(2+4*j)]);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAPHIC PANELS
for i=0:noGraphicPanels-1
switch (i+1)
case 1
graphicPanel1 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 2
graphicPanel2 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 3
graphicPanel3 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TITLE BOXES
for k=0:noTitles-1
switch (k+1)
case 1
titleBox1 = uicontrol('parent',f,...
'Units','Normalized',...
'Position',[u(1+4*k) v(1+4*k) u(2+4*k)-u(1+4*k) v(3+4*k)-v(2+4*k)],...
'Style','text',...
'FontSize',textboxFont{k+1},...
'String',textboxString(k+1),...
'FontWeight',textboxWeight{k+1},...
'FontAngle',textboxAngle{k+1});
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BUTTONS
for i=0:(noButtons-1)
enterColor='w';
if strcmp(enterType{i+1},'pushbutton')==1 ||strcmp(enterType{i+1},'text')==1
enterColor='default';
end
if (strcmp(enterLabel{1,(i+1)},'')==0 &&...
        strcmp(enterLabel{1,(i+1)},'...')==0) %i.e. there is a label
%creating a label for some buttons
uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i)-labelDist-labelHeight(i+1) ...
(m(2+2*i)-m(1+2*i)) labelHeight(i+1)],...
'Style','text',...
'String',enterLabel{i+1},...
'FontSize', labelTextSize(i+1),...
'HorizontalAlignment','center');
end
switch (i+1)
case 1
button1=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button1Callback);
case 2
button2=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button2Callback);
case 3
button3=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button3Callback);
case 4
button4=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button4Callback);
case 5
button5=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button5Callback);
case 6
button6=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button6Callback);
case 7
button7=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button7Callback);
case 8
button8=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button8Callback);
case 9
button9=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button9Callback);
case 10
button10=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button10Callback);
case 11
button11=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button11Callback);
case 12
button12=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button12Callback);
case 13
button13=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button13Callback);
case 14
button14=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button14Callback);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    curr_file=1;
    fs=8000;
    fsd=10000;
    directory_name='abcd';
    wav_file_names='abce';
    fin_path='filename';
    fname='output';
    nsamp=1;
    xin=[];
    nbits=4;
    alpha=0.8;
    deltamin=16;
    deltamax=1600;
    snr=0;
    xhats=[];
    ehat=[];
    iplot=1;
    x=[];

% Name the GUI
    set(f,'Name','adpcm_speech');

% CALLBACKS
% Callback for button1 -- Get Speech Files Directory
 function button1Callback(h,eventdata)
     directory_name=uigetdir(start_path,'dialog_title');
     %% ***** Download speech files **************************************************************************
     if isempty(getpref('SpeechApps'))
         url = sprintf('%s%s%s',...
             'http://www.mathworks.com/matlabcentral/fileexchange/',...
             '42911-speech-and-audio-files-for-speech-processing-excercises',...
             '?download=true');
         [saveloc,~,~] = fileparts(pwd); %save to one level up from current folder
         % Create a waitbar during download
         h = waitbar(0.35,'This may take several minutes...',...
             'Name','Downloading Speech Files...');
         % Download the zipped file
         [filestr,status] = urlwrite(url,[saveloc filesep 'speech_files.zip'],...
             'Timeout',10);
         if status
             delete(h);
             hh1= helpdlg('Downloaded. Select a location to UNZIP the speech files.');
             uiwait(hh1);
             unziploc = uigetdir(saveloc,'Select a location to unzip the speech files');
             h2 = waitbar(0.2,'This may take a minute...',...
                 'Name','Unzipping the Speech Files to Location Selected...');
             unzip(filestr,unziploc);
             delete(h2)
             addpref('SpeechApps','path',unziploc);
             hh2= helpdlg('Ready. Select the speech_files folder in the next window');
             uiwait(hh2);
         else
             warndlg('No Internet Connection to MATLAB Central!');
         end
         
     else
     end
     directory_name=uigetdir(getpref('SpeechApps','path'));
     
     %%
     A=strvcat(strcat((directory_name),[char,'*.wav']));
     struct_filenames=dir(A);
     wav_file_names={struct_filenames.name};
     set(button2,'String',wav_file_names);
     set(button2,'val',1);
     
% once the popupmenu/drop down menu is created, by default, the first
% selection from the popupmenu/drop down menu id not called
    indexOfDrpDwnMenu=1;
    
% by default first option from the popupmenu/dropdown menu will be loaded
    [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
 end

% Callback for button2 -- Choose speech file for play and plot
 function button2Callback(h,eventdata)
     indexOfDrpDwnMenu=get(button2,'val');
     [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
     
% determine region of file for adpcm processing; first reset graphic Panel
% 3 and plot full waveform
     reset(graphicPanel3);
     axes(graphicPanel3);
     l=length(curr_file);
     index=(0:l-1);
     plot(index,curr_file);xlabel('Time in Samples');ylabel('Amplitude');
     axis tight;grid on;
     
% using graphical cursor, select region for adpcm coding
     % [X,Y]=ginput(2);
     % X=round(X)
     % if(X(1) < 1) X(1)=1; end
     % if(X(2) > l) X(2)=l; end
     
% use entire file for processing
    X(1)=1; X(2)=1;

% save selected region in curr_file and xin
     temp=curr_file;
     clear xin; clear curr_file;
     xin=temp(1:end)*32768.;
     curr_file=temp(X(1):X(2));
     
% play out selected region
    soundsc(xin,fs);
     
 end

%*************************************************************************
% function -- load selection from designated directory and file
%
function [curr_file,fs]=loadSelection(directory_name,wav_file_names,...
    indexOfDrpDwnMenu);
%
% read in speech/audio file
% fin_path is the complete path of the .wav file that is selected
    fin_path=strcat(directory_name,char,strvcat(wav_file_names(indexOfDrpDwnMenu)));
    
% clear speech/audio file
    clear curr_file;
    
% read in speech/audio signal into curr_file; sampling rate is fs 
    [curr_file,fs]=wavread(fin_path);
    xin=curr_file*32768;
    
% create title information with file, sampling rate, number of samples
    fname=wav_file_names(indexOfDrpDwnMenu);
    FS=num2str(fs);
    nsamp=num2str(length(curr_file));
    file_info_string=strcat('  file: ',fname,', fs: ',FS,' Hz, nsamp:',nsamp);
    
% read in filename (fname) from cell array
    fname=wav_file_names{indexOfDrpDwnMenu};
    
% correct fname characters by replacing '_' by ' '
    fname(find(fname(:) == '_')) = ' ';
end

% Callback for button3 -- nbits: number of bits in quantizer (2-5 range)l 
%  -4 or -5 for faster attack than conventional 4 or 5
 function button3Callback(h,eventdata)
     nbits=str2num(get(button3,'string'));

% check that nbits in correct integer range
     if( (nbits > 5 || nbits < 2) && (nbits ~= -4) && (nbits ~= -5) )
         waitfor(errordlg('The number of bits must be an integer between 2 and 5, or equal to -4 or -5'));
         return;
     end
 end

% Callback for button4 -- alpha: 1-tap predictor value (range 0.5-0.9)
 function button4Callback(h,eventdata)
     alpha=str2num(get(button4,'string'));
     
% check that alpha in correct range of -1 to +1
     if (alpha < -1 || alpha > 1)
         waitfor(errordlg('The value of alpha must be between -1 and 1'));
         return;
     end
 end

% Callback for button13 -- iplot: 1:plot in samples, 2:plot in seconds
 function button13Callback(h,eventdata)
     iplot=str2num(get(button13,'string'));
     
% check that iplot in correct range of 1 (plot in samples) or 2 (plot in
% seconds)
     while (iplot ~= 1 & iplot ~= 2)
         uiwait(msgbox('iplot must be 1 (samples) or 2 (seconds); re-enter iplot','iplot'));
     end
 end

% Callback for button5 -- deltamin: smallest value for delta (1-100 is
%   range) of deltamin
 function button5Callback(h,eventdata)
     deltamin=str2num(get(button5,'string'));
     if (deltamin < 1 || deltamin > 64)
         waitfor(errordlg('The minimum value of delta must be between 1 and 64'));
         return;
     end
 end

% Callback for button6 -- deltamax: largest value for delta (usually set to
%   deltamin * 100
 function button6Callback(h,eventdata)
     deltamax=str2num(get(button6,'string'));
     if (deltamax < 400 || deltamax > 3200)
         waitfor(errordlg('The maximum value of delta must be between 400 and 3200'));
         return;
     end
 end

% Callback for button7 -- snr: SNR of most recent ADPCM run
 function button7Callback(h,eventdata)
     set(button7,'string',num2str(snr));
 end

% Callback for button8 -- play original speech signal
    function button8Callback(h,eventdata)
        soundsc(xin,fs)
    end

% Callback for button9 -- play quantized speech signal
    function button9Callback(h,eventdata)
        soundsc(xhats,fs)
    end

% Callback for button10 -- play error signal
    function button10Callback(h,eventdata)
        soundsc(ehat,fs)
    end

% Callback for button11 -- Run ADPCM Speech Coder
 function button11Callback(h,eventdata)
     
% check editable buttons for changes
    button3Callback(h,eventdata);
    button4Callback(h,eventdata);
    button5Callback(h,eventdata);
    button6Callback(h,eventdata);
    button13Callback(h,eventdata);
    
% setup for agc processing of a speech signal
    [xhats,ehat,snr]=set_adpcm_speech(xin,fs,nbits,alpha,deltamin,deltamax,fname);
 end

%************************************************************************
    function [xhats,ehat,snr]=set_adpcm_speech(xin,fs,nbits,alpha,...
            deltamin,deltamax,filename)
%
% adpcm coder with adaptive step sizes based on Jayant algorithm

% Inputs:
%   xin: speech array
%   fs: sampling rate of speech
%   nbits: number of quantizer bits
%   alpha: 1-tap predictor value
%   deltamin: minimum value of delta
%   deltamax: maximum value of delta
%   filename: speech filename

% Outputs:
%   xhats: quantized signal
%   ehat: error signal
%   snr: signal-to-noise ratio for most recent adpcm run

% calculate step size multipliers based on value of nbits (negative values
% of nbits used for more aggressive attack for 4 and 5 bit quantizers)
    if (nbits == 2)
        P=[0.8 1.6];
    elseif (nbits == 3)
        P=[0.9 0.9 1.25 1.75];
    elseif (nbits == 4)
        P=[.9 .9 .9 .9 1.2 1.6 2.0 2.4];
    elseif (nbits == -4)
        nbits=4;
        P=[.9 .9 .9 .9 1.2 1.6 4.0 9.6];
    elseif (nbits == 5)
        P=[0.9 0.9 0.9 0.9 0.95 0.95 0.95 0.95 1.2 1.5 1.8 2.1 2.4...
            2.7 3.0 3.3];
    elseif (nbits == -5)
        nbits=5;
        P=[0.9 0.9 0.9 0.9 0.95 0.95 0.95 0.95 2.4 3.0 3.6 4.2 4.8...
            5.4 6.0 6.6];
    else
        fprintf('nbits must be in range of 2-5: \n');
        pause
    end
        
% print out all initial values
    fprintf('filename:%s, nbits:%d, deltamin/max: %d %d, alpha:%f \n',...
        filename,nbits,deltamin,deltamax,alpha);
    
% determine starting and ending samples of speech file
    ss=1; es=length(xin);
    nsamp=es;

% calculate mean, xbar, and standard deviation, sigmax, of input speech
    x=xin(ss:es)';
    xbar=sum(x)/length(x);
    sigmax=sqrt(sum(x.^2)/length(x)-xbar^2);
    
% print out mean and standard deviation of input speech file
    fprintf('xbar: %8.2f, sigmax: %8.2f \n',xbar,sigmax);
    
% determine first correlation coefficient of input signal and print out
% value
    ac=sum(x(1:length(x)-1).*x(2:length(x)))/sqrt(sum(x.^2)*...
        sum(x(2:length(x)).^2));
    fprintf('ac: %8.2f \n',ac);

% loop initial conditions for adpcm coder
%   xhat is the quantized value of x; xhats is the saved values of x
%   xtilde is the predicted value of x; xtildes is the saved values of
%   xtilde
%   d is the difference signal; ds is the saved values of d
%   dhat is the quantized value of d; dhats is the saved values of dhat
%   c is the codeword; cs is the saved values of c
%   csign is the sign of the codeword; csigns is the saved values of csign
%   P is the array of codeword weights
    xhats(1)=0;
    xtildes=1;
    ds=-1;
    dhats=-1;
    cs(1)=0;
    csigns(1)=1;
    pms=P(1);
    deltao=deltamin;

% loop adpcm encoder over all samples; print index every 1000 samples
    fid=fopen('adpcm_encode.txt','wt');
    fprintf(fid,'     n      x xtilde      d   dhat   xhat      c  delta \n');
    for n=2:length(x)
        xtilde=alpha*xhats(n-1);
        d=x(n)-xtilde;
        [dhat,csign,codeword,delta]=quant1(d,deltao,nbits,P,deltamin,deltamax);
        xhat=xtilde+dhat;
        xhats(n)=xhat;
        % xtildes(n)=xtilde;
        % ds(n)=d;
        % dhats(n)=dhat;
        % deltas(n)=delta;
        deltao=delta;
        cs(n)=codeword;
        csigns(n)=csign;
        % pms(n)=P(codeword+1);
        if (n <= 10)
            fprintf(fid,'%6.1f %6.1f %6.1f %6.1f %6.1f %6.1f %6.1f %6.1f \n',...
                n,x(n),xtilde,d,dhat,xhat,codeword,delta);
        end
    end
    fclose(fid);
                
% determine error mean and sigma and print results
    ebar=sum(x-xhats)/length(x);
    sigmae=sqrt(sum((x-xhats).^2)/length(x)-ebar^2);
    fprintf('ebar: %8.2f, sigmae: %8.2f \n',ebar,sigmae);
    
% determine snr for differential quantizer and print results
    snr=20*log10(sigmax/sigmae);
    
% update snr button with current value
    fprintf('file:%s, alpha: %6.2f, snr (dB): %8.2f, deltamin, deltamax: %d %d \n',...
        filename,alpha,snr,deltamin,deltamax);   

% histogram of codewords
% use artificial range of -2^nbits to 2^nbits-1 (i.e., one more negative
% value than positive value) to handle case of + or - zero
    stitle=sprintf(' file: %s, alpha:%6.2f, deltamin,deltamax: %d %d, nbits: %d, P(high): %6.2f, snr: %6.2f dB',...
        filename,alpha,deltamin,deltamax,nbits,P(2^(nbits-1)),snr);
    csh=cs;
    index=find(csigns == -1);
    csh(index)=-1-csh(index);
    
% clear graphics Panel 2
        reset(graphicPanel2);
        axes(graphicPanel2);
        cla;
        
% plot histogram of error signal in graphics Panel 2
    hist(xhats-x,101),axis tight, grid on, ...
        xlabel('Error Signal'),ylabel('Count');
        legend('error signal histogram');    

% save quantized file, xhats in file sp_encoded.wav
    fileout=strcat('sp','_encoded.wav');
    xhatmax=max(max(xhats),-min(xhats));
    xhatss=xhats.*32760./xhatmax;
    y=savewav(xhatss,fileout,fs,16);
    
% save error signal in file adpcm_error.wav
    filesav='adpcm_error.wav';
    ehat=xhats-x;
	ehatmax=max(abs(ehat));
    ehatu=ehat;
    ehat=ehat/ehatmax*32767.;
    y=savewav(ehat,filesav,fs,16);

% print out arrays of input, output and codewords
%
    fid=fopen('adpcm_speech.txt','wt');
    fprintf(fid,'n    x(n)   c(n)  xhat(n) \n');
    for np=1:length(x)
       fprintf(fid,'%d %6.1f    %6.1f    %6.1f \n',...
           np-1,x(np),cs(np),xhats(np));
    end
    fclose(fid);    

% save the codeword file along with alpha, deltamin, deltamax, nbits and P
% table
    save adpcm_encode cs csigns alpha deltamin deltamax nbits P fs;
    fprintf('mat file saved: \n');

% clear graphics Panel 3
        reset(graphicPanel3);
        axes(graphicPanel3);
        cla;
        
% plot curves of input, quantized input and error signal on graphics Panel
% 3
    t=0:length(x)-1;
    
% plot waveforms versus samples (iplot=1) or seconds (iplot=2)
    if (iplot == 1)
        ts=t;
        stringt=['Time in Samples (fs=',num2str(fs),' samples/sec)'];
    else
        ts=t/fs;
        stringt=['Time in Seconds (fs=',num2str(fs),' samples/sec)'];
    end
    plot(ts,x,'r'), hold on, plot(ts,xhats,'g'), plot(ts,xhats-x,'b');
    xlabel(stringt),ylabel('Waveform Value'),...
       axis tight,grid on; legend('x','xhat','error');
   
% clear graphics Panel 1
        reset(graphicPanel1);
        axes(graphicPanel1);
        cla;
        
% plot long-time average power density spectrum of signal and error signals
% in graphics Panel 1
        Nwin=512;
        Nfft=1024;
        [P2,F,R,T]=pd_spect(xin,fs,Nfft,Nwin);
        plot(F,10*log10(P2),'r','LineWidth',2),grid on;
        xlabel('Frequency'),ylabel('Log Magnitude');hold on;
        [P2,F,R,T]=pd_spect(ehatu,fs,Nfft,Nwin);
        plot(F,10*log10(P2),'b','LineWidth',2);
        legend('signal power spectrum','error signal power spectrum');
        
% display fname and signal processing parameters in titleBox1
        stitle1=strcat('ADPCM Speech Coder -- ',stitle);
        set(titleBox1,'string',stitle1);
        set(titleBox1,'FontSize',20);
        
% update snr button
        set(button7,'string',num2str(snr));
    end

% Callback for button14 -- Expand Time Scale
 function button14Callback(h,eventdata)
% clear graphics panel 3
 reset(graphicPanel3);  
 axes(graphicPanel3);
 cla;
    
% plot curves of input, quantized input and error signal on graphics Panel
% 3
    l=length(x);
    t=0:l-1;
    
% plot waveforms versus samples (iplot=1) or seconds (iplot=2)
    if (iplot == 1)
        ts=t;
        stringt=['Time in Samples (fs=',num2str(fs),' samples/second)'];
    else
        ts=t/fs;
        stringt=['Time in Seconds (fs=',num2str(fs),' samples/second)'];
    end
    
    plot(ts,x,'r');
    hold on,plot(ts,xhats,'g'); 
    plot(ts,xhats-x,'b');
    xlabel(stringt),ylabel('Waveform Value');axis tight; grid on;
    legend('x','xhat','error');
    hold on
% use graphics cursor to define beginning and ending samples
    
 %axes(graphicPanel3);
legend off
A=axis;
[xb,yb]=ginput(1);

if (iplot ==2) xb=round(xb*fs); else xb=round(xb); end

plot([xb,xb],[A(3),A(4)],'k');

[xe,ye]=ginput(1);

if (iplot ==2) xe=round(xe*fs); else xe=round(xe); end
X=[xb,xe];

% [X,Y]=ginput(2);
%    if (iplot == 2)
 %       X(:)=X(:)*fs;
 %   end
 %   X=round(X);
    if (X(1) < 1) X(1)=1; end
    if (X(2) > l) X(2)=l; end
    
    begin=X(1);
    ending=X(2);
    
    clear t; t=(begin-1:ending-1);
    
    reset(graphicPanel3);
    axes(graphicPanel3);
    
    clear ts;
    if (iplot == 1)
        ts=t;
    else
        ts=t/fs;
    end
    
    plot(ts,x(begin-1:ending-1),'r');hold on; plot(ts,xhats(begin-1:ending-1),'g');
    plot(ts,xhats(begin-1:ending-1)-x(begin-1:ending-1),'b');
    xlabel(stringt),ylabel('Waveform Value');axis tight; grid on;
    legend('x','xhat','error');
 end

% Callback for button12 -- Close GUI
 function button12Callback(h,eventdata)
     fclose('all');
     close(gcf);
 end
end