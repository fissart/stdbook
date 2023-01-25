if(!settings.multipleView) settings.batchView=false;
defaultfilename="artbook-9";
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
// Tableau des modalités
string[] tabmod={"Modalit\'e 1","Modalit\'e 2","Modalit\'e 3",
"Modalit\'e 4","Modalit\'e 5"};
// Tableau des effectifs (ou fréquences)
real[] tabeff={20,6,7,10,11};
// Tableau des décalages éventuels des secteurs
real[] tabdecsec={0,.1,0,.2,0};
// Tableau des décalages éventuels des labels
real[] tabdeclab={0,.5,.5,.2,.2};
// Les deux couleurs utilisées pour composer
// les couleurs des secteurs
pen color1=green,color2=blue;
// Le stylo pour les labels
pen p3=blue,p4=yellow+white;
///////////////////////////////////////////////////////////////
/// Ce qui suit n'est a priori pas à changer et pourrait être
/// ajouté un de ces jours à une extension perso stats_gm.asy
/// pour être remplacé par :
/// diacirculaire(tabmod,tabeff,tabdec,color1,color2);
///////////////////////////////////////////////////////////////
real[] tabangle,tabanglecumule,tabanglelabel;
tabanglecumule[0]=0;
int n=tabeff.length;
for(int i=0; i<n; ++i) {
tabangle[i]=tabeff[i]*360/sum(tabeff);
tabanglecumule[i+1]=tabanglecumule[i]+tabangle[i];
tabanglelabel[i]=tabanglecumule[i]+tabangle[i]/2;
path secteur=(0,0)--arc((0,0),1,tabanglecumule[i],tabanglecumule[i+1])--cycle;
transform t1=shift(tabdecsec[i]*dir(tabanglelabel[i])),
t2=shift((.5+tabdecsec[i]+tabdeclab[i])*dir(tabanglelabel[i]));
filldraw(t1*secteur,i/n*color1+(1-i/n)*color2+white);
label(tabmod[i],t2*(0,0),p3,Fill(p4));
}
shipout(bbox(3mm,white));
