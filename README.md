# Arduino-eHealth_platform_V2.0
Arduino code using eHealth plaform to collect human data &amp; send data to MATLAB through serial communication

### My test environtment
1) Arduino Uno R3<br />
2) Arduino IDE 1.6.5 R5<br />
3) eHealth library for Arduino V2.4(July, 2015)<br />
4) Arduino mthread library for multi-thread programming(https://github.com/jlamothe/mthread)<br />
5) MATLAB R2015b<br />
6) USB serial communication<br />
7) HC-06 Bluetooth Module for Arduino<br />

### What kind of data I collect simultaneously
1) ECG<br />
2) Airflow<br />
3) Body temperature<br />
4) Galvanic skin response<br />
5) Body position<br />
6) Pulse<br />
7) O2 saturation<br />

### There are three files:
1) arduino_mthread_ehealth.ino: This is a sketch file that can be uploaded to Arduino. (for both Serial and Bluetooth)<br />
2) arduino_ehealth_serial.m: This is a MATLAB file to receive data via Arduino USB serial.<br />
3) arduino_ehealth_bluetooth.m: This is a MATLAB file to receive via from Arduino Bluetooth HC-06.<br />

This project is conducted by<br />
Sangjun Han (hjun1008@gmail.com), Bio-Computing Lab, Gwangju Institute of Science and Technology, South Korea<br />
for Sleep Stage Classification using brain and bio signal<br />
You can modify sleep_miili to adjust sampling rate for each sensor! (In my case, it follows AASM standard)<br />
1 cell(epoch) represents 30sec<br />
