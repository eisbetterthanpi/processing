int t=0;
int amp=15;
float wl=0.01;//0.03
int a =0;
int wild=10;
int frames=600;
OpenSimplexNoise simplex;
void setup(){
  size(720,360,P3D);
  simplex=new OpenSimplexNoise();
}
void draw(){
  background(0);
  stroke(255);
  noFill();
  float angle=map(t,frames,1,0,TWO_PI);
  float u=map(cos(angle),-1,1,0,wild);//1
  float v=map(sin(angle),-1,1,0,wild);
  t++;
  println(t,angle,frameRate);
  
  for (int y =0; y<height;y++){
    for (int x =0; x<width;x++){
      //(float) simplex.eval(x,y,u,v)
      //println((float) simplex.eval(x*wl,y*wl,u,v));
      //set(x,y,color(map((float) simplex.eval(x*wl,y*wl,u,v),-1,1,0,255)));
      //println(map((float) simplex.eval(x*wl,y*wl,u,v),-1,1,0,255)%10);
      if (map((float) simplex.eval(x*wl,y*wl,u,v),-1,1,0,255)%30<=1){
        set(x,y,color(255));
        //stroke(255);
      }
    }
  }
}
