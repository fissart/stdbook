if(!settings.multipleView) settings.batchView=false;
defaultfilename="ww2-6";
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
// Tableau des valeurs définissant les classes
real[] tabxi={0,5,8,10,12,15,20,30,35};
// Tableau des effectifs (ou fréquences) des classes
real[] tabni={5,6,7,5,6,2,1,0};
// Calcul des hauteurs
real[] tabhi;
for(int i=0; i < tabni.length; ++i)
tabhi[i]=tabni[i]/(tabxi[i+1]-tabxi[i]);
// Tracé de l'histogramme
histogram(tabxi,tabhi,low=0,bars=true,red,1bp+blue);
xaxis("Valeurs du caract\`ere",Bottom,
RightTicks(Step=2,step=1),above=true);
shipout(bbox(3mm,white));
