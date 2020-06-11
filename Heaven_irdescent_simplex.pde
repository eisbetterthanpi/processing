//PGraphics pg;
int current=0;
int t=0;
float z=0;
int amp=15;
float wl=0.0005;
int a =0;
int wild=10;
int frames=600;
float h,s,b;
OpenSimplexNoise simplex;
void setup(){
  //pg=createGraphics(1920,1080,P3D);
  //size(720,360,P3D);
  fullScreen(P3D);
  tint(0,0,100);
  colorMode(HSB,360,255,255);
  simplex=new OpenSimplexNoise();
}
void draw(){
  tint(100);
  //pg.beginDraw();
  //image(pg,10,10);
  //background(0);
  //stroke(255);
  //noFill();
  //float angle=map(t,frames,1,0,TWO_PI);
  //float u=map(cos(angle),-1,1,0,wild);//1
  //float v=map(sin(angle),-1,1,0,wild);
  //t++;
  z+=0.01;
  //println(t,angle,frameRate);

  for (int y =0; y<height;y++){
    for (int x =0; x<width;x++){
      //h=map((float) simplex.eval(x*wl,y*wl,u,v),-1,1,0,360*4)%360;
      h=map((float) simplex.eval(x*wl,y*wl,z),-1,1,0,360*4)%360;
      set(x,y,color(h,20,255));
      
      //rgb 240-249,237-246,223-228
      //bw 234-240
      //mid 244.5+-4.5,241.5+-4.5,225.5+-2.5
      //stroke(255);
    }
  }
  current+=1;
  
  //pg.save("out/heaven"+nf(current,5)+".png");
  //pg.endDraw();
  println(current,frameRate);
}
//tint(0x000000FF);


//int a=0;
//void setup(){
//  size(360,256);
//  noStroke();
//  //hue,saturation,brightness
//  colorMode(HSB,360,255,255);
//}
//void draw(){
//  background(a,45,255);
//  //for (int  h= 0; h < 360; h++) {
//  //  for (int s = 0; s < 255; s++) {
//  //    stroke(h, s, a);
//  //    point(h, s);
//  //  }
//  //}
//  ////println(a);
//  a++;
//}
