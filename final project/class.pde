class button {
  float px, py;
  float l, w;
  int num;
  int cl;

  button(float X, float Y, float len, float wid, int n, int clr)
  {
    px = X;
    py = Y;
    l = len;
    w = wid;
    num = n;
    cl = clr;
  }

  //void click()
  //{
  //  if (mousePressed)
  //    if (mouseX > px && mouseX<px + l && mouseY > py && mouseY < py + w)
  //    {
  //      println(num);
  //      pos++;
  //    }
  //}

  void display()
  {
    if (mouseX > px && mouseX<px + l && mouseY > py && mouseY < py + w) cl = #FFA7EF;
    fill(cl);
    rect(px, py, l, w);
    fill(0);
    text(num, px+7*l/18, py+13*w/18);
  }
}

class reset 
{
  float px, py;
  float l, w;
  String sh = "reset";
  int cl = #D6FFFE;

  reset(float X, float Y, float len, float wid, int clr)
  {
    px = X;
    py = Y;
    l = len;
    w = wid;
    cl = clr;
  }

  void click()
  {
    if (mousePressed)
      if (mouseX > px && mouseX<px + l && mouseY > py && mouseY < py + w) 
      {
        for (int i = 0; i<6; i++) 
          pw[i] = -1;
        pos = 0;
      }
  }

  void display()
  {
    if (mouseX > px && mouseX<px + l && mouseY > py && mouseY < py + w) cl = #FFA7EF;
    fill(cl);
    rect(px, py, l, w);
    fill(0);
    text(sh, px+l/4, py+2*w/3);
  }
}

class del 
{
  float px, py;
  float l, w;
  String sh = "←";
  int cl = #D6FFFE;

  del(float X, float Y, float len, float wid, int clr)
  {
    px = X;
    py = Y;
    l = len;
    w = wid;
    cl = clr;
  }

  void display()
  {
    if (mouseX > px && mouseX<px + l && mouseY > py && mouseY < py + w) cl = #FFA7EF;
    fill(cl);
    rect(px, py, l, w);
    fill(0);
    text(sh, px+l/4, py+2*w/3);
  }
}