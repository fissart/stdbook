if(!settings.multipleView) settings.batchView=false;
defaultfilename="stdbook-6";
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
int a=-1, b=2;
real f(real x) {return x^3-x+2;}
real g(real x) {return x^2;}
draw(graph(f,a,b,operator ..),red);
draw(graph(g,a,b,operator ..),blue);
xaxis();
int n=30;
real width=(b-a)/(real) n;
path w=graph(f,a,b,operator ..);
path ww=graph(g,a,b,operator ..);
path h=buildcycle((a,g(a))--(a,f(a)),w,(b,f(b))--(b,g(b)),ww);
fill(h,orange);
draw(h,black+linewidth(0.3mm));
labelx("$a$",a);
labelx("$b$",b);
draw((a,0)--(a,g(a)),dotted);
draw((b,0)--(b,g(b)),dotted);
real m=a+0.73*(b-a);
arrow("$f(x)$",(m,f(m)),N,red);
arrow("$g(x)$",(m,g(m)),E,0.8cm,blue);
int j=2;
real xi=b-j*width;
real xp=xi+width;
real xm=0.5*(xi+xp);
pair dot=(xm,0.5*(f(xm)+g(xm)));
dot(dot,green+4.0);
arrow("$\left(x,\frac{f(x)+g(x)}{2}\right)$",dot,NE,2cm,green);
