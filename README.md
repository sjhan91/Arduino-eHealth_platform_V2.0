# Arduino-eHealth_platform_V2.0
Arduino code using eHealth plaform to collect human data &amp; send data to MATLAB through serial communication

### My test environtment
1) Arduino Uno R3<br />
2) Arduino IDE 1.6.5 R5<br />
3) eHealth library for Arduino V2.4(July, 2015)<br />
4) Arduino mthread library for multi-thread programming(https://github.com/jlamothe/mthread)<br />
5) MATLAB R2015b<br />
6) USB serial communication<br />

### What kind of data I collect simultaneously
1) ECG<br />
2) Airflow<br />
3) Body temperature<br />
4) Galvanic skin response<br />
5) Body position<br />
6) Pulse<br />
7) O2 saturation<br />

### There are two files;
1) arduino_mthread_ehealth.ino: This is a sketch file that can be uploaded to Arduino.<br />
2) arduino_ehealth_data.mat: This is a MATLAB file to receive data from Arduino.<br />

This project is conducted by<br />
Sangjun Han(hjun1008@gist.ac.kr), Bio-Computing Lab, GIST, South Korea<br />
You can modify sleep_miili to adjust sampling rate for each sensor! (In my case, it follows AASM standard)<br />
