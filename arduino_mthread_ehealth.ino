#include <mthread.h>
#include <eHealth.h>
#include <eHealthDisplay.h>
#include <PinChangeInt.h>

int cont = 0;

// Our custom Thread:
class FooThread : public Thread
{
  public:
      FooThread(int id);
  protected:
      bool loop();
  private:
      int id;
};
 
FooThread::FooThread(int id)
{
  this->id = id;
}
 
bool FooThread::loop()
{
  // Die if requested:
  if(kill_flag)
      return false;
  
  switch(id)
  {
    case 1:
      // ECG
      //Serial.print("ID 1: ");
      Serial.print("1");
      Serial.print(",");
      Serial.print(float(eHealth.getECG()));
      Serial.println();
      sleep_milli(2.5);
      break;
    case 2:
      // Airflow
      //Serial.print("ID 2: ");
      Serial.print("2");
      Serial.print(",");
      Serial.print(int(eHealth.getAirFlow()));
      Serial.println();
      sleep_milli(10);
      break;
    case 3:
      // GSR
      //Serial.print("ID 3: ");
      Serial.print("3");
      Serial.print(",");
      Serial.print(float(eHealth.getSkinConductance()));
      Serial.println();
      sleep_milli(900);
      break;
    case 4:
      // Spo2
      //Serial.print("ID 4: ");
      Serial.print("4");
      Serial.print(",");
      Serial.print(eHealth.getOxygenSaturation());
      Serial.println();
      sleep_milli(35);
      break;
    case 5:
      // BPM
      //Serial.print("ID 5: ");
      Serial.print("5");
      Serial.print(",");
      Serial.print(eHealth.getBPM());
      Serial.println();
      sleep_milli(900);
      break;
    case 6:
      // Temperature
      //Serial.print("ID 6: ");
      Serial.print("6");
      Serial.print(",");
      Serial.print(float(eHealth.getTemperature()));
      Serial.println();
      sleep_milli(900);
      break;
    case 7:
      // Position
      //Serial.print("ID 7: ");
      Serial.print("7");
      Serial.print(",");
      Serial.print(uint8_t(eHealth.getBodyPosition()));
      Serial.println();
      sleep_milli(900);
      break;
   default:
      break;
  }
  return true;
}
 
void setup()
{
  // Create five threads and add them to the main ThreadList:
  for(int i=1;i<=7;i++)
  {
    main_thread_list->add_thread(new FooThread(i)); 
  }
  
  // Initialize the serial connection:
  Serial.begin(115200);
  
  eHealth.initPulsioximeter();
  eHealth.initPositionSensor();
  PCintPort::attachInterrupt(6, readPulsioximeter, RISING); 
}

void readPulsioximeter()
{
  cont ++;

  if(cont == 50)
  { 
    //Get only of one 50 measures to reduce the latency
    eHealth.readPulsioximeter();
    cont = 0;
  }
}
