三个小灯泡按照顺序亮暗，然后同时亮暗
void setup() {
  pinMode(13, OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(2,OUTPUT);
  
  // put your setup code here, to run once:

}

void loop() {
  digitalWrite(13,HIGH);
  delay(1000);
  digitalWrite(13,LOW);
  digitalWrite(7,HIGH);
  delay(1000);
  digitalWrite(7,LOW);
  digitalWrite(2,HIGH);
  delay(1000);
  digitalWrite(2,LOW);
  delay(500);
  digitalWrite(13,HIGH);
  digitalWrite(7,HIGH);
  digitalWrite(2,HIGH);
  delay(1000);
  digitalWrite(13,LOW);
  digitalWrite(7,LOW);
  digitalWrite(2,LOW);
  delay(500);
  
  // put your main code here, to run repeatedly:

}


![](https://github.com/MUAYOGURT/MUAYOGURT/blob/master/IMG_20170621_203305.jpg)
![](https://github.com/MUAYOGURT/MUAYOGURT/blob/master/VID_20170621_203325.mp4)
