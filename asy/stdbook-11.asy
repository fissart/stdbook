if(!settings.multipleView) settings.batchView=false;
defaultfilename="stdbook-11";
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

/* Illustration aidant au calcul de la médiane
d'une série à caractère quantitatif continu
d'après le polygone des effectifs cumulés croissants
par interpolation linéaire */

/* Variables à modifier */

// Définition de la taille de l'image
size(7cm,5cm,false);
// Points A et B définissant l'un des segments du polygone
pair A=(8,37),B=(10,57.5);
// Ordonnée du point de [AB] dont on cherche l'abscisse
real yM=50;

/* A priori, ce qui suit ne doit pas être modifié
la figure va s'adapter aux valeurs données précédemment */

real xM=(yM-A.y)*(B.x-A.x)/(B.y-A.y)+A.x;
real dx=.2(B.x-A.x), dy=.2(B.y-A.y);
draw((A.x-dx,A.y-2dy)--(B.x+dx,A.y-2dy),.7bp+black);
draw((A.x-2dx,A.y-dy)--(A.x-2dx,B.y+dy),.7bp+black);

draw(A--B,1.2bp+black);
dot("$A$",A,SW,blue);
dot("$B$",B,NE,blue);
dot("$M$",(xM,yM),SE,red);

draw((A.x-2dx,A.y)--A--(A.x,A.y-2dy),dashed+.5bp+black);
draw((A.x-2dx,B.y)--B--(B.x,A.y-2dy),dashed+.5bp+black);
draw((A.x-2dx,yM)--(xM,yM)--(xM,A.y-2dy),dashed+.5bp+black);
label(format("$%f$",A.x),(A.x,A.y-2dy),S);
label(format("$%f$",A.y),(A.x-2dx,A.y),W);
label(format("$%f$",B.x),(B.x,A.y-2dy),S);
label(format("$%f$",B.y),(A.x-2dx,B.y),W);
label("$x_M$?",(xM,A.y-2dy),S,red);
label(format("$%f$",yM),(A.x-2dx,yM),W);
