if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="stdbook-3";
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

import stats;
import graph;
size(12cm,6cm,false);
real[] tabxi={1,5,9,10,12,15,20,28,35,38};
real[] tabni={2,5,6,7, 8, 6, 3, 2, 1};
real[] tabhi;
real[] tabwi;
for(int i=0; i < tabni.length; ++i){
tabhi[i]=tabni[i]/(tabxi[i+1]-tabxi[i]);
tabwi[i]=(tabxi[i+1]+tabxi[i])/2;
draw((tabwi[i],tabhi[i])--(i==0?2*tabxi[0]-tabwi[i]:tabwi[i-1],i==0?0:tabhi[i-1]),orange);
label(format( "%.1f",tabni[i]/sum(tabni)*100)+"\%",(tabwi[i],tabhi[i]),N );
dot((tabwi[i],tabhi[i])^^(2*tabxi[0]-tabwi[0],0));
}

draw(((3*tabxi[tabwi.length]-tabxi[tabwi.length-1])/2,0)--(tabwi[tabwi.length-1],tabhi[tabwi.length-1]),orange); dot(((3*tabxi[tabwi.length]-tabxi[tabwi.length-1])/2,0));

write((tabxi[tabwi.length]-tabxi[tabwi.length-1])/2);
histogram(tabxi,tabhi,low=0,bars=true,blue+opacity(0.5));
xaxis("wwwwwwww",Bottom, RightTicks(Step=3,step=1),above=true);
//shipout(bbox(8mm,orange));
