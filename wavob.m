
clear; clc; close all;

[filename, pathname] = uigetfile('*.wav', '选择一个 WAV 文件');
if isequal(filename,0)
    return;
end
filepath = fullfile(pathname, filename);

[x, fs] = audioread(filepath);
t = (0:length(x)-1) / fs;
figure;
plot(t, x);
xlabel('Time (seconds)');
ylabel('Amplitude');
title(['Waveform of ', filename]);
grid on;
if size(x,2) == 2
    figure;
    subplot(2,1,1);
    plot(t, x(:,1));
    title('Left Channel');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;

    subplot(2,1,2);
    plot(t, x(:,2));
    title('Right Channel');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
end

