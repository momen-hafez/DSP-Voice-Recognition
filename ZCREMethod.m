clc
clear all;
trFiles_HiBoy    = dir('C:\DSP Project\training\HiBoy\*.wav');
trFiles_HiGirl   = dir('C:\DSP Project\training\HiGirl\*.wav');
trFiles_ByeBoy   = dir('C:\DSP Project\training\ByeBoy\*.wav');
trFiles_ByeGirl  = dir('C:\DSP Project\training\ByeGirl\*.wav');
tstFiles         = dir('C:\DSP Project\testing\*.wav');
% training files ---- HiBoy
HiBoy_data = [];
fprintf("Z1 : how the voice similar to be HiBoy\n");
fprintf("Z2 : how the voice similar to be ByeBoy\n");
fprintf("Z3 : how the voice similar to be HiGirl\n");
fprintf("Z4 : how the voice similar to be ByeGirl\n Z1 -- Z2 -- Z3 -- Z4\n");
for i = 1 : length(trFiles_HiBoy) 
    file_path = strcat(trFiles_HiBoy(i).folder,'\',trFiles_HiBoy(i).name);
    [y,fs] = audioread(file_path);
    bfil=fft(y); %fft of input signal
    wn=[4000 8000]/(fs/2);   %bandpass
   [b,a]=butter(6,wn);
    y=filter(b,a,y);
    afil=fft(y);
    subplot(2,1,1);plot(real(bfil));
    title('frequency respones of input signal');
    xlabel('frequency');ylabel('magnitude');
    subplot(2,1,2);plot(real(afil));
    title('frequency respones of filtered signal');
    xlabel('frequency');ylabel('magnitude');
    %now we are ging to devide the signal into 5 parts
    ZCRE_HiBoy1 = mean(abs(diff(sign(y(1 : floor(end/10))))))./ 2;
    ZCRE_HiBoy2 = mean(abs(diff(sign(y(floor(end/10) : floor(2 * end/10))))))./ 2;
    ZCRE_HiBoy3 = mean(abs(diff(sign(y(floor(2 * end/10) : floor(3 * end/10))))))./ 2;
    ZCRE_HiBoy4 = mean(abs(diff(sign(y(floor(3 * end/10) : floor(4 * end/10))))))./ 2;
    ZCRE_HiBoy5 = mean(abs(diff(sign(y(floor(4 * end/10) : floor(5 * end/10))))))./ 2;
    ZCRE_HiBoy6 = mean(abs(diff(sign(y(floor(5 * end/10) : floor(6 * end/10))))))./ 2;
    ZCRE_HiBoy7 = mean(abs(diff(sign(y(floor(6 * end/10) : floor(7 * end/10))))))./ 2;
    ZCRE_HiBoy8 = mean(abs(diff(sign(y(floor(7 * end/10) : floor(8 * end/10))))))./ 2;
    ZCRE_HiBoy9 = mean(abs(diff(sign(y(floor(8 * end/10) : floor(9 * end/10))))))./ 2;
    ZCRE_HiBoy10 = mean(abs(diff(sign(y(floor(9 * end/10) : end)))))./ 2;

    Energy = sum(y.^2); 
    ZCRE_HiBoy = [ZCRE_HiBoy1 ZCRE_HiBoy2 ZCRE_HiBoy3 ZCRE_HiBoy4 ZCRE_HiBoy5 ZCRE_HiBoy6 ZCRE_HiBoy7 ZCRE_HiBoy8 ZCRE_HiBoy9 ZCRE_HiBoy10 mean(Energy)];
    HiBoy_data = [HiBoy_data; ZCRE_HiBoy;];
end
ZCRE_HiBoy = mean(HiBoy_data);
% training files ---- ByeBoy
ByeBoy_data = [];
for i = 1 : length(trFiles_ByeBoy) 
    file_path = strcat(trFiles_ByeBoy(i).folder,'\',trFiles_ByeBoy(i).name);
    [y,fs] = audioread(file_path);
    wn=[4000 8000]/(fs/2);   %bandpass
   [b,a]=butter(6,wn);
    y=filter(b,a,y);
    %now wbe are ging to devide the signal into 5 parts
    ZCRE_ByeBoy1 = mean(abs(diff(sign(y(1 : floor(end/10))))))./ 2;
    ZCRE_ByeBoy2 = mean(abs(diff(sign(y(floor(end/10) : floor(2 * end/10))))))./ 2;
    ZCRE_ByeBoy3 = mean(abs(diff(sign(y(floor(2 * end/10) : floor(3 * end/10))))))./ 2;
    ZCRE_ByeBoy4 = mean(abs(diff(sign(y(floor(3 * end/10) : floor(4 * end/10))))))./ 2;
    ZCRE_ByeBoy5 = mean(abs(diff(sign(y(floor(4 * end/10) : floor(5 * end/10))))))./ 2;
    ZCRE_ByeBoy6 = mean(abs(diff(sign(y(floor(5 * end/10) : floor(6 * end/10))))))./ 2;
    ZCRE_ByeBoy7 = mean(abs(diff(sign(y(floor(6 * end/10) : floor(7 * end/10))))))./ 2;
    ZCRE_ByeBoy8 = mean(abs(diff(sign(y(floor(7 * end/10) : floor(8 * end/10))))))./ 2;
    ZCRE_ByeBoy9 = mean(abs(diff(sign(y(floor(8 * end/10) : floor(9 * end/10))))))./ 2;
    ZCRE_ByeBoy10 = mean(abs(diff(sign(y(floor(9 * end/10) : end)))))./ 2;
    Energy = sum((y).^2);
    ZCRE_ByeBoy = [ZCRE_ByeBoy1 ZCRE_ByeBoy2 ZCRE_ByeBoy3 ZCRE_ByeBoy4 ZCRE_ByeBoy5 ZCRE_ByeBoy6 ZCRE_ByeBoy7 ZCRE_ByeBoy8 ZCRE_ByeBoy9 ZCRE_ByeBoy10 mean(Energy)];
    ByeBoy_data = [ByeBoy_data; ZCRE_ByeBoy;];
end
ZCRE_ByeBoy = mean(ByeBoy_data);
% training files ---- HiGirl ;
HiGirl_data = [];
for i = 1 : length(trFiles_HiGirl) 
    file_path = strcat(trFiles_HiGirl(i).folder,'\',trFiles_HiGirl(i).name);
    [y,fs] = audioread(file_path);
    wn=[4000 8000]/(fs/2);   %bandpass
   [b,a]=butter(6,wn);
    y=filter(b,a,y);
    %now we are ging to devide the signal into 5 parts
    ZCRE_HiGirl1 = mean(abs(diff(sign(y(1 : floor(end/10))))))./ 2;
    ZCRE_HiGirl2 = mean(abs(diff(sign(y(floor(end/10) : floor(2 * end/10))))))./ 2;
    ZCRE_HiGirl3 = mean(abs(diff(sign(y(floor(2 * end/10) : floor(3 * end/10))))))./ 2;
    ZCRE_HiGirl4 = mean(abs(diff(sign(y(floor(3 * end/10) : floor(4 * end/10))))))./ 2;
    ZCRE_HiGirl5 = mean(abs(diff(sign(y(floor(4 * end/10) : floor(5 * end/10))))))./ 2;
    ZCRE_HiGirl6 = mean(abs(diff(sign(y(floor(5 * end/10) : floor(6 * end/10))))))./ 2;
    ZCRE_HiGirl7 = mean(abs(diff(sign(y(floor(6 * end/10) : floor(7 * end/10))))))./ 2;
    ZCRE_HiGirl8 = mean(abs(diff(sign(y(floor(7 * end/10) : floor(8 * end/10))))))./ 2;
    ZCRE_HiGirl9 = mean(abs(diff(sign(y(floor(8 * end/10) : floor(9 * end/10))))))./ 2;
    ZCRE_HiGirl10 = mean(abs(diff(sign(y(floor(9 * end/10) : end)))))./ 2;
    Energy = sum((y).^2);
    ZCRE_HiGirl = [ZCRE_HiGirl1 ZCRE_HiGirl2 ZCRE_HiGirl3 ZCRE_HiGirl4 ZCRE_HiGirl5 ZCRE_HiGirl6 ZCRE_HiGirl7 ZCRE_HiGirl8 ZCRE_HiGirl9 ZCRE_HiGirl10 mean(Energy)];
    HiGirl_data = [HiGirl_data; ZCRE_HiGirl;];
end
ZCRE_HiGirl = mean(HiGirl_data);
% training files ---- ByeGirl
ByeGirl_data = [];
for i = 1 : length(trFiles_ByeGirl) 
    file_path = strcat(trFiles_ByeGirl(i).folder,'\',trFiles_ByeGirl(i).name);
    [y,fs] = audioread(file_path);
    wn=[4000 8000]/(fs/2);   %bandpass
   [b,a]=butter(6,wn);
    y=filter(b,a,y);

    %now we are ging to devide the signal into 5 parts
    ZCRE_ByeGirl1 = mean(abs(diff(sign(y(1 : floor(end/10))))))./ 2;
    ZCRE_ByeGirl2 = mean(abs(diff(sign(y(floor(end/10) : floor(2 * end/10))))))./ 2;
    ZCRE_ByeGirl3 = mean(abs(diff(sign(y(floor(2 * end/10) : floor(3 * end/10))))))./ 2;
    ZCRE_ByeGirl4 = mean(abs(diff(sign(y(floor(3 * end/10) : floor(4 * end/10))))))./ 2;
    ZCRE_ByeGirl5 = mean(abs(diff(sign(y(floor(4 * end/10) : floor(5 * end/10))))))./ 2;
    ZCRE_ByeGirl6 = mean(abs(diff(sign(y(floor(5 * end/10) : floor(6 * end/10))))))./ 2;
    ZCRE_ByeGirl7 = mean(abs(diff(sign(y(floor(6 * end/10) : floor(7 * end/10))))))./ 2;
    ZCRE_ByeGirl8 = mean(abs(diff(sign(y(floor(7 * end/10) : floor(8 * end/10))))))./ 2;
    ZCRE_ByeGirl9 = mean(abs(diff(sign(y(floor(8 * end/10) : floor(9 * end/10))))))./ 2;
    ZCRE_ByeGirl10 = mean(abs(diff(sign(y(floor(9 * end/10) : end)))))./ 2;    
    Energy = sum((y).^2);
    ZCRE_ByeGirl = [ZCRE_ByeGirl1 ZCRE_ByeGirl2 ZCRE_ByeGirl3 ZCRE_ByeGirl4 ZCRE_ByeGirl5 ZCRE_ByeGirl6 ZCRE_ByeGirl7 ZCRE_ByeGirl8 ZCRE_ByeGirl9 ZCRE_ByeGirl10 mean(Energy)];
    ByeGirl_data  = [ByeGirl_data; ZCRE_ByeGirl;];
end
ZCRE_ByeGirl = mean(ByeGirl_data);
% testing files
%-------------------------------------------------------------------------------------------------
for i = 1 : length(tstFiles) 
    file_path = strcat(tstFiles(i).folder,'\',tstFiles(i).name);
    [y,fs] = audioread(file_path);
    wn=[4000 8000]/(fs/2);   %bandpass
   [b,a]=butter(6,wn);
    y=filter(b,a,y);
    %now we are ging to devide the signal into 5 parts
    ZCRE_T1 = mean(abs(diff(sign(y(1 : floor(end/10))))))./ 2;
    ZCRE_T2 = mean(abs(diff(sign(y(floor(end/10) : floor(2 * end/10))))))./ 2;
    ZCRE_T3 = mean(abs(diff(sign(y(floor(2 * end/10) : floor(3 * end/10))))))./ 2;
    ZCRE_T4 = mean(abs(diff(sign(y(floor(3 * end/10) : floor(4 * end/10))))))./ 2;
    ZCRE_T5 = mean(abs(diff(sign(y(floor(4 * end/10) : floor(5 * end/10))))))./ 2;
    ZCRE_T6 = mean(abs(diff(sign(y(floor(5 * end/10) : floor(6 * end/10))))))./ 2;
    ZCRE_T7 = mean(abs(diff(sign(y(floor(6 * end/10) : floor(7 * end/10))))))./ 2;
    ZCRE_T8 = mean(abs(diff(sign(y(floor(7 * end/10) : floor(8 * end/10))))))./ 2;
    ZCRE_T9 = mean(abs(diff(sign(y(floor(8 * end/10) : floor(9 * end/10))))))./ 2;
    ZCRE_T10 = mean(abs(diff(sign(y(floor(9 * end/10) : end)))))./ 2;      Energy = sum((y).^2);
    ZCRE_HiBoyT = [ZCRE_T1 ZCRE_T2 ZCRE_T3 ZCRE_T4 ZCRE_T5 ZCRE_T6 ZCRE_T7 ZCRE_T8 ZCRE_T9 ZCRE_T10 mean(Energy)];
    z1 = 0;
    if (pdist([ZCRE_HiBoyT; ZCRE_HiBoy;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_HiGirl;],'cosine'))
        z1 = z1 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_HiBoy;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_ByeGirl;],'cosine'))
        z1 = z1 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_HiBoy;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_ByeBoy;],'cosine'))
        z1 = z1 + 1;
    end  
    z2 = 0;
    if (pdist([ZCRE_HiBoyT; ZCRE_ByeBoy;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_HiGirl;],'cosine'))
        z2 = z2 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_ByeBoy;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_ByeGirl;],'cosine'))
        z2 = z2 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_ByeBoy;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_HiBoy;],'cosine'))
        z2 = z2 + 1;
    end 
    z3 = 0;
    if (pdist([ZCRE_HiBoyT; ZCRE_HiGirl;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_HiBoy;],'cosine'))
        z3 = z3 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_HiGirl;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_ByeGirl;],'cosine'))
        z3 = z3 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_HiGirl;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_ByeBoy;],'cosine'))
        z3 = z3 + 1;
    end 
    z4 = 0;
    if (pdist([ZCRE_HiBoyT; ZCRE_ByeGirl;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_HiBoy;],'cosine'))
        z4 = z4 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_ByeGirl;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_HiGirl;],'cosine'))
        z4 = z4 + 1;
    end    
    if (pdist([ZCRE_HiBoyT; ZCRE_ByeGirl;],'cosine') < pdist([ZCRE_HiBoyT; ZCRE_ByeBoy;],'cosine'))
        z4 = z4 + 1;
    end 
    fprintf("%d -- %d -- %d -- %d\n",z1,z2,z3,z4);
    if(z1 == 3)
         fprintf('Test file    %s classified as HiBoy\n',tstFiles(i).name);
    elseif(z2 == 3)
         fprintf('Test file    %s classified as ByeBoy\n',tstFiles(i).name)
    elseif(z3 == 3)
         fprintf('Test file    %s classified as HiGirl\n',tstFiles(i).name) 
    elseif(z4 == 3)
         fprintf('Test file    %s classified as ByeGirl\n',tstFiles(i).name)     
    end
end    
        

