if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="stdbook-5";
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

size(7.5cm,0);
pen dashed=linetype(new real[] {5,3});
void bargraph(real X, real Y,
real ymin, real ymax, real ystep,
real tickwidth, string yformat,
Label LX, Label LY, Label[] LLX,
real[] height,
pen p=nullpen){
draw((0,0)--(0,Y),EndArrow);
draw((0,0)--(X,0),EndArrow);
label(LX,(X,0),plain.SE);
label(LY,(0,Y),plain.N);//fontsize(9)
real yscale=Y/(ymax+ystep);
for(real y=ymin; y<ymax; y+=ystep) {
draw((-tickwidth,yscale*y)--(0,yscale*y));
label(format(yformat,y),(-tickwidth,yscale*y),plain.W);
}
int n=LLX.length;
real xscale=X/(2*n+2);
for(int i=0;i<n;++i) {
real x=xscale*(2*i+1);
path P=(x,0)--(x,height[i]*yscale)--(x+xscale,height[i]*yscale)--(x+xscale,0)--cycle;
fill(P,p);
draw(P);
label(LLX[i],(x+xscale/2),plain.S);
}
for(int i=0;i<n;++i)
draw((0,height[i]*yscale)--(X,height[i]*yscale),dashed);
}
string yf="%#.1f";
Label[] LX={"wwwwww","www","www1","www2","www3","www"};
for(int i=0;i<LX.length;++i) LX[i]=rotate(45)*LX[i];
real[] H={3,5.3,12.9,21.3,9.8,4.3};

bargraph(X=50,Y=70,
ymin=2,ymax=23,ystep=5,
tickwidth=2,
yf,
"$www$","$\theta_3$",
LX,H,
orange+white);
