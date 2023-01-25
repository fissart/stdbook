if(!settings.multipleView) settings.batchView=false;
defaultfilename="stdbook-1";
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

import graph3;
size(300,0);
currentprojection=perspective(8,-8,8);
triple f(pair t) {
real u=t.x;
real v=t.y;
real r=2-cos(u);
real x=3*cos(u)*(1+sin(u))+r*cos(v)*(u < pi ? cos(u) : -1);
real y=8*sin(u)+(u < pi ? r*sin(u)*cos(v) : 0);
real z=r*sin(v);
return (x,y,z);
}
surface s=surface(f,(0,0),(2pi,2pi),16,8,Spline);
draw(s,blue+opacity(0.7), meshpen=black+0.6bp,render(merge=true));

string lo="$\alpha=\sum_1^\infty$";
string hi="$\beta=\rho^3$";
real h=0.05;
begingroup3("parametrization");
//draw(surface(scale(0.08)*lo,s,0,1,h,bottom=false),"[0,0.5pi]");
//draw(surface(scale(0.08)*rotate(90)*hi,s,2,1,h,bottom=false),"[pi,2pi]");
endgroup3();
//axes3("$x$","$y$","$z$", Arrows3);
