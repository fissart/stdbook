if(!settings.multipleView) settings.batchView=false;
defaultfilename="artbook-10";
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

void bargraph(real X, real Y,
real ymin, real ymax, real ystep,
real tickwidth, string yformat,
Label LX, Label LY, Label[] LLX,
real[] height,
pen p=nullpen){
draw((0,0)--(0,Y),EndArrow);
draw((0,0)--(X,0),EndArrow);
label(LX,(X,0),plain.SE,fontsize(9));
label(LY,(0,Y),plain.N,fontsize(9));
real yscale=Y/(ymax+ystep);
for(real y=ymin; y<ymax; y+=ystep) {
draw((-tickwidth,yscale*y)--(0,yscale*y));
label(format(yformat,y),(-tickwidth,yscale*y),plain.W,fontsize(9));
}
int n=LLX.length;
real xscale=X/(2*n+2);
for(int i=0;i<n;++i) {
real x=xscale*(2*i+1);
path P=(x,0)--(x,height[i]*yscale)--(x+xscale,height[i]*yscale)--(x+xscale,0)--cycle;
fill(P,p);
draw(P);
label(LLX[i],(x+xscale/2),plain.S,fontsize(10));
}
for(int i=0;i<n;++i)
draw((0,height[i]*yscale)--(X,height[i]*yscale),dashed);
}

string yf="%#.1f";
Label[] LX={"Printemps","Et\'e","Automne","Hiver"};
for(int i=0;i<LX.length;++i) LX[i]=rotate(45)*LX[i];
real[] H={12.9,21.3,9.8,4.3};

bargraph(X=60,Y=100,
ymin=2,ymax=24,ystep=2,
tickwidth=1,
yf,
"Saison","$\theta$ moyen",
LX,H,
yellow);
