rec = audiorecorder(50000,24,1);
fprintf("SPEAK ! \n");
recordblocking(rec , 3);
fprintf("DONE!\n");

y = getaudiodata(rec);
y = y - mean(y);
figure
play(rec)
plot(y);