%% Data acquisition lab
% @author John Michael McGuire AKA the human matlab
% @version 9/18/2019
% import data and analyze the frequency rate. 
clearvars
clc
%% set up and importataion
FormatSpecImport = '%f';
FileID15Hz = fopen('15Hz.txt','r');
FileID20Hz = fopen('20Hz.txt','r');
FileID25Hz = fopen('25Hz.txt','r');
FileID30Hz = fopen('30Hz.txt','r');
FileID35Hz = fopen('35Hz.txt','r');
FileID45Hz = fopen('45Hz.txt','r');
FileID120Hz = fopen('120Hz.txt','r');
FileID240Hz = fopen('240Hz.txt','r');
FileID1000Hz = fopen('1000Hz.txt','r');
FileIDTest = fopen('test.txt','r');
% Time steps

% Assign values
Data15Hz = fscanf(FileID15Hz,FormatSpecImport);
Data20Hz = fscanf(FileID20Hz,FormatSpecImport);
Data25Hz = fscanf(FileID25Hz,FormatSpecImport);
Data30Hz = fscanf(FileID30Hz,FormatSpecImport);
Data35Hz = fscanf(FileID35Hz,FormatSpecImport);
Data45Hz = fscanf(FileID45Hz,FormatSpecImport);
Data120Hz = fscanf(FileID120Hz,FormatSpecImport);
Data240Hz = fscanf(FileID240Hz,FormatSpecImport);
Data1000Hz = fscanf(FileID1000Hz,FormatSpecImport);
DataTest = fscanf(FileIDTest,FormatSpecImport);
L15Hz = length(Data15Hz);
L20Hz = length(Data20Hz);
L25Hz = length(Data25Hz);
L30Hz = length(Data30Hz);
L35Hz = length(Data35Hz);
L45Hz = length(Data45Hz);
L120Hz = length(Data120Hz);
L240Hz = length(Data240Hz);
L1000Hz = length(Data1000Hz);
LTheo = 100000;
LTestHz = length(DataTest);
samRate15 = 15;
samRate20 = 20;
samRate25 = 25;
samRate30 = 30;
samRate35 = 35;
samRate45 = 45;
samRate120 = 120;
samRate240 = 240;
samRate1000 = 1000;
samTheoRate = 100000;
samRateTest = 500;
TimeSteps15Hz = (0:L15Hz-1)*(1/samRate15);
TimeSteps20Hz = (0:L20Hz-1)*(1/samRate20);
TimeSteps25Hz = (0:L25Hz-1)*(1/samRate25);
TimeSteps30Hz = (0:L30Hz-1)*(1/samRate30);
TimeSteps35Hz = (0:L35Hz-1)*(1/samRate35);
TimeSteps45Hz = (0:L45Hz-1)*(1/samRate45);
TimeSteps120Hz = (0:L120Hz-1)*(1/samRate120);
TimeSteps240Hz = (0:L240Hz-1)*(1/samRate240);
TimeSteps1000Hz = (0:L1000Hz-1)*(1/samRate1000);
TimeStepsTestHz = (0:LTestHz-1)*(1/samRateTest);
TimeStepsEstimatedTheo = (0:LTheo-1)*(1/samTheoRate);
%% Analysis of originals 
fmtfreqDisplay = 'With a sampling rate of %iHz, the frequency was found to be %4.4f\n';
fmtAmp = 'With a sampling rate of %iHz, the amplitude was found to be %4.4f\n';
[NumCycs15,locZips15,freq15Hz,period15Hz] = findFreqZips(Data15Hz,TimeSteps15Hz);
fprintf(fmtfreqDisplay,15, freq15Hz);
[NumMaxs15z,NumMins15z,LocMaxs15z,LocMins15z,LocMaxVals15z,LocMinVals15z]...
    = LocalMaxMinFind(Data15Hz);
Amp15Hz = mean(LocMaxVals15z);
    if Amp15Hz ==0
        Amp15Hz = NaN;     
    end
fprintf(fmtAmp,samRate15,Amp15Hz);
    if Amp15Hz ==0
        Amp15Hz = NaN;
        
    end
