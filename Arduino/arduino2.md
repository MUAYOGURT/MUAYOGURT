用电位器控制两个小灯泡的亮暗程度，在调节电位器的过程中，一个小灯泡变亮一个变暗
void setup()
{
  pinMode(5,OUTPUT);
  pinMode(10,OUTPUT);  
}

void loop()
{
  int n = analogRead(A0); 
  int a=n/4;   
  int b=255-n/4; 
  analogWrite(5,a); 
  analogWrite(10,b); 
}

![](https://github.com/MUAYOGURT/MUAYOGURT/blob/master/IMG_20170622_172017.jpg)
