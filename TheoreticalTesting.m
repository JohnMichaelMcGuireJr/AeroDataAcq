%% Error analysis
% Assign values
clearvars
clc
L15Hz = 15;
L20Hz = 20;
L25Hz = 25;
L30Hz = 30;
L31Hz = 31;
L35Hz = 35;
L40Hz = 40;
L45Hz = 45;
% 50
L50Hz = 50;
%
L52Hz = 52;
%
L55Hz = 55;
%
L60Hz = 60;
% 67
L67Hz = 67;
% 75
L75Hz = 75;
% 90
L90Hz = 90;
% 97
L97Hz = 97;
% 105
L105Hz = 105;
% 112
L112Hz = 112;
% 120
L120Hz = 120;
% 135
L135Hz = 135;
%
L150Hz = 150;
%
L180Hz = 180;
%
L210Hz = 210;
%
L240Hz = 240;
L1000Hz = 1000;
LTheo = 100000;
LTestHz = 500;
samRate15 = 15;
samRate20 = 20;
samRate25 = 25;
samRate30 = 30;
samRate31 = 31;
samRate35 = 35;
samRate40 = 40;
samRate45 = 45;
samRate50 = 50;
samRate52 = 52;
samRate55 = 55;
samRate60 = 60;
samRate67 = 67;
samRate75 = 75;
samRate90 = 90;
samRate97 = 97;
samRate105 = 105;
samRate112 = 112;
samRate120 = 120;
samRate135 = 135;
samRate150 = 150;
samRate180 = 180;
samRate210 = 210;
samRate240 = 240;
samRate1000 = 1000;
samTheoRate = 100000;
samRateTest = 500;
TimeSteps15Hz = (0:L15Hz-1)*(1/samRate15);
TimeSteps20Hz = (0:L20Hz-1)*(1/samRate20);
TimeSteps25Hz = (0:L25Hz-1)*(1/samRate25);
TimeSteps30Hz = (0:L30Hz-1)*(1/samRate30);
%
TimeSteps31Hz = (0:L31Hz-1)*(1/samRate31);
%
TimeSteps35Hz = (0:L35Hz-1)*(1/samRate35);
%
TimeSteps40Hz = (0:L40Hz-1)*(1/samRate40);
%
TimeSteps45Hz = (0:L45Hz-1)*(1/samRate45);
%
TimeSteps50Hz = (0:L50Hz-1)*(1/samRate50);
%
TimeSteps52Hz = (0:L52Hz-1)*(1/samRate52);
%
TimeSteps55Hz = (0:L55Hz-1)*(1/samRate55);
%
TimeSteps60Hz = (0:L60Hz-1)*(1/samRate60);
TimeSteps67Hz = (0:L67Hz-1)*(1/samRate67);
%75 tstep
TimeSteps75Hz = (0:L75Hz-1)*(1/samRate75);
%90 tstep
TimeSteps90Hz = (0:L90Hz-1)*(1/samRate90);
%97 tstep
TimeSteps97Hz = (0:L97Hz-1)*(1/samRate97);

%105 tstep
TimeSteps105Hz = (0:L105Hz-1)*(1/samRate105);

%112 tstep
TimeSteps112Hz = (0:L112Hz-1)*(1/samRate112);

% 120
TimeSteps120Hz = (0:L120Hz-1)*(1/samRate120);

% 135
TimeSteps135Hz = (0:L135Hz-1)*(1/samRate135);


% 150 
TimeSteps150Hz = (0:L150Hz-1)*(1/samRate150);
% 180 
TimeSteps180Hz = (0:L180Hz-1)*(1/samRate180);
% 210 
TimeSteps210Hz = (0:L210Hz-1)*(1/samRate210);
TimeSteps240Hz = (0:L240Hz-1)*(1/samRate240);
TimeSteps1000Hz = (0:L1000Hz-1)*(1/samRate1000);
TimeStepsTestHz = (0:LTestHz-1)*(1/samRateTest);
TimeStepsEstimatedTheo = (0:LTheo-1)*(1/samTheoRate);
Data15Hz = 5*sin(2*pi*15*TimeSteps15Hz);
Data20Hz = 5*sin(2*pi*15*TimeSteps20Hz);
Data25Hz = 5*sin(2*pi*15*TimeSteps25Hz);
%
Data30Hz = 5*sin(2*pi*15*TimeSteps30Hz);
%
Data31Hz = 5*sin(2*pi*15*TimeSteps31Hz);
%
Data35Hz = 5*sin(2*pi*15*TimeSteps35Hz);
%
Data40Hz = 5*sin(2*pi*15*TimeSteps40Hz);
%
Data45Hz = 5*sin(2*pi*15*TimeSteps45Hz);
%
Data50Hz = 5*sin(2*pi*15*TimeSteps50Hz);
%
Data52Hz = 5*sin(2*pi*15*TimeSteps52Hz);
%
Data55Hz = 5*sin(2*pi*15*TimeSteps55Hz);
%
Data60Hz = 5*sin(2*pi*15*TimeSteps60Hz);
%67
Data67Hz = 5*sin(2*pi*15*TimeSteps67Hz);
% data 75
Data75Hz = 5*sin(2*pi*15*TimeSteps75Hz);
% data 90
Data90Hz = 5*sin(2*pi*15*TimeSteps90Hz);
% data 97
Data97Hz = 5*sin(2*pi*15*TimeSteps97Hz);

