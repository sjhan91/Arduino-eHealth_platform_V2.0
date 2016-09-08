clc;
clear all;
delete(instrfindall);

% serial communication
s = serial('COM11');
set(s, 'BaudRate', 115200);
fopen(s);
flushinput(s);

% initialize
ecg = zeros(1, 1);
airflow = zeros(1, 1);
spo2 = zeros(1, 1);
pos = zeros(1, 1);
temp = zeros(1, 1);
pulse = zeros(1, 1);
gsr = zeros(1, 1);
timestamp = zeros(1, 1);

new_data = zeros(1, 2);
old_time = clock;

% Ctrl + c if you want to stop and check results
% beacause MATLAB does not support breaking loop by keypress
while 1
    try
        new_data = str2num(fscanf(s));

        switch new_data(1)
            case 1 % ECG
                % Sampling rate
                new_timestamp = etime(clock, old_time);
                timestamp = [timestamp; new_timestamp];
                old_time = clock;
                
                ecg = [ecg; new_data(2)];
            case 2 % Airflow
                airflow = [airflow; new_data(2)];              
            case 3 % GSR     
                gsr = [gsr; new_data(2)];              
            case 4 % Spo2
                spo2 = [spo2; new_data(2)];
            case 5 % Pulse
                pulse = [pulse; new_data(2)];
            case 6 % Temperature
                temp = [temp; new_data(2)];
            case 7 % Position
                pos = [pos; new_data(2)];
        end;
    catch
        continue;
    end;
end;

% to measure sampling rate
% sprintf('Sampling rate: %f Hz', 1 / mean(timestamp(3:end)))

fclose(s);

clc;
clear all;
delete(instrfindall);