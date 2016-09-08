# Arduino-eHealth_platform_V2.0
Arduino code using eHealth plaform to collect human data &amp; send data to MATLAB through serial communication

### My test environtment
1) Arduino Uno R3\n
2) Arduino IDE 1.6.5 R5
3) eHealth library for Arduino V2.4(July, 2015)
4) Arduino mthread library for multi-thread programming(https://github.com/jlamothe/mthread)
5) MATLAB R2015b
6) USB serial communication

### What kind of data I collect simultaneously
1) ECG
2) Airflow
3) Body temperature
4) Galvanic skin response
5) Body position
6) Pulse
7) O2 saturation

### There are two files;
1) arduino_mthread_ehealth.ino: This is a sketch file that can be uploaded to Arduino.
2) arduino_ehealth_data.mat: This is a MATLAB file to receive data from Arduino.

This project is conducted by
Sangjun Han(hjun1008@gist.ac.kr), Bio-Computing Lab, GIST, South Korea
You can modify sleep_miili to adjust sampling rate! (In my case, it follows AASM standard)

### arduino_ehealth_data.mat will be uploaded later
