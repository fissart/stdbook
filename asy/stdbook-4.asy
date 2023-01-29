if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="stdbook-4";
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

size(5cm);
string[] www={"www","$www$","ww","w","www"};
real[] w1={20,30,10,10,50};
real[] w2={0.1,0,0.2,0,0};
real[] t1;
real[] t2;
real[] t3;
int n=w1.length;
t2[0]=0;
for(int i=0; i < n; ++i ){
t1[i]=w1[i]*360/sum(w1);
t2[i+1]=t2[i]+t1[i];
t3[i]=t2[i]+t1[i]/2;
path sector=(0,0)--arc((0,0),2,t2[i],t2[i+1])--cycle;
transform tt1=shift(w2[i]*dir(t3[i]));
transform tt2=shift((2.3+w2[i])*dir(t3[i]));
fill(tt1*sector, i/n*orange+(1-i/n)*blue);
label(www[i],tt2*(0,0),blue);
}
