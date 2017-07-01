import processing.serial.*;

static int[] pw = new int[6];
static int pos = 0;
int password = 123456;

PImage img;

int mode = 0;
int wrongtime = 3;
boolean shine = false;

Serial myport;

void setup()
{
  myport = new Serial(this, "/dev/cu.usbmodem14141", 9600); 

  size(448, 450);
  img = loadImage("mercy.jpg");
  stroke(80);

  myport.write(0);
}

void draw()
{ 
  image(img, 0, 0);
  if (mode == 0) 
  {
    if (!shine) myport.write(0);
    textSize(30);    

    button[] bx = new button[10];
    bx[1] = new button(110, 170, 60, 60, 1, 255);
    bx[2] = new button(190, 170, 60, 60, 2, 255);
    bx[3] = new button(270, 170, 60, 60, 3, 255);
    bx[4] = new button(110, 250, 60, 60, 4, 255);
    bx[5] = new button(190, 250, 60, 60, 5, 255);
    bx[6] = new button(270, 250, 60, 60, 6, 255);
    bx[7] = new button(110, 330, 60, 60, 7, 255);
    bx[8] = new button(190, 330, 60, 60, 8, 255);
    bx[9] = new button(270, 330, 60, 60, 9, 255);
    bx[0] = new button(350, 330, 60, 60, 0, 255);

    for (int i = 0; i<10; i++)
      bx[i].display();

    reset re = new reset(110, 90, 140, 60, 255);
    re.display();
    re.click();

    del de = new del(270, 90, 60, 60, 255);
    de.display();

    fill(255);
    for (int i = 0; i < 6; i++)
      rect(75+50*i, 5, 50, 35);

    fill(0);
    for (int i = 0; i < pos; i++)
      text('*', 95 + 50 * i, 37.5);

    if (pos == 6 && password == pw[0] * 100000 + pw[1] * 10000 + pw[2] * 1000 + pw[3] * 100 + pw[4] * 10 + pw[5]) mode = 1;
    if (pos == 6 && password != pw[0] * 100000 + pw[1] * 10000 + pw[2] * 1000 + pw[3] * 100 + pw[4] * 10 + pw[5])
    {
      mode = 2;
      wrongtime--;
    }
  }

  if (mode == 1)
  {
    textSize(100);
    fill(#FF0000);
    text("SUCCESS!", 0, 400);
    if (!shine)
      myport.write(1);
    shine = true;
  }

  if (mode == 2)
  {
    textSize(40);
    fill(#FF0000);

    if (wrongtime == 2) 
    {
      text("You have 2 more times.", 0, 300);
      if (!shine)
        myport.write(2);
    }
    if (wrongtime == 1)
    {
      text("You have 1 more times.", 0, 300);
      if (!shine) 
        myport.write(2);
    }
    if (wrongtime == 0) 
    {
      text("You have no chance.", 20, 300);
      myport.write(3);
    }
    shine = true;
  }
}

void mousePressed()
{
  if (pos < 6 && mode == 0) {
    for (int i = 1; i < 4; i++)
    {
      if (mouseX > 80 * i + 30 && mouseX < 80 * i + 90 && mouseY > 170 && mouseY < 230)
      {
        pw[pos] = i;
        pos++;
      }
      if (mouseX > 80 * i + 30 && mouseX < 80 * i + 90 && mouseY > 250 && mouseY < 310)
      {
        pw[pos] = i + 3;
        pos++;
      }
       if (mouseX > 80 * i + 30 && mouseX < 80 * i + 90 && mouseY > 330 && mouseY < 390)
      {
        pw[pos] = i + 6;
        pos++;
      }
    }
    if (mouseX >  350 && mouseX < 410  + 90 && mouseY > 330 && mouseY < 390)
      {
        pw[pos] = 0;
        pos++;
      }
    if (mouseX > 270 && mouseX < 330 && mouseY > 90 && mouseY < 150)
    {
      if (pos >= 0)
        pw[pos] = -1;
      pos--;
    }
  }

  if (mode == 1) {
    for (int i = 0; i<6; i++) 
      pw[i] = -1;
    pos = 0;
    mode = 0;
    wrongtime = 3;
    shine = false;
  }

  if (mode == 2)
  {
    if (wrongtime != 0)
    {
      for (int i = 0; i<6; i++) 
        pw[i] = -1;
      pos = 0;
      mode = 0;
      shine = false;
    }
  }
}