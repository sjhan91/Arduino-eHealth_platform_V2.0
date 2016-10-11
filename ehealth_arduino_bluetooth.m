clc;
clear all;
delete(instrfindall);

% bluetooth communication
bt = Bluetooth('HC-06', 1);
fopen(bt);
flushinput(bt);

% initialize
ecg = zeros(1, 1);
airflow = zeros(1, 1);
spo2 = zeros(1, 1);
pos = zeros(1, 1);
temp = zeros(1, 1);
pulse = zeros(1, 1);
gsr = zeros(1, 1);
% timestamp = zeros(1, 1);

new_data = zeros(1, 2);
% old_time = clock;

data = cell(0);
epoch = 0;

% Ctrl + c if you want to stop and check results
% beacause MATLAB does not support breaking loop by keypress

tic;

while 1
    try
        new_data = str2num(fscanf(bt));
        
        switch new_data(1)
            case 1 % ECG
                ecg = [ecg, new_data(2)];
            case 2 % Airflow
                airflow = [airflow, new_data(2)];              
            case 3 % GSR
                gsr = [gsr, new_data(2)];              
            case 4 % Spo2
                spo2 = [spo2, new_data(2)];
            case 5 % Pulse
                pulse = [pulse, new_data(2)];
            case 6 % Temperature
                temp = [temp, new_data(2)];
            case 7 % Position
                pos = [pos, new_data(2)];
        end;
        
        if(toc >= 30)
            data{1, end+1} = single(ecg);
            data{2, end} = single(airflow);
            data{3, end} = single(gsr);
            data{4, end} = single(spo2);
            data{5, end} = single(pulse);
            data{6, end} = single(temp);
            data{7, end} = single(pos);

            ecg = zeros(1, 1);
            airflow = zeros(1, 1);
            spo2 = zeros(1, 1);
            pos = zeros(1, 1);
            temp = zeros(1, 1);
            pulse = zeros(1, 1);
            gsr = zeros(1, 1);
            
            tic;
            size(data)
        end;
        
%         Sampling rate
%         new_timestamp = etime(clock, old_time);
%         timestamp = [timestamp, new_timestamp];
%         old_time = clock;        
%         if length(timestamp) > 10000
%             sprintf('Sampling rate: %f Hz', 1 / mean(timestamp(3:end)))
%             timestamp = zeros(1, 1);
%         end;
            
    catch
        continue;
    end;
end;

% to measure sampling rate
% sprintf('Sampling rate: %f Hz', 1 / mean(timestamp(3:end)))

fclose(bt);

clc;
clear all;
delete(instrfindall);