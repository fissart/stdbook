if(!settings.multipleView) settings.batchView=false;
defaultfilename="stdbook-7";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

settings.prc=false;
defaultpen(fontsize(11 pt));
defaultpen(linewidth(0.7pt));
settings.render=2;

import graph;
size(300,0);
int a=0, b=2;
real f(real x) {return 1/(sqrt(2*pi)*(0.5))*exp(-(x-1)^2/(2*(0.5)^2));}
real g(real x) {return 0;}
path w=graph(f,a,b,operator ..);
draw(graph(f,a-1,b+1,operator ..),orange+linewidth(0.3mm));
//draw(graph(g,a,b,operator ..),black);
xaxis();
int n=50;
path h=(a,0)--w--(b,0)--cycle;
fill(h,orange);
draw(h,black+linewidth(0.3mm));
labelx("$a$",a);
labelx("$b$",b);
pair mid=(a+0.5*(b-a),(f(a+0.5*(b-a))+g(a+0.5*(b-a)))/2);
label("$90\%$",mid,white);
real m=a+0.5*(b-a);
real p=a-0.1;
real q=b+0.1;
//arrow("$f(x)$",(m,f(m)),N,red);
arrow("$5\%$",(p,0.5*f(p)),NW,orange);
dot((p,0.5*f(p)),orange);
arrow("$5\%$",(q,0.5*f(q)),NE,orange);
dot((q,0.5*f(q)),orange);
//arrow("$g(x)$",(m,g(m)),dir(-90),0.8cm,blue);