[NumCycs20,locZips20,freq20Hz,period20Hz] = findFreqZips(Data20Hz,TimeSteps20Hz);
fprintf(fmtfreqDisplay,20, freq20Hz);
[NumMaxs20z,NumMins20z,LocMaxs20z,LocMins20z,LocMaxVals20z,LocMinVals20z]...
    = LocalMaxMinFind(Data20Hz);
Amp20Hz = mean(LocMaxVals20z);
fprintf(fmtAmp,samRate20,Amp20Hz);

[NumCycs25,locZips25,freq25Hz,period25Hz] = findFreqZips(Data25Hz,TimeSteps25Hz);
fprintf(fmtfreqDisplay,25, freq25Hz);
[NumMaxs25z,NumMins25z,LocMaxs25z,LocMins25z,LocMaxVals25z,LocMinVals25z]...
    = LocalMaxMinFind(Data25Hz);
Amp25Hz = mean(LocMaxVals25z);
fprintf(fmtAmp,samRate25,Amp25Hz);

[NumCycs30,locZips30,freq30Hz,period30Hz] = findFreqZips(Data30Hz,TimeSteps30Hz);
fprintf(fmtfreqDisplay,30, freq30Hz);
[NumMaxs30z,NumMins30z,LocMaxs30z,LocMins30z,LocMaxVals30z,LocMinVals30z]...
    = LocalMaxMinFind(Data30Hz);
Amp30Hz = mean(LocMaxVals30z);
fprintf(fmtAmp,samRate30,Amp30Hz);

[NumCycs35,locZips35,freq35Hz,period35Hz] = findFreqZips(Data35Hz,TimeSteps35Hz);
fprintf(fmtfreqDisplay,35, freq35Hz);
[NumMaxs35z,NumMins35z,LocMaxs35z,LocMins35z,LocMaxVals35z,LocMinVals35z]...
    = LocalMaxMinFind(Data35Hz);
Amp35Hz = mean(LocMaxVals35z);
fprintf(fmtAmp,samRate35,Amp35Hz);

%45
[NumCycs45,locZips45,freq45Hz,period45Hz] = findFreqZips(Data45Hz,TimeSteps45Hz);
fprintf(fmtfreqDisplay,45, freq45Hz);
[NumMaxs45z,NumMins45z,LocMaxs45z,LocMins45z,LocMaxVals45z,LocMinVals45z]...
    = LocalMaxMinFind(Data45Hz);
Amp45Hz = mean(LocMaxVals45z);
fprintf(fmtAmp,samRate45,Amp45Hz);

%120
[NumCycs120,locZips120,freq120Hz,period120Hz] = findFreqZips(Data120Hz,TimeSteps120Hz);
fprintf(fmtfreqDisplay,120, freq120Hz);
[NumMaxs120z,NumMins120z,LocMaxs120z,LocMins120z,LocMaxVals120z,LocMinVals120z]...
    = LocalMaxMinFind(Data120Hz);
Amp120Hz = mean(LocMaxVals120z);
fprintf(fmtAmp,samRate120,Amp120Hz);

%240
[NumCycs240,locZips240,freq240Hz,period240Hz] = findFreqZips(Data240Hz,TimeSteps240Hz);
fprintf(fmtfreqDisplay,240, freq240Hz);
[NumMaxs240z,NumMins240z,LocMaxs240z,LocMins240z,LocMaxVals240z,LocMinVals240z]...
    = LocalMaxMinFind(Data240Hz);
Amp240Hz = mean(LocMaxVals240z);
fprintf(fmtAmp,samRate240,Amp240Hz);

%1000
[NumCycs1000,locZips1000,freq1000Hz,period1000Hz] = findFreqZips(Data1000Hz,TimeSteps1000Hz);
fprintf(fmtfreqDisplay,1000, freq1000Hz);
[NumMaxs1000z,NumMins1000z,LocMaxs1000z,LocMins1000z,LocMaxVals1000z,LocMinVals1000z]...
    = LocalMaxMinFind(Data1000Hz);
Amp1000Hz = mean(LocMaxVals1000z);
fprintf(fmtAmp,samRate1000,Amp1000Hz);

% test
[NumCycsTest,locZipsTest,freqTest,periodTest] = findFreqZips(DataTest,TimeStepsTestHz);
fprintf(fmtfreqDisplay,500, freqTest);
[NumMaxsTestz,NumMinsTestz,LocMaxsTestz,LocMinsTestz,LocMaxValsTestz,LocMinValsTestz]...
    = LocalMaxMinFind(DataTest);
AmpTestHz = mean(LocMaxValsTestz);
fprintf(fmtAmp,500,AmpTestHz);

fmtPerErr = 'With sample rate %iHz, the percent difference from the actual value was %4.4f%%\n';
% assuming that the 1000Hz sampling rate was the most correct.
ErrPer15Hz = abs(((freq15Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,15,ErrPer15Hz);
ErrPer20Hz = abs(((freq20Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,20,ErrPer20Hz);
ErrPer25Hz = abs(((freq25Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,25,ErrPer25Hz);
ErrPer30Hz = abs(((freq30Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,30,ErrPer30Hz);
ErrPer35Hz = abs(((freq35Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,35,ErrPer35Hz);
ErrPer45Hz = abs(((freq45Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,45,ErrPer45Hz);
ErrPer120Hz = abs(((freq120Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,120,ErrPer120Hz);
ErrPer240Hz = abs(((freq240Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,240,ErrPer240Hz);
%% fourrier series
%15
NFFT15Hz = 2^nextpow2(L15Hz);
Fs15Data = fft(Data15Hz,NFFT15Hz)/L15Hz;
Fv15Hz = samRate15/2*linspace(0,1,NFFT15Hz/2+1);

%20
NFFT20Hz = 2^nextpow2(L20Hz);
Fs20Data = fft(Data20Hz,NFFT20Hz)/L20Hz;
Fv20Hz = samRate20/2*linspace(0,1,NFFT20Hz/2+1);

%25
NFFT25Hz = 2^nextpow2(L25Hz);
Fs25Data = fft(Data25Hz,NFFT25Hz)/L25Hz;
Fv25Hz = samRate25/2*linspace(0,1,NFFT25Hz/2+1);

%30
NFFT30Hz = 2^nextpow2(L30Hz);
Fs30Data = fft(Data30Hz,NFFT30Hz)/L30Hz;
Fv30Hz = samRate30/2*linspace(0,1,NFFT30Hz/2+1);

%35
NFFT35Hz = 2^nextpow2(L35Hz);
Fs35Data = fft(Data35Hz,NFFT35Hz)/L35Hz;
Fv35Hz = samRate35/2*linspace(0,1,NFFT35Hz/2+1);

%45
NFFT45Hz = 2^nextpow2(L45Hz);
Fs45Data = fft(Data45Hz,NFFT45Hz)/L45Hz;
Fv45Hz = samRate45/2*linspace(0,1,NFFT45Hz/2+1);

%120
NFFT120Hz = 2^nextpow2(L120Hz);
Fs120Data = fft(Data120Hz,NFFT120Hz)/L120Hz;
Fv120Hz = samRate120/2*linspace(0,1,NFFT120Hz/2+1);

%240
NFFT240Hz = 2^nextpow2(L240Hz);
Fs240Data = fft(Data240Hz,NFFT240Hz)/L240Hz;
Fv240Hz = samRate240/2*linspace(0,1,NFFT240Hz/2+1);

% 1000Hz
NFFT1000Hz = 2^nextpow2(L1000Hz);
Fs1000Data = fft(Data1000Hz,NFFT1000Hz)/L1000Hz;
Fv1000Hz = samRate1000/2*linspace(0,1,NFFT1000Hz/2+1);

% Test
NFFTTestHz = 2^nextpow2(LTestHz);
FsTestData = fft(DataTest,NFFTTestHz)/LTestHz;
FvTestHz = samRateTest/2*linspace(0,1,NFFTTestHz/2+1);

ytheo = 5*sin(2*pi*15*TimeStepsEstimatedTheo);
NFFTTheo = 2^nextpow2(LTheo);
FsTheo = fft(ytheo,NFFTTheo)/LTheo;
FvTheo = samTheoRate/2*linspace(0,1,NFFTTheo/2+1);

%% Plotting

% plots 
% 15Hz
figure(1)
subplot(2,1,1)
Plot15HzFreq = plot(TimeSteps15Hz,Data15Hz,'b-*');
Plot15HzFreq.LineWidth = 2;
title1=title('15Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(2,1,2)
Fs15HzPlot = plot(Fv15Hz,2*abs(Fs15Data(1:NFFT15Hz/2+1)),'r-s');
Fs15HzPlot.LineWidth = 2;
title1=title('15Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([-1, 30]);

% 20Hz
figure(2)
subplot(1,2,1)
Plot20HzFreqPlot = plot(TimeSteps20Hz,Data20Hz,'-*');
title1=title('20Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv20Hz,2*abs(Fs20Data(1:NFFT20Hz/2+1))) 
title1=title('20Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 30]);

% 25Hz
figure(3)
subplot(1,2,1)
Plot25HzFreqPlot = plot(TimeSteps25Hz,Data25Hz,'-*');
title1=title('25Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv25Hz,2*abs(Fs25Data(1:NFFT25Hz/2+1))) 
title1=title('25Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency', '(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 30]);

% 30Hz
figure(4)
subplot(2,1,1)
Plot30HzFreqPlot = plot(TimeSteps30Hz,Data30Hz,'b-*');
title1=title('30Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
Plot30HzFreqPlot.LineWidth=2;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(2,1,2)
FNFSPlot = plot(Fv30Hz,2*abs(Fs30Data(1:NFFT30Hz/2+1)),'r-h'); 
title1=title('30Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
FNFSPlot.LineWidth = 2;
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 30]);

% 35Hz
figure(5)
subplot(2,1,1)
Plot35HzFreqPlot = plot(TimeSteps35Hz,Data35Hz,'b-*');
Plot35HzFreqPlot.LineWidth=2;
title1=title('35Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(2,1,2)
FS35HzFs = plot(Fv35Hz,2*abs(Fs35Data(1:NFFT35Hz/2+1)),'r-h');
FS35HzFs.LineWidth=2;
title1=title('35Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 30]);

% 45Hz
figure(6)
subplot(1,2,1)
Plot45HzFreqPlot = plot(TimeSteps45Hz,Data45Hz,'-*');
title1=title('45Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv45Hz,2*abs(Fs45Data(1:NFFT45Hz/2+1))) 
title1=title('45Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 30]);

% 120Hz
figure(7)
subplot(1,2,1)
Plot120HzFreqPlot = plot(TimeSteps120Hz,Data120Hz,'-*');
title1=title('120Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv120Hz,2*abs(Fs120Data(1:NFFT120Hz/2+1))) 
title1=title('120Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;

% 240Hz
figure(8)
subplot(1,2,1)
Plot240HzFreqPlot = plot(TimeSteps240Hz,Data240Hz,'-*');
title1=title('240Hz Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv240Hz,2*abs(Fs240Data(1:NFFT240Hz/2+1))) 
title1=title('240Hz Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;

% 1000Hz
figure(9)
subplot(2,1,1)
Plot1000HzFreqPlot = plot(TimeSteps1000Hz,Data1000Hz,'b-');...
    %,TimeSteps1000Hz,ytheo1000,'r:');% remove comments and check
    %theoretical
Plot1000HzFreqPlot.LineWidth=1.5;
title1=title('1000Hz Sampling Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
ylim([-6,6]);
xlim([-.1,1.1]);
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
subplot(2,1,2)
namePlot1000 = plot(Fv1000Hz,2*abs(Fs1000Data(1:NFFT1000Hz/2+1)),'r-');
namePlot1000.LineWidth=1.5;
title1=title('1000Hz Sampling Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
%

figure(10)
subplot(1,2,1)
PlotTestHzFreqPlot = plot(TimeStepsTestHz,DataTest,'-*');
title1 = title('Test 30Hz Sampling Time Domain');
YLab1=ylabel('Voltage');
XLab1 = xlabel('Time');
ylim([-6,6]);
xlim([-.1,1.1]);
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
subplot(1,2,2)
plot(FvTestHz,2*abs(FsTestData(1:NFFTTestHz/2+1))) 
title1= title('Test 30Hz Sampling Frequency Domain');
XLab1=xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
%% comparisons 
figure(11)
LowAboveWayAboveplot = plot(TimeSteps15Hz,Data15Hz,'k-*',...
    TimeSteps25Hz,Data25Hz,'r-+',...
    TimeSteps30Hz,Data30Hz,'k--h',TimeSteps240Hz,Data240Hz,'b-d');
LowAboveWayAboveplot(1).LineWidth = 2.5;
LowAboveWayAboveplot(2).LineWidth = 2;
LowAboveWayAboveplot(3).LineWidth = 3;
LowAboveWayAboveplot(4).LineWidth = 2;
title1=title('15Hz signal various sampling rate plot');
title1.FontSize = 12;
YLab = ylabel({'Voltage','(V)'});
XLab = xlabel({'Time','(S)'});
Lgd = legend('15Hz(f_{S})','25Hz(f_{N}*5/6)',...
    '30Hz(f_{N})','240Hz(8*f_{N})','Location','north','Orientation','horizontal');
YLab.FontSize = 12;
XLab.FontSize = 12;
Lgd.FontSize = 9;
xlim([-.05, 1.25]);
ylim([-6, 8]);

figure(12)
LowAboveWayAboveplotFS = plot(Fv15Hz,2*abs(Fs15Data(1:NFFT15Hz/2+1)),'m-*',...
    Fv25Hz,2*abs(Fs25Data(1:NFFT25Hz/2+1)),'r-+',...
    Fv30Hz,2*abs(Fs30Data(1:NFFT30Hz/2+1))...
    ,'k--h',Fv240Hz,2*abs(Fs240Data(1:NFFT240Hz/2+1)),'b-d');
LowAboveWayAboveplotFS(1).LineWidth = 2;
LowAboveWayAboveplotFS(2).LineWidth = 2;
LowAboveWayAboveplotFS(3).LineWidth = 3;
LowAboveWayAboveplotFS(4).LineWidth = 2;
Tittle1=title('15Hz signal in frequency range various sampling rates');
YLab1=ylabel({'Voltage','(V)'});
XLab1=xlabel({'Time','(S)'});
LGD1=legend('15Hz sample rate (f_{S})','25Hz sample rate ((5f_{N}/6)',...
    '30Hz sample rate (f_{N})','240Hz sample rate (8f_{N})');
Tittle1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
Lgd1.FontSize = 12;
%% frequency finder

[ampAtMainFreq15Hz,IVFreq15Hz] = max(2*abs(Fs15Data(1:NFFT15Hz/2+1)));
Mainfreq15Hz = Fv15Hz(IVFreq15Hz);
disp(Mainfreq15Hz);
[ampAtMainFreq20Hz,IVFreq20Hz] = max(2*abs(Fs20Data(1:NFFT20Hz/2+1)));
Mainfreq20Hz = Fv20Hz(IVFreq20Hz);
disp(Mainfreq20Hz);
[ampAtMainFreq25Hz,IVFreq25Hz] = max(2*abs(Fs25Data(1:NFFT25Hz/2+1)));
Mainfreq25Hz = Fv25Hz(IVFreq25Hz);
disp(Mainfreq25Hz);
[ampAtMainFreq30Hz,IVFreq30Hz] = max(2*abs(Fs30Data(1:NFFT30Hz/2+1)));
Mainfreq30Hz = Fv30Hz(IVFreq30Hz);
disp(Mainfreq30Hz);
[ampAtMainFreq35Hz,IVFreq35Hz] = max(2*abs(Fs35Data(1:NFFT35Hz/2+1)));
Mainfreq35Hz = Fv35Hz(IVFreq35Hz);
disp(Mainfreq35Hz);
[ampAtMainFreq45Hz,IVFreq45Hz] = max(2*abs(Fs45Data(1:NFFT45Hz/2+1)));
Mainfreq45Hz = Fv45Hz(IVFreq45Hz);
disp(Mainfreq45Hz);
[ampAtMainFreq120Hz,IVFreq120Hz] = max(2*abs(Fs120Data(1:NFFT120Hz/2+1)));
Mainfreq120Hz = Fv120Hz(IVFreq120Hz);
disp(Mainfreq120Hz);
[ampAtMainFreq240Hz,IVFreq240Hz] = max(2*abs(Fs240Data(1:NFFT240Hz/2+1)));
Mainfreq240Hz = Fv240Hz(IVFreq240Hz);
disp(Mainfreq240Hz);
[ampAtMainFreq1000Hz,IVFreq1000Hz] = max(2*abs(Fs1000Data(1:NFFT1000Hz/2+1)));
Mainfreq1000Hz = Fv1000Hz(IVFreq1000Hz);
disp(Mainfreq1000Hz);
FrequencyVals = [Mainfreq15Hz, Mainfreq20Hz, Mainfreq25Hz,...
    Mainfreq30Hz, 15,...
    15, Mainfreq120Hz, Mainfreq240Hz, 15];
AmpVals = [Amp15Hz, Amp20Hz, Amp25Hz,...
    Amp30Hz, Amp35Hz,...
    Amp45Hz, Amp120Hz, Amp240Hz, Amp1000Hz];
SampRateNyquist = [samRate15/30, samRate20/30, samRate25/30,...
    samRate30/30, samRate35/30, samRate45/30, samRate120/30,...
    samRate240/30, samRate1000/30];
figure(13)
x = 0:40;
for i= 1:41
    yFreq(i)=15;
    yAmp(i)=5;
    yError(i) = 5*(1-cos(2*pi*(1/(4*i))))+5;
    ynegError(i) = 5*(1-cos(2*pi*(1/(4*i))))-5;
end
plotFrequencys = plot(SampRateNyquist(1),FrequencyVals(1),'<'...
    ,SampRateNyquist(2),FrequencyVals(2),'d',SampRateNyquist(3)...
    ,FrequencyVals(3),'o',SampRateNyquist(4),FrequencyVals(4),'s'...
    ,SampRateNyquist(5),FrequencyVals(5),'+',SampRateNyquist(6),...
    FrequencyVals(6),'>',SampRateNyquist(7),FrequencyVals(7),'^',...
    SampRateNyquist(8),FrequencyVals(8),'x',SampRateNyquist(9),...
    FrequencyVals(9),'h',SampRateNyquist,FrequencyVals,'k',x,yFreq,'r--');
Lgd2 = legend('15Hz','20Hz','25Hz','30Hz (f_{N})','35Hz','45Hz','120Hz',...
    '240Hz','1000Hz');
XLab2 = xlabel({'sampling rate','(f_{N})'});
YLab2 = ylabel({'Signal Acquired Frequency','(Hz)'});
title1=title('Signal Acquired Frequency results (Hz) vs Sample Rates (f_{N})');
YLab2.FontSize = 12;
XLab2.FontSize = 12;
Lgd2.FontSize = 12;
title1.FontSize = 12;
ylim([-.25,20]);
xlim([-1,40]);
for i = 1:9
    plotFrequencys(i).LineWidth = 3;
    plotFrequencys(i).MarkerSize = 10;
end
%% Amplitude Plot
AMPPPPP = max(Data1000Hz)
figure(14)
plotAmps = plot(SampRateNyquist(1),AmpVals(1),'<'...
    ,SampRateNyquist(2),AmpVals(2),'d',SampRateNyquist(3)...
    ,AmpVals(3),'o',SampRateNyquist(4),AmpVals(4),'s'...
    ,SampRateNyquist(5),AmpVals(5),'+',SampRateNyquist(6),...
    AmpVals(6),'>',SampRateNyquist(7),AmpVals(7),'^',...
    SampRateNyquist(8),AmpVals(8),'x',SampRateNyquist(9),...
    AmpVals(9),'h',SampRateNyquist,AmpVals,'k',x,yAmp,'r--',...
    x,yError,'k-',x,-ynegError,'k-');
Lgd2 = legend('15Hz','20Hz','25Hz','30Hz (f_{N})',...
    '35Hz','45Hz','120Hz','240Hz','1000Hz');
XLab2 = xlabel({'sampling rate','(f_{N})'});
YLab2 = ylabel({'Amplitude acquired','(V)'});
title1=title('Signal Acquired Amplitude (V) vs Sample Rates frequency (f_{N})');
YLab2.FontSize = 12;
XLab2.FontSize = 12;
Lgd2.FontSize = 12;
title1.FontSize = 12;
ylim([3,12]);
xlim([-1,40]);
for i = 1:9
    plotAmps(i).LineWidth = 3;
    plotAmps(i).MarkerSize = 10;
end

%% theoretical bullshit

figure(15)
subplot(2,1,1)
theoPlot=plot(TimeStepsEstimatedTheo,ytheo,'-');
t1 = title('Estimated signal generated in Time Domain');
y1 = ylabel({'Voltage','(V)'});
x1 = xlabel({'Time','(S)'});
theoPlot.LineWidth = 1.5;
ylim([-6,6]);
xlim([0,1]);
t1.FontSize = 12;
x1.FontSize = 12;
y1.FontSize = 12;
subplot(2,1,2)
TheoPlotFourrier = plot(FvTheo,2*abs(FsTheo(1:NFFTTheo/2+1)));
TheoPlotFourrier.LineWidth = 1.5;
t1 = title('estimated generated Frequency Domain');
x1 = xlabel({'Frequency', '(Hz)'});
y1 = ylabel('Magnitude');
t1.FontSize = 12;
x1.FontSize = 12;
y1.FontSize = 12;
ylim([-.1,12]);
xlim([-.1,1000]);
maxErrorPossible35Hz = 1-cos(2*pi*3/14)
maxErrorPossible240Hz = 1-cos(2*pi*(1/16))
maxErrorPossible1000Hz = 1-cos((2*pi*3/400))

%% amplitude envelope accuracy plot

figure(16)
plot(x,yError,'k-',x,-ynegError,'k-');

%% file closing and tidying up
fclose(FileID15Hz);
fclose(FileID20Hz);
fclose(FileID25Hz);
fclose(FileID30Hz);
fclose(FileID35Hz);
fclose(FileID45Hz);
fclose(FileID120Hz);
fclose(FileID240Hz);
fclose(FileID1000Hz);
fclose(FileIDTest);

%% Functions used placed here so that I don't lose them
function [NumMaxs,NumMins,LocMaxs,LocMins,LocMaxVals,LocMinVals]=...
    LocalMaxMinFind(DP)
format long;
LocMaxs = 0;
LocMins = 0;
NumMaxs = 0;
NumMins = 0;
LocMaxVals = 0;
LocMinVals = 0;
DPL = length(DP);
RisePrevious = 0;
for i = 2:1:DPL
   RiseCurrent = DP(i) -  DP(i-1);
   if ((RiseCurrent < 0) && (RisePrevious > 0))
       NumMaxs = NumMaxs + 1;
       LocMaxs(NumMaxs) = i;
       LocMaxVals(NumMaxs) = DP(i-1);
   elseif ((RiseCurrent > 0) && (RisePrevious < 0))
       NumMins = NumMins + 1;
       LocMins(NumMins) = i;
       LocMinVals(NumMins) = DP(i-1);
   end
    RisePrevious = RiseCurrent;
end
end 

% Function used for finding frequency by locating when the vibration
% passes the x axis from negative to positive. (not the best but a start.

function[NumVib,locZips,Freq,Period] = findFreqZips(DP,T)
format long;
Freq = 0;
Period = 0;
locZips= 0;
NumVib = 0;
DPL = length(DP);
for i=2:DPL
    if(DP(i-1) < 0 && DP(i) > 0)
        NumVib = NumVib + 1;
        locZips(NumVib) = i;
    end 
    
end

if (NumVib > 1)
    for j = 2:NumVib
        tempPeriod = T(locZips(j)) - T(locZips(j - 1));
        Period = (tempPeriod + Period*(j-2))/(j-1);
    end
    Freq = 1/Period;
elseif (NumVib == 1)
    disp('Did not complete 2 cyles.')
else
    disp('Did not complete a cylcle')  
end 
end 