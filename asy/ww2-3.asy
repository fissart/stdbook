if(!settings.multipleView) settings.batchView=false;
defaultfilename="ww2-3";
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
size(12cm,7cm,IgnoreAspect);
typedef real realfcn(real);
realfcn F(real p) {
return new real(real t) {return 1/(pi*(p)*(1+((t-5)/(p))^2));};
}
for(int i=1; i < 7; ++i){
real rho=(1/(4*i));
real mu=(1/(2*i));
draw(graph(F(i),0,10, n=200, Hermite),Pen(i),
"$\frac{1}{p\pi\left(1+\frac{t-5}{p^2}\right)}$");
}
label("$\displaystyle\frac{1}{p\pi\left(1+\frac{t-5}{p^2}\right)}$",(7,0.3));
xaxis("$x$",0.1,LeftTicks);
yaxis("$y$",0,LeftTicks);
//xaxis(BottomTop,LeftTicks);
//yaxis(LeftRight,RightTicks(trailingzero));
//yaxis("$y$",LeftRight,RightTicks(trailingzero));
//attach(legend(),truepoint(E),20E,UnFill);
attach(legend(2),(point(S).x,truepoint(S).y),1S);