% data 105
Data105Hz = 5*sin(2*pi*15*TimeSteps105Hz);
% data 112
Data112Hz = 5*sin(2*pi*15*TimeSteps112Hz);

% 120
Data120Hz = 5*sin(2*pi*15*TimeSteps120Hz);

% 135
Data135Hz = 5*sin(2*pi*15*TimeSteps135Hz);
% 150
Data150Hz = 5*sin(2*pi*15*TimeSteps150Hz);
% 180
Data180Hz = 5*sin(2*pi*15*TimeSteps180Hz);
% 210
Data210Hz = 5*sin(2*pi*15*TimeSteps210Hz);
% 240
Data240Hz = 5*sin(2*pi*15*TimeSteps240Hz);
Data1000Hz = 5*sin(2*pi*15*TimeSteps1000Hz);
DataTest = 5*sin(2*pi*30*TimeStepsTestHz);
ytheo = 5*sin(2*pi*15*TimeStepsEstimatedTheo);

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
%
[NumCycs31,locZips31,freq31Hz,period31Hz] = findFreqZips(Data31Hz,TimeSteps31Hz);
fprintf(fmtfreqDisplay,31, freq31Hz);
[NumMaxs31z,NumMins31z,LocMaxs31z,LocMins31z,LocMaxVals31z,LocMinVals31z]...
    = LocalMaxMinFind(Data31Hz);
Amp31Hz = mean(LocMaxVals31z);
fprintf(fmtAmp,samRate31,Amp31Hz);
%

[NumCycs35,locZips35,freq35Hz,period35Hz] = findFreqZips(Data35Hz,TimeSteps35Hz);
fprintf(fmtfreqDisplay,35, freq35Hz);
[NumMaxs35z,NumMins35z,LocMaxs35z,LocMins35z,LocMaxVals35z,LocMinVals35z]...
    = LocalMaxMinFind(Data35Hz);
Amp35Hz = mean(LocMaxVals35z);
fprintf(fmtAmp,samRate35,Amp35Hz);
% 40
[NumCycs40,locZips40,freq40Hz,period40Hz] = findFreqZips(Data40Hz,TimeSteps40Hz);
fprintf(fmtfreqDisplay,40, freq40Hz);
[NumMaxs40z,NumMins40z,LocMaxs40z,LocMins40z,LocMaxVals40z,LocMinVals40z]...
    = LocalMaxMinFind(Data40Hz);
Amp40Hz = mean(LocMaxVals40z);
fprintf(fmtAmp,samRate40,Amp40Hz);

%45
[NumCycs45,locZips45,freq45Hz,period45Hz] = findFreqZips(Data45Hz,TimeSteps45Hz);
fprintf(fmtfreqDisplay,45, freq45Hz);
[NumMaxs45z,NumMins45z,LocMaxs45z,LocMins45z,LocMaxVals45z,LocMinVals45z]...
    = LocalMaxMinFind(Data45Hz);
Amp45Hz = mean(LocMaxVals45z);
fprintf(fmtAmp,samRate45,Amp45Hz);

%50
[NumCycs50,locZips50,freq50Hz,period50Hz] = findFreqZips(Data50Hz,TimeSteps50Hz);
fprintf(fmtfreqDisplay,50, freq50Hz);
[NumMaxs50z,NumMins50z,LocMaxs50z,LocMins50z,LocMaxVals50z,LocMinVals50z]...
    = LocalMaxMinFind(Data50Hz);
Amp50Hz = mean(LocMaxVals50z);
fprintf(fmtAmp,samRate50,Amp50Hz);

%52
[NumCycs52,locZips52,freq52Hz,period52Hz] = findFreqZips(Data52Hz,TimeSteps52Hz);
fprintf(fmtfreqDisplay,52, freq52Hz);
[NumMaxs52z,NumMins52z,LocMaxs52z,LocMins52z,LocMaxVals52z,LocMinVals52z]...
    = LocalMaxMinFind(Data52Hz);
Amp52Hz = mean(LocMaxVals52z);
fprintf(fmtAmp,samRate52,Amp52Hz);

%55
[NumCycs55,locZips55,freq55Hz,period55Hz] = findFreqZips(Data55Hz,TimeSteps55Hz);
fprintf(fmtfreqDisplay,55, freq55Hz);
[NumMaxs55z,NumMins55z,LocMaxs55z,LocMins55z,LocMaxVals55z,LocMinVals55z]...
    = LocalMaxMinFind(Data55Hz);
Amp55Hz = mean(LocMaxVals55z);
fprintf(fmtAmp,samRate55,Amp55Hz);

%60
[NumCycs60,locZips60,freq60Hz,period60Hz] = findFreqZips(Data60Hz,TimeSteps60Hz);
fprintf(fmtfreqDisplay,60, freq60Hz);
[NumMaxs60z,NumMins60z,LocMaxs60z,LocMins60z,LocMaxVals60z,LocMinVals60z]...
    = LocalMaxMinFind(Data60Hz);
Amp60Hz = mean(LocMaxVals60z);
fprintf(fmtAmp,samRate60,Amp60Hz);
%67
[NumCycs67,locZips67,freq67Hz,period67Hz] = findFreqZips(Data67Hz,TimeSteps67Hz);
fprintf(fmtfreqDisplay,67, freq67Hz);
[NumMaxs67z,NumMins67z,LocMaxs67z,LocMins67z,LocMaxVals67z,LocMinVals67z]...
    = LocalMaxMinFind(Data67Hz);
