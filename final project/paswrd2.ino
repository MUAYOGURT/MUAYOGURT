int redpin = 3;
int greenpin = 2;
int voicepin = 6;

boolean voice = true;
int p_data = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(redpin, OUTPUT);
  pinMode(greenpin, OUTPUT);
  pinMode(voicepin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  p_data = Serial.read();

  if (p_data == 0)
  {
    voice = true;
    digitalWrite(redpin, LOW);
    delay(1);
    digitalWrite(greenpin, LOW);
    delay(1);
  }

  if (p_data == 1)
  {
    digitalWrite(greenpin, HIGH);
    if (voice)
    {
      tone(voicepin, 441);
      delay(200);
      tone(voicepin, 589);
      delay(300);
      voice = false;
      noTone(voicepin);
    }
  }

  if (p_data == 2)
  {
    digitalWrite(redpin, HIGH);
    if (voice)
    {
      tone(voicepin, 589);
      delay(200);
      tone(voicepin, 441);
      delay(300);
      voice = false;
      noTone(voicepin);
    }
  }

  if (p_data == 3)
  {
    //    digitalWrite(redpin, HIGH);
    //    delay(100);
    //    digitalWrite(redpin, LOW);
    //    delay(100);
    for (int i = 200; i <= 800; i++)
    {
      tone(voicepin, i);
      if (i % 40 < 20) digitalWrite(redpin, HIGH);
      else digitalWrite(redpin, LOW);
      delay(5);
    }
    for (int i = 0; i <= 20; i++)
    { tone(voicepin,800);
      if (i % 2 == 0)
        digitalWrite(redpin, HIGH);
      else
        digitalWrite(redpin, LOW);
      delay(100);
    }
    for (int i = 800; i >= 200; i--)
    {
      tone(voicepin, i);
      if (i % 20 >= 10) digitalWrite(redpin, HIGH);
      else digitalWrite(redpin, LOW);
      delay(10);
    }
  }

}
