#include <stdio.h>
#include <math.h>

void binario (int num){
  int aux;
  if (num == 0)			//<-La funcion recursiva tiene como condicion de salida,
    //cuando el numero es cero
    return;
  //si no
  aux = num % 2;		//<-"guardamos" el residuo de la divicion
  num = num / 2;		//<-actualizamos el valor del numero, para la proxima llamada
  //recursiva
  binario (num);		//<-hacemos la sig llamada recursiva con nuestro valor actualizado
  printf ("%d", aux);		//<-Al poner la llamada de impresion despues de la llamada
  //recursiva sig, hacemos que imprima primero las llamadas
  //que se realizaron al final, haciendo el efecto de imprimir
  //inversamente
}

void decimal(int b){
  int d=0,e=0,c=0;
  while(b>=10){
    c=0;
    while(b>=10){
      b=b-10;
      c++;
    }
    d=d+b*pow(2,e);
    e++;
    b=c;
  }
  d=d+c*pow(2,e);
  printf("Conversion a decimal: %d",d);
}

int main(){
  int op=1, num;
  printf("Bienvenido\n");
  while(op==1){
    printf("Escoja una opcion de conversion\n1. Dec -> Bin\n2. Bin -> Dec\n?:");
    scanf("%d",&op);
    if(op==1){
	printf("Escriba el numero Decimal: ");
	scanf("%d",&num);
	printf("Conversion a Binario: "); // dado que es recursivo, es necesario mostrar este mensaje aqui
	binario(num);
    }else if(op==2){
	printf("Escriba el numero Binario: ");
	scanf("%d",&num);
	decimal(num);
    }else{
	printf("Opcion incorrecta, trate nuevamente\n");
        op=1;
    	continue;
    }
    printf("\n\nPara salir ingrese -1\nPara continuar ingrese 1\n?:");
    scanf("%d",&op);
  }
}