Amp67Hz = mean(LocMaxVals67z);
fprintf(fmtAmp,samRate67,Amp67Hz);
%75
[NumCycs75,locZips75,freq75Hz,period75Hz] = findFreqZips(Data75Hz,TimeSteps75Hz);
fprintf(fmtfreqDisplay,75, freq75Hz);
[NumMaxs75z,NumMins75z,LocMaxs75z,LocMins75z,LocMaxVals75z,LocMinVals75z]...
    = LocalMaxMinFind(Data75Hz);
Amp75Hz = mean(LocMaxVals75z);
fprintf(fmtAmp,samRate75,Amp75Hz);
%90
[NumCycs90,locZips90,freq90Hz,period90Hz] = findFreqZips(Data90Hz,TimeSteps90Hz);
fprintf(fmtfreqDisplay,90, freq90Hz);
[NumMaxs90z,NumMins90z,LocMaxs90z,LocMins90z,LocMaxVals90z,LocMinVals90z]...
    = LocalMaxMinFind(Data90Hz);
Amp90Hz = mean(LocMaxVals90z);
fprintf(fmtAmp,samRate90,Amp90Hz);
%97
[NumCycs97,locZips97,freq97Hz,period97Hz] = findFreqZips(Data97Hz,TimeSteps97Hz);
fprintf(fmtfreqDisplay,97, freq97Hz);
[NumMaxs97z,NumMins97z,LocMaxs97z,LocMins97z,LocMaxVals97z,LocMinVals97z]...
    = LocalMaxMinFind(Data97Hz);
Amp97Hz = mean(LocMaxVals97z);
fprintf(fmtAmp,samRate97,Amp97Hz);

%105
[NumCycs105,locZips105,freq105Hz,period105Hz] = findFreqZips(Data105Hz,TimeSteps105Hz);
fprintf(fmtfreqDisplay,105, freq105Hz);
[NumMaxs105z,NumMins105z,LocMaxs105z,LocMins105z,LocMaxVals105z,LocMinVals105z]...
    = LocalMaxMinFind(Data105Hz);
Amp105Hz = mean(LocMaxVals105z);
fprintf(fmtAmp,samRate105,Amp105Hz);
%112
[NumCycs112,locZips112,freq112Hz,period112Hz] = findFreqZips(Data112Hz,TimeSteps112Hz);
fprintf(fmtfreqDisplay,112, freq112Hz);
[NumMaxs112z,NumMins112z,LocMaxs112z,LocMins112z,LocMaxVals112z,LocMinVals112z]...
    = LocalMaxMinFind(Data112Hz);
Amp112Hz = mean(LocMaxVals112z);
fprintf(fmtAmp,samRate112,Amp112Hz);

%120
[NumCycs120,locZips120,freq120Hz,period120Hz] = findFreqZips(Data120Hz,TimeSteps120Hz);
fprintf(fmtfreqDisplay,120, freq120Hz);
[NumMaxs120z,NumMins120z,LocMaxs120z,LocMins120z,LocMaxVals120z,LocMinVals120z]...
    = LocalMaxMinFind(Data120Hz);
Amp120Hz = mean(LocMaxVals120z);
fprintf(fmtAmp,samRate120,Amp120Hz);

%135
[NumCycs135,locZips135,freq135Hz,period135Hz] = findFreqZips(Data135Hz,TimeSteps135Hz);
fprintf(fmtfreqDisplay,135, freq135Hz);
[NumMaxs135z,NumMins135z,LocMaxs135z,LocMins135z,LocMaxVals135z,LocMinVals135z]...
    = LocalMaxMinFind(Data135Hz);
Amp135Hz = mean(LocMaxVals135z);
fprintf(fmtAmp,samRate135,Amp135Hz);

%150
[NumCycs150,locZips150,freq150Hz,period150Hz] = findFreqZips(Data150Hz,TimeSteps150Hz);
fprintf(fmtfreqDisplay,150, freq150Hz);
[NumMaxs150z,NumMins150z,LocMaxs150z,LocMins150z,LocMaxVals150z,LocMinVals150z]...
    = LocalMaxMinFind(Data150Hz);
Amp150Hz = mean(LocMaxVals150z);
fprintf(fmtAmp,samRate150,Amp150Hz);

%180
[NumCycs180,locZips180,freq180Hz,period180Hz] = findFreqZips(Data180Hz,TimeSteps180Hz);
fprintf(fmtfreqDisplay,180, freq180Hz);
[NumMaxs180z,NumMins180z,LocMaxs180z,LocMins180z,LocMaxVals180z,LocMinVals180z]...
    = LocalMaxMinFind(Data180Hz);
Amp180Hz = mean(LocMaxVals180z);
fprintf(fmtAmp,samRate180,Amp180Hz);

%210
[NumCycs210,locZips210,freq210Hz,period210Hz] = findFreqZips(Data210Hz,TimeSteps210Hz);
fprintf(fmtfreqDisplay,210, freq210Hz);
[NumMaxs210z,NumMins210z,LocMaxs210z,LocMins210z,LocMaxVals210z,LocMinVals210z]...
    = LocalMaxMinFind(Data210Hz);
Amp210Hz = mean(LocMaxVals210z);
fprintf(fmtAmp,samRate210,Amp210Hz);
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
%
ErrPer30Hz = abs(((freq30Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,30,ErrPer30Hz);
%
ErrPer31Hz = abs(((freq31Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,31,ErrPer31Hz);
%
ErrPer35Hz = abs(((freq35Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,35,ErrPer35Hz);
%
ErrPer40Hz = abs(((freq40Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,40,ErrPer40Hz);
%
ErrPer45Hz = abs(((freq45Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,45,ErrPer45Hz);
%50 
ErrPer50Hz = abs(((freq50Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,50,ErrPer50Hz);
%52
ErrPer52Hz = abs(((freq52Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,52,ErrPer52Hz);
%55
ErrPer55Hz = abs(((freq55Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,55,ErrPer55Hz);
% 60
ErrPer60Hz = abs(((freq60Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,60,ErrPer60Hz);
%67
ErrPer67Hz = abs(((freq67Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,67,ErrPer67Hz);
%75
ErrPer75Hz = abs(((freq75Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,75,ErrPer75Hz);
%90
ErrPer90Hz = abs(((freq90Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,90,ErrPer90Hz);
%97
ErrPer97Hz = abs(((freq97Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,97,ErrPer97Hz);
%105
ErrPer105Hz = abs(((freq105Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,105,ErrPer105Hz);
%112
ErrPer112Hz = abs(((freq112Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,112,ErrPer112Hz);
%120
ErrPer120Hz = abs(((freq120Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,120,ErrPer120Hz);
%135
ErrPer135Hz = abs(((freq135Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,135,ErrPer135Hz);
%150
ErrPer150Hz = abs(((freq150Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,150,ErrPer150Hz);
%180
ErrPer180Hz = abs(((freq180Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,180,ErrPer180Hz);
%210
ErrPer210Hz = abs(((freq210Hz-freq1000Hz)/freq1000Hz)*100);
fprintf(fmtPerErr,210,ErrPer210Hz);
% 240
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

%31
NFFT31Hz = 2^nextpow2(L31Hz);
Fs31Data = fft(Data31Hz,NFFT31Hz)/L31Hz;
Fv31Hz = samRate31/2*linspace(0,1,NFFT31Hz/2+1);

%35
NFFT35Hz = 2^nextpow2(L35Hz);
Fs35Data = fft(Data35Hz,NFFT35Hz)/L35Hz;
Fv35Hz = samRate35/2*linspace(0,1,NFFT35Hz/2+1);

%40
NFFT40Hz = 2^nextpow2(L40Hz);
Fs40Data = fft(Data40Hz,NFFT40Hz)/L40Hz;
Fv40Hz = samRate40/2*linspace(0,1,NFFT40Hz/2+1);

%45
NFFT45Hz = 2^nextpow2(L45Hz);
Fs45Data = fft(Data45Hz,NFFT45Hz)/L45Hz;
Fv45Hz = samRate45/2*linspace(0,1,NFFT45Hz/2+1);

%50
NFFT50Hz = 2^nextpow2(L50Hz);
Fs50Data = fft(Data50Hz,NFFT50Hz)/L50Hz;
Fv50Hz = samRate50/2*linspace(0,1,NFFT50Hz/2+1);

%52
NFFT52Hz = 2^nextpow2(L52Hz);
Fs52Data = fft(Data52Hz,NFFT52Hz)/L52Hz;
Fv52Hz = samRate52/2*linspace(0,1,NFFT52Hz/2+1);

%55
NFFT55Hz = 2^nextpow2(L55Hz);
Fs55Data = fft(Data55Hz,NFFT55Hz)/L55Hz;
Fv55Hz = samRate55/2*linspace(0,1,NFFT55Hz/2+1);

%60
NFFT60Hz = 2^nextpow2(L60Hz);
Fs60Data = fft(Data60Hz,NFFT60Hz)/L60Hz;
Fv60Hz = samRate60/2*linspace(0,1,NFFT60Hz/2+1);

%67
NFFT67Hz = 2^nextpow2(L67Hz);
Fs67Data = fft(Data67Hz,NFFT67Hz)/L67Hz;
Fv67Hz = samRate67/2*linspace(0,1,NFFT67Hz/2+1);

%75
NFFT75Hz = 2^nextpow2(L75Hz);
Fs75Data = fft(Data75Hz,NFFT75Hz)/L75Hz;
Fv75Hz = samRate75/2*linspace(0,1,NFFT75Hz/2+1);

%90
NFFT90Hz = 2^nextpow2(L90Hz);
Fs90Data = fft(Data90Hz,NFFT90Hz)/L90Hz;
Fv90Hz = samRate90/2*linspace(0,1,NFFT90Hz/2+1);

%97
NFFT97Hz = 2^nextpow2(L97Hz);
Fs97Data = fft(Data97Hz,NFFT97Hz)/L97Hz;
Fv97Hz = samRate97/2*linspace(0,1,NFFT97Hz/2+1);

%105
NFFT105Hz = 2^nextpow2(L105Hz);
Fs105Data = fft(Data105Hz,NFFT105Hz)/L105Hz;
Fv105Hz = samRate105/2*linspace(0,1,NFFT105Hz/2+1);

%112
NFFT112Hz = 2^nextpow2(L112Hz);
Fs112Data = fft(Data112Hz,NFFT112Hz)/L112Hz;
Fv112Hz = samRate112/2*linspace(0,1,NFFT112Hz/2+1);

%120
NFFT120Hz = 2^nextpow2(L120Hz);
Fs120Data = fft(Data120Hz,NFFT120Hz)/L120Hz;
Fv120Hz = samRate120/2*linspace(0,1,NFFT120Hz/2+1);


%135
NFFT135Hz = 2^nextpow2(L135Hz);
Fs135Data = fft(Data135Hz,NFFT135Hz)/L135Hz;
Fv135Hz = samRate135/2*linspace(0,1,NFFT135Hz/2+1);


%150
NFFT150Hz = 2^nextpow2(L150Hz);
Fs150Data = fft(Data150Hz,NFFT150Hz)/L150Hz;
Fv150Hz = samRate150/2*linspace(0,1,NFFT150Hz/2+1);

%180
NFFT180Hz = 2^nextpow2(L180Hz);
Fs180Data = fft(Data180Hz,NFFT180Hz)/L180Hz;
Fv180Hz = samRate180/2*linspace(0,1,NFFT180Hz/2+1);

%210
NFFT210Hz = 2^nextpow2(L210Hz);
Fs210Data = fft(Data210Hz,NFFT210Hz)/L210Hz;
Fv210Hz = samRate210/2*linspace(0,1,NFFT210Hz/2+1);


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
% new

% 31Hz
figure(4)
subplot(2,1,1)
Plot31HzFreqPlot = plot(TimeSteps31Hz,Data31Hz,'b-*');
title1=title('31Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
Plot31HzFreqPlot.LineWidth=2;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(2,1,2)
FNFSPlot = plot(Fv31Hz,2*abs(Fs31Data(1:NFFT31Hz/2+1)),'r-h'); 
title1=title('31Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
FNFSPlot.LineWidth = 2;
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 30]);
% new

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

% 40Hz
figure(6)
subplot(2,1,1)
Plot40HzFreqPlot = plot(TimeSteps40Hz,Data40Hz,'b-*');
Plot40HzFreqPlot.LineWidth=2;
title1=title('40Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(2,1,2)
FS40HzFs = plot(Fv40Hz,2*abs(Fs40Data(1:NFFT40Hz/2+1)),'r-h');
FS40HzFs.LineWidth=2;
title1=title('40Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 50]);

% 45Hz
figure(7)
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
xlim([0, 50]);

% 50Hz
figure(8)
subplot(1,2,1)
Plot50HzFreqPlot = plot(TimeSteps50Hz,Data50Hz,'-*');
title1=title('50Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv50Hz,2*abs(Fs50Data(1:NFFT50Hz/2+1))) 
title1=title('50Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 50]);
% new

% 52Hz
figure(8)
subplot(1,2,1)
Plot52HzFreqPlot = plot(TimeSteps52Hz,Data52Hz,'-*');
title1=title('52Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv52Hz,2*abs(Fs52Data(1:NFFT52Hz/2+1))) 
title1=title('52Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 60]);
% new 

% 55Hz
figure(9)
subplot(1,2,1)
Plot55HzFreqPlot = plot(TimeSteps55Hz,Data55Hz,'-*');
title1=title('55Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv55Hz,2*abs(Fs55Data(1:NFFT55Hz/2+1))) 
title1=title('55Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 60]);
% new

% 60Hz
figure(9)
subplot(1,2,1)
Plot60HzFreqPlot = plot(TimeSteps60Hz,Data60Hz,'-*');
title1=title('60Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
% freq domain
plot(Fv60Hz,2*abs(Fs60Data(1:NFFT60Hz/2+1))) 
title1=title('60Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 75]);
% new

% 67Hz
figure(10)
subplot(1,2,1)
Plot67HzFreqPlot = plot(TimeSteps67Hz,Data67Hz,'-*');
title1=title('67Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
% freq domain
plot(Fv67Hz,2*abs(Fs67Data(1:NFFT67Hz/2+1))) 
title1=title('67Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 75]);
% new

% 75Hz
figure(11)
subplot(1,2,1)
Plot75HzFreqPlot = plot(TimeSteps75Hz,Data75Hz,'-*');
title1=title('75Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
% freq domain
plot(Fv75Hz,2*abs(Fs75Data(1:NFFT75Hz/2+1))) 
title1=title('75Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 90]);
% end 75
% new

% 90Hz
figure(12)
subplot(1,2,1)
Plot90HzFreqPlot = plot(TimeSteps90Hz,Data90Hz,'-*');
title1=title('90Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
% freq domain
plot(Fv90Hz,2*abs(Fs90Data(1:NFFT90Hz/2+1))) 
title1=title('90Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 100]);
% end 90
% new

% 97Hz
figure(13)
subplot(1,2,1)
Plot97HzFreqPlot = plot(TimeSteps97Hz,Data97Hz,'-*');
title1=title('97Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
% freq domain
plot(Fv97Hz,2*abs(Fs97Data(1:NFFT97Hz/2+1))) 
title1=title('97Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 100]);
% end 97
% new

% 105Hz
figure(14)
subplot(1,2,1)
Plot105HzFreqPlot = plot(TimeSteps105Hz,Data105Hz,'-*');
title1=title('105Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
% freq domain
plot(Fv105Hz,2*abs(Fs105Data(1:NFFT105Hz/2+1))) 
title1=title('105Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 110]);
% end 105
% new

% 112Hz
figure(15)
subplot(1,2,1)
Plot112HzFreqPlot = plot(TimeSteps112Hz,Data112Hz,'-*');
title1=title('112Hz sampling rate Time Domain');
YLab1= ylabel({'Voltage','(V)'});
XLab1= xlabel({'Time','(S)'});
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
% freq domain
plot(Fv112Hz,2*abs(Fs112Data(1:NFFT112Hz/2+1))) 
title1=title('112Hz sampling rate Frequency Domain');
XLab1= xlabel({'Frequency','(Hz)'});
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
xlim([0, 110]);
% end 112
% new

% 120Hz
figure(16)
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
% end 120
% new


% 135Hz
figure(17)
subplot(1,2,1)
Plot135HzFreqPlot = plot(TimeSteps135Hz,Data135Hz,'-*');
title1=title('135Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv135Hz,2*abs(Fs135Data(1:NFFT135Hz/2+1))) 
title1=title('135Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
% end 135
% new


% 150Hz
figure(18)
subplot(1,2,1)
Plot150HzFreqPlot = plot(TimeSteps150Hz,Data150Hz,'-*');
title1=title('150Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv150Hz,2*abs(Fs150Data(1:NFFT150Hz/2+1))) 
title1=title('150Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
% end 150
% new
% 180Hz
figure(19)
subplot(1,2,1)
Plot180HzFreqPlot = plot(TimeSteps180Hz,Data180Hz,'-*');
title1=title('180Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv180Hz,2*abs(Fs180Data(1:NFFT180Hz/2+1))) 
title1=title('180Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
% end 180

% new
% 210Hz
figure(20)
subplot(1,2,1)
Plot210HzFreqPlot = plot(TimeSteps210Hz,Data210Hz,'-*');
title1=title('210Hz sampling rate Time Domain');
YLab1= ylabel('Voltage');
XLab1= xlabel('Time');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
ylim([-6,6]);
xlim([-.1,1.1]);
subplot(1,2,2)
plot(Fv210Hz,2*abs(Fs210Data(1:NFFT210Hz/2+1))) 
title1=title('210Hz sampling rate Frequency Domain');
XLab1= xlabel('Frequency (Hz)');
YLab1= ylabel('Magnitude');
title1.FontSize = 12;
YLab1.FontSize = 12;
XLab1.FontSize = 12;
% end 210
% new

% 240Hz
figure(21)
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
figure(22)
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

figure(23)
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
figure(24)
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

figure(25)
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
%
[ampAtMainFreq20Hz,IVFreq20Hz] = max(2*abs(Fs20Data(1:NFFT20Hz/2+1)));
Mainfreq20Hz = Fv20Hz(IVFreq20Hz);
disp(Mainfreq20Hz);
%
[ampAtMainFreq25Hz,IVFreq25Hz] = max(2*abs(Fs25Data(1:NFFT25Hz/2+1)));
Mainfreq25Hz = Fv25Hz(IVFreq25Hz);
disp(Mainfreq25Hz);
%
[ampAtMainFreq30Hz,IVFreq30Hz] = max(2*abs(Fs30Data(1:NFFT30Hz/2+1)));
Mainfreq30Hz = Fv30Hz(IVFreq30Hz);
disp(Mainfreq30Hz);
%
[ampAtMainFreq31Hz,IVFreq31Hz] = max(2*abs(Fs31Data(1:NFFT31Hz/2+1)));
Mainfreq31Hz = Fv31Hz(IVFreq31Hz);
disp(Mainfreq31Hz);
%
[ampAtMainFreq35Hz,IVFreq35Hz] = max(2*abs(Fs35Data(1:NFFT35Hz/2+1)));
Mainfreq35Hz = Fv35Hz(IVFreq35Hz);
disp(Mainfreq35Hz);

%
[ampAtMainFreq40Hz,IVFreq40Hz] = max(2*abs(Fs40Data(1:NFFT40Hz/2+1)));
Mainfreq40Hz = Fv40Hz(IVFreq40Hz);
disp(Mainfreq40Hz);
%
[ampAtMainFreq45Hz,IVFreq45Hz] = max(2*abs(Fs45Data(1:NFFT45Hz/2+1)));
Mainfreq45Hz = Fv45Hz(IVFreq45Hz);
disp(Mainfreq45Hz);
%50
[ampAtMainFreq50Hz,IVFreq50Hz] = max(2*abs(Fs50Data(1:NFFT50Hz/2+1)));
Mainfreq50Hz = Fv50Hz(IVFreq50Hz);
disp(Mainfreq50Hz);
% 52
[ampAtMainFreq52Hz,IVFreq52Hz] = max(2*abs(Fs52Data(1:NFFT52Hz/2+1)));
Mainfreq52Hz = Fv52Hz(IVFreq52Hz);
disp(Mainfreq52Hz);
% 55
[ampAtMainFreq55Hz,IVFreq55Hz] = max(2*abs(Fs55Data(1:NFFT55Hz/2+1)));
Mainfreq55Hz = Fv55Hz(IVFreq55Hz);
disp(Mainfreq55Hz);
%
[ampAtMainFreq60Hz,IVFreq60Hz] = max(2*abs(Fs60Data(1:NFFT60Hz/2+1)));
Mainfreq60Hz = Fv60Hz(IVFreq60Hz);
disp(Mainfreq60Hz);
%
[ampAtMainFreq67Hz,IVFreq67Hz] = max(2*abs(Fs67Data(1:NFFT67Hz/2+1)));
Mainfreq67Hz = Fv67Hz(IVFreq67Hz);
disp(Mainfreq67Hz);
%
%
[ampAtMainFreq75Hz,IVFreq75Hz] = max(2*abs(Fs75Data(1:NFFT75Hz/2+1)));
Mainfreq75Hz = Fv75Hz(IVFreq75Hz);
disp(Mainfreq75Hz);
%
%
%
[ampAtMainFreq90Hz,IVFreq90Hz] = max(2*abs(Fs90Data(1:NFFT90Hz/2+1)));
Mainfreq90Hz = Fv90Hz(IVFreq90Hz);
disp(Mainfreq90Hz);
%
[ampAtMainFreq97Hz,IVFreq97Hz] = max(2*abs(Fs97Data(1:NFFT97Hz/2+1)));
Mainfreq97Hz = Fv97Hz(IVFreq97Hz);
disp(Mainfreq97Hz);
%
%
%
[ampAtMainFreq105Hz,IVFreq105Hz] = max(2*abs(Fs105Data(1:NFFT105Hz/2+1)));
Mainfreq105Hz = Fv105Hz(IVFreq105Hz);
disp(Mainfreq105Hz);
%
[ampAtMainFreq112Hz,IVFreq112Hz] = max(2*abs(Fs112Data(1:NFFT112Hz/2+1)));
Mainfreq112Hz = Fv112Hz(IVFreq112Hz);
disp(Mainfreq112Hz);
%
%
%
[ampAtMainFreq120Hz,IVFreq120Hz] = max(2*abs(Fs120Data(1:NFFT120Hz/2+1)));
Mainfreq120Hz = Fv120Hz(IVFreq120Hz);
disp(Mainfreq120Hz);
%
%
[ampAtMainFreq135Hz,IVFreq135Hz] = max(2*abs(Fs135Data(1:NFFT135Hz/2+1)));
Mainfreq135Hz = Fv135Hz(IVFreq135Hz);
disp(Mainfreq135Hz);
%
%
[ampAtMainFreq150Hz,IVFreq150Hz] = max(2*abs(Fs150Data(1:NFFT150Hz/2+1)));
Mainfreq150Hz = Fv150Hz(IVFreq150Hz);
disp(Mainfreq150Hz);
%
[ampAtMainFreq180Hz,IVFreq180Hz] = max(2*abs(Fs180Data(1:NFFT180Hz/2+1)));
Mainfreq180Hz = Fv180Hz(IVFreq180Hz);
disp(Mainfreq180Hz);
%
[ampAtMainFreq210Hz,IVFreq210Hz] = max(2*abs(Fs210Data(1:NFFT210Hz/2+1)));
Mainfreq210Hz = Fv210Hz(IVFreq210Hz);
disp(Mainfreq210Hz);
%
[ampAtMainFreq240Hz,IVFreq240Hz] = max(2*abs(Fs240Data(1:NFFT240Hz/2+1)));
Mainfreq240Hz = Fv240Hz(IVFreq240Hz);
disp(Mainfreq240Hz);
%
[ampAtMainFreq1000Hz,IVFreq1000Hz] = max(2*abs(Fs1000Data(1:NFFT1000Hz/2+1)));
Mainfreq1000Hz = Fv1000Hz(IVFreq1000Hz);
disp(Mainfreq1000Hz);
%
FrequencyVals = [Mainfreq15Hz, Mainfreq20Hz, Mainfreq25Hz,...
    Mainfreq30Hz,Mainfreq31Hz, Mainfreq35Hz,Mainfreq40Hz,...
    Mainfreq45Hz,Mainfreq50Hz,...
    Mainfreq52Hz,Mainfreq55Hz,Mainfreq60Hz, Mainfreq67Hz,Mainfreq75Hz...
    ,Mainfreq90Hz,Mainfreq97Hz,Mainfreq105Hz,Mainfreq112Hz,...
    Mainfreq120Hz, Mainfreq135Hz,Mainfreq150Hz,Mainfreq180Hz,Mainfreq210Hz,...
    Mainfreq240Hz, 15];
AmpVals = [Amp15Hz, Amp20Hz, Amp25Hz,...
    Amp30Hz,Amp31Hz, Amp35Hz, Amp40Hz,...
    Amp45Hz, Amp50Hz,Amp52Hz,Amp55Hz, Amp60Hz, Amp67Hz, Amp75Hz,Amp90Hz,Amp97Hz ...
    ,Amp105Hz,Amp112Hz,Amp120Hz,Amp135Hz,Amp150Hz,Amp180Hz,Amp210Hz, Amp240Hz, Amp1000Hz];
SampRateNyquist = [samRate15/30, samRate20/30, samRate25/30,...
    samRate30/30,samRate31/30, samRate35/30,samRate40/30, samRate45/30,...
    samRate50/30,samRate52/30,samRate55/30,...
    samRate60/30,...
    samRate67/30, samRate75/30, samRate90/30,samRate97/30,samRate105/30,...
    samRate112/30,samRate120/30,samRate135/30,samRate150/30,samRate180/30,...
    samRate210/30,samRate240/30, samRate1000/30];
figure(26)
x = 0:40;
for i= 1:41
    yFreq(i)=15;
    yAmp(i)=5;
    yError(i) = 5*(1-cos(2*pi*(1/(4*i))-(pi*2))-5);
    ynegError(i) = 5*(1-cos(2*pi*(1/(4*i))-(2*pi)))-5;
end
plotFrequencys = plot(SampRateNyquist(1),FrequencyVals(1),'<'...
    ,SampRateNyquist(2),FrequencyVals(2),'d',SampRateNyquist(3)...
    ,FrequencyVals(3),'o',SampRateNyquist(4),FrequencyVals(4),'s'...
    ,SampRateNyquist(5),FrequencyVals(5),'+',SampRateNyquist(6),...
    FrequencyVals(6),'>',SampRateNyquist(7),FrequencyVals(7),'^',...
    SampRateNyquist(8),FrequencyVals(8),'x',SampRateNyquist(9),...
    FrequencyVals(9),'h',SampRateNyquist(10),...
    FrequencyVals(10),'*',SampRateNyquist(11),...
    FrequencyVals(11),'s',...
    SampRateNyquist(12),FrequencyVals(12),'x',...
    SampRateNyquist(13),FrequencyVals(13),'+',...
    SampRateNyquist(14),FrequencyVals(14),'h',...
    SampRateNyquist(15),FrequencyVals(15),'h',...
    SampRateNyquist(16),FrequencyVals(16),'h',...
    SampRateNyquist(17),FrequencyVals(17),'*',...
    SampRateNyquist(18),FrequencyVals(18),'*',...
    SampRateNyquist(19),FrequencyVals(19),'*',...
    SampRateNyquist(20),FrequencyVals(20),'*',...
    SampRateNyquist(21),FrequencyVals(21),'*',...
    SampRateNyquist(22),FrequencyVals(22),'*',...
    SampRateNyquist(23),FrequencyVals(23),'*',...
    SampRateNyquist(24),FrequencyVals(24),'*',...
    SampRateNyquist(25),FrequencyVals(25),'*',...
    SampRateNyquist,FrequencyVals,'k',x,yFreq,'r--');
Lgd2 = legend('15Hz','20Hz','25Hz','30Hz (f_{N})','31Hz','35Hz','40Hz','45Hz',...
    '50','52','55', '60','67','75',...
    '90','97','105','112',...
    '120Hz','135Hz','150','180','210',...
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
for i = 1:24
    plotFrequencys(i).LineWidth = 3;
    plotFrequencys(i).MarkerSize = 10;
end
%% Amplitude Plot
AMPPPPP = max(Data1000Hz)
figure(27)
plotAmps = plot(SampRateNyquist(1),AmpVals(1),'<'...
    ,SampRateNyquist(2),AmpVals(2),'d',SampRateNyquist(3)...
    ,AmpVals(3),'o',SampRateNyquist(4),AmpVals(4),'s'...
    ,SampRateNyquist(5),AmpVals(5),'+',SampRateNyquist(6),...
    AmpVals(6),'>',SampRateNyquist(7),AmpVals(7),'^'...
    ,SampRateNyquist(8),AmpVals(8),'x'...
    ,SampRateNyquist(9),AmpVals(9),'h'...
    ,SampRateNyquist(10),AmpVals(10),'*'...
    ,SampRateNyquist(11),AmpVals(11),'^'...
    ,SampRateNyquist(12),AmpVals(12),'s'...
    ,SampRateNyquist(13),AmpVals(13),'h'...
    ,SampRateNyquist(14),AmpVals(14),'s'...
    ,SampRateNyquist(15),AmpVals(15),'+'...
    ,SampRateNyquist(16),AmpVals(16),'*'...
    ,SampRateNyquist(17),AmpVals(17),'x'...
    ,SampRateNyquist(18),AmpVals(18),'s'...
    ,SampRateNyquist(19),AmpVals(19),'s'...
    ,SampRateNyquist(20),AmpVals(20),'s'...
    ,SampRateNyquist(21),AmpVals(21),'s'...
    ,SampRateNyquist(22),AmpVals(22),'s'...
    ,SampRateNyquist(23),AmpVals(23),'*'...
    ,SampRateNyquist(24),AmpVals(24),'*'...
    ,SampRateNyquist(25),AmpVals(25),'*'...
    ,SampRateNyquist,AmpVals,'k',x,yAmp,'r--',...
    x,yError,'k-',x,-ynegError,'k-');
Lgd2 = legend('15Hz','20Hz','25Hz','30Hz (f_{N})','31Hz',...
    '35Hz','40Hz','45Hz','50Hz','52','55','60','67','75','90','97',...
    '105','112','120Hz','135Hz','150Hz','180Hz','210Hz','240Hz','1000Hz');
XLab2 = xlabel({'sampling rate','(f_{N})'});
YLab2 = ylabel({'Amplitude acquired','(V)'});
title1=title('Signal Acquired Amplitude (V) vs Sample Rates frequency (f_{N})');
YLab2.FontSize = 12;
XLab2.FontSize = 12;
Lgd2.FontSize = 12;
title1.FontSize = 12;
ylim([0,7]);
xlim([-1,40]);
for i = 1:24
    plotAmps(i).LineWidth = 3;
    plotAmps(i).MarkerSize = 11;
end

%% theoretical bullshit

figure(28)
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

figure(29)
plot(x,yError,'k-',x,-ynegError,'r-');
legend('pos','neg')
%% file closing and tidying up
% fclose(FileID15Hz);
% fclose(FileID20Hz);
% fclose(FileID25Hz);
% fclose(FileID30Hz);
% fclose(FileID35Hz);
% fclose(FileID45Hz);
% fclose(FileID120Hz);
% fclose(FileID240Hz);
% fclose(FileID1000Hz);
% fclose(FileIDTest);

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