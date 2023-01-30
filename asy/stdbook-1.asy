if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
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

import three;
import palette;
import graph3;

size(10cm,0);

currentprojection=perspective(-30,-30,30,up=Z);

surface s;

for(int i = 0; i < 10; ++i) {
for(int j = 0; j < 10; ++j) {
s.append(shift(i,j,0)*scale(1,1,i+j)*unitcube);
}
}

s.colors(palette(s.map(zpart),Rainbow()));
draw(s,meshpen=black+thick(),nolight,render(merge=true));

xaxis3("$x$",Bounds,InTicks(endlabel=false,Label,2,2));
yaxis3(YZ()*"$y$",Bounds,InTicks(beginlabel=false,Label,2,2));
zaxis3(XZ()*"$z$",Bounds,InTicks);
