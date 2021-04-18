//  Minecraft terrain Generation: in java(Processing) project by Abhinav Mishra
int colm, rows;
int scale = 20;
int w = 2000;
int h = 1600;

float gen = 0;

float[][] terrain; //Two dimensional array

void setup() 
{
  size(600, 600, P3D);
  colm = w / scale;
  rows = h/ scale;
  terrain = new float[colm][rows];
}


void draw() 
{
  gen -= 0.1;
  float yoff = gen;
  for (int y = 0; y < rows; y++)
  {
    float xoff = 0;
    for (int x = 0; x < colm; x++) 
    {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }

  background(#B2FDFF);
  stroke(#25CD00); 
  fill(#9BFF00);

  translate(width/2, height/2 + 50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows  -1; y++) 
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < colm; x++) 
    {
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y + 1) * scale, terrain[x][y+1]);
    }
    endShape();
  }
}
