rec = audiorecorder(50000 , 24 , 1);
for i = 1 : 5
    fprintf("Start the %d th audio: \n",i);
    recordblocking(rec , 3);
    fprintf("Audio %d is DONE \n",i);
    Y = getaudiodata(rec);
    Y = Y - mean(Y);
    fname = sprintf('testing/HiB%d.wav',i);
    audiowrite(fname , Y , rec.SampleRate);
    
end    
    
    