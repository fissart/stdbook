if(!settings.multipleView) settings.batchView=false;
defaultfilename="artbook-3";
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

import math;
size(300,0);

int[] x={2,3,5,7,11,14,3};

int y=-1;

for (int k : x){
if(k==7){
label("$\frac{1}{2}$"+string(k),(-3,--y));
}else
{
label("$\int^{"+string(k)+"}_{"+string(k)+"}$",(-2,--y),E,blue);
}

}
int l=0;
for (int k=0; k<15;++k){

label("$\displaystyle\int^{"+string(k)+"}_{"+string(k)+"}f(x)$",(-8,-l-2.1*k),E,blue);

}

label(scale(1.1)*"$\int_{e}^{3}\epsilon$",(-2,0.5));


void tablepythagore(int m=9, int n=9){
int[][] y=new int[m+1][n+1];

for (int i=1; i<=m; ++i)
{

for (int j=1; j<=n; ++j)
{
y[i][j]=i*j;
if(i!=2&&j!=1){
label(scale(.9)*format("%i",y[i][j]),(j,-i));
}
if(i==1){
label(format("%i",j),(j,0),paleblue);
//dot((j,0));
}
}

label(format("%i",i),(0,-i),red);
label(format("%i",i-1),(1,-i),red);
}
draw((-2,-0.5)--(-2,-9.5), orange+linewidth(0.5mm));
draw((-0.5,-0.5)--(9.5,-0.5), orange+linewidth(0.5mm));
draw((-0.5,-9.5)--(9.5,-9.5), orange+linewidth(0.5mm));
//add(shift(-.5,-.5-m)*grid(n+1,m+1,orange));
label(scale(1.1)*"$\int_{e}^{3}\epsilon$",(-0.5,0.5));
}

tablepythagore();

shipout(bbox(.25cm,Fill(white)));
