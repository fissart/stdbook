if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
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
size(12cm,7cm,IgnoreAspect);
typedef real realfcn(real);
realfcn F(real p) {
return new real(real t) {return 1/(sqrt(2*pi)*(1/(4*p)))*exp(-(t-1/(2*p))^2/(2*(1/(4*p))^2));};
}
for(int i=1; i < 7; ++i){
real rho=(1/(4*i));
real mu=(1/(2*i));
draw(graph(F(i),-0.1,1, n=200, Hermite),Pen(i),
"$\frac{1}{"+format( "%.3f", rho)+"\sqrt{2\pi}}{e^{-\frac{(x-"+format( "%.3f", mu)+")^2}{2("+format( "%.3f", rho)+")^2}}}$");
}
label("$\displaystyle\frac{1}{\rho\sqrt{2\pi}}{e^{-\frac{(x-\mu)^2}{2(\rho)^2}}}$",(0.5,8));
xaxis("$x$",0.1,LeftTicks);
yaxis("$y$",0,LeftTicks);
//xaxis(BottomTop,LeftTicks);
//yaxis(LeftRight,RightTicks(trailingzero));
//yaxis("$y$",LeftRight,RightTicks(trailingzero));
//attach(legend(),truepoint(E),20E,UnFill);
attach(legend(2),(point(S).x,truepoint(S).y),1S);
