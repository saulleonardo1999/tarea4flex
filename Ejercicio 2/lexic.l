%{
	#include<stdio.h>
	int enteros=0, reales=0, hexa=0, identificador=0, comentarios=0, palabrasre=0;
%}


digito [0-9]+
iden [a-z A-Z][_a-z A-Z]*
hexadecimal 0[x|X]([0-9a-fA-F])+

tkAND and
tkOr or
tkIF if
tkTHENELSE then else
tkIN in
tkFLOAT float
tkWHILE while
tkREPEAT repeat
tkBEGIN begin
tkEND end


%%
	{digito} ++enteros;
	{digito}+"."digito* ++reales;
	{hexadecimal} ++hexa;
	
	{iden} ++identificador;
	
	"//" ++comentarios;
	{tkAND} ++palabrasre;
	{tkBEGIN} ++palabrasre;
	{tkEND} ++palabrasre;
	{tkFLOAT} ++palabrasre;
	{tkIF} ++palabrasre;
	{tkTHENELSE} ++palabrasre;
	{tkWHILE} ++palabrasre;
	{tkIN} ++palabrasre;
%%


int main(){
	yylex();
	
	fprintf(stdout, "Encontre %d Numeros enteros \n Encontre %d numeros Reales\n Encontre %d hexadecimales\n Encontre %d identificadores\n Encontre %d Comentarios\n Encontre %d Palabras reservadas\n", enteros,reales,hexa,identificador,comentarios,palabrasre);

}