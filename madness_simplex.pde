int cols=400;
int rows=200;
int xscl=1;
int yscl=1;
int w=720;
int h=360;
int t=0;
int amp=15;
float wl=0.03;
int a =0;
float yfly=0;
float yspeed=.5;
int ygap=20;

OpenSimplexNoise simplex;
void setup(){
  size(720,360,P3D);
  simplex=new OpenSimplexNoise();
  
}
void draw(){
  background(0);
  stroke(255);
  noFill();
  translate((w/2)-(cols/2),h/2-(rows/2),50);
  rotateX(3*PI/12);  //rotate down, top goes away from view
  float angle=map(t,300,1,0,TWO_PI);
  float u=map(cos(angle),-1,1,0,1);//1
  float v=map(sin(angle),-1,1,0,1);
  t++;
  yfly+=yspeed;
  if(yfly >= ygap){
    yfly =0;
    a+=ygap;
  }
   println(yfly+a,frameRate);
  for (int y =0; y<rows;y=y+ygap){
    beginShape();

    for (int x =0; x<cols;x++){
      //(float) simplex.eval(x,y,u,v)
      //(((float) simplex.eval(x*wl,(y-a)*wl,u,v))+((float) simplex.eval(x*wl,(y-a)*wl,u,v))/2)*amp
      vertex(x*xscl,(y+yfly)*yscl,(float) simplex.eval(x*wl,(y-a)*wl,u,v)*amp);//,(float) simplex.eval(x*wl,-(y+yfly+a)*wl,u,v)*amp);
      //vertex(x*xscl,(y+20)*yscl+yfly,(float) simplex.eval(x*wl,y*wl)*amp);//,(float) simplex.eval((x+1)*wl,-(y+yfly+a)*wl,u,v)*amp);
      
    }
    endShape();  //putting endshape here runs faster
  }
  
}
