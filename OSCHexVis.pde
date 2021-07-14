import oscP5.*;
import netP5.*;

float x = 1;
int grow = 1;

PImage hex2;
PImage hex3;
PImage hex4;
PImage hex5;
PImage hexImages[];

int c0 = 0;
int c1 = 1;
int c2 = 2;
int c3 = 2;
int c4 = 2;

int amt = 1;
int[] xpos = new int[4000];
int[] ypos = new int[4000];
int dice = 0;
int amp = 4;



OscP5 osc;

void setup() {
  fullScreen(2);
  noStroke();
  background(0);
  imageMode(CENTER);
  hex2 = loadImage("hex2.png");
  hex3 = loadImage("hex3.png");
  hex4 = loadImage("hex4.png");
  hex5 = loadImage("hex5.png");
  
  hexImages = new PImage[5];
  
for (int i=0; i<hexImages.length; i++){
  hexImages[i] = loadImage( "hex" + i + ".png");
}

for(int i = 0; i <=3999; i++){
xpos[i] = int(random(0,width));
ypos[i] = int(random(0,height));
}

  smooth(4);
  osc = new OscP5(this, 12000);
  blendMode(LIGHTEST);

}

void oscEvent(OscMessage msg){
  setrandom();
}

void setrandom(){
  x = x + 5;
  grow = 100;
  c0 = int(random(0,5));
  c1 = int(random(0,5));
  c2 = int(random(0,5));
  c3 = int(random(0,5));
  c4 = int(random(0,5));
  amt = amt + 1;
  if (amp == 4){
    amp = 0;
  }
  else{
  amp = 4;
  }

}

void draw(){
  x = x + 0.25;
  background(0);

 //tint(255, 100);
 
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(x/8));
  image(hexImages[c0],0,0, 1000+grow/4, 1000+grow/4);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(-x/4));
  image(hexImages[c1],0,0, 800+grow/4, 800+grow/4);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(x/2));
  image(hexImages[c2],0,0, 600+grow/2, 600+grow/2);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(-x));
  image(hexImages[c4],0,0, 400+grow, 400+grow);
  popMatrix();
  
grow = grow - 12;


  
fly();

if (amt > 3500){
  amt = 0;
}
}

  
  void fly (){
    for(int i = 0; i <=amt-1; i++){
    if(dice == int(random(0,2))){
    xpos[i] = xpos[i] +amp;
  }else{
    xpos[i] = xpos[i] -amp;
  }
  if(dice == int(random(0,2))){
    ypos[i] = ypos[i] +amp;
  }else{
    ypos[i] = ypos[i] -amp;
  }
  fill(int(random(200,255)),int(random(100,255)),int(random(0,255)));
  rect(xpos[i],ypos[i],2+amp,2+amp);

  }
  }
