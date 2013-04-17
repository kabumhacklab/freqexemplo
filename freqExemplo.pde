/*********************************************
  Oi Kabum! BH
  Computaçao Grafica
  2o Rodizio - Audio x Imagem
  Frequencias do som como parametro
*********************************************/

float ang1, ang2, ang3;


/*********************************************/
void setup() {
  
  //-- use um dos dois comandos abaixo, dependendo do que quer fazer
    setupFrequencias("bach1.mp3"); // 1: para usar mp3
   //setupMic();                 // 2: para usar microfone
  //-----------------------
  
  size(800,600);
  smooth();

}
 
/*********************************************/ 
void draw() {

//-- esse comando calcula as frequencias do som
  calculaFrequencias();  
//------------------------
 
   background(0,0,0);
  fill(255,255,255);
  
  ang1 = ang1 + freq(5)/100.0;
  ang2 = ang2 + freq(10)/100.0;
  ang3 = ang3 - freq(15)/100.0;
  
  pushMatrix();
  translate(150,250);
  scale(0.5);
  rotate(ang1);
  triangle(-150,-150, 150,0, 150,250);
  popMatrix();
  

  pushMatrix();
  translate(300,250);
  scale(0.5);
  rotate(ang2);
  triangle(-150,-150, 150,0, 150,250);
  popMatrix();

  pushMatrix();
  translate(450,250);
  scale(0.5);
  rotate(ang3);
  triangle(-150,-150, 150,0, 150,250);
  popMatrix();
 
}
