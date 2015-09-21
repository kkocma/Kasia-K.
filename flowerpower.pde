import ddf.minim.*;      // Załadowanie biblioteki dźwiękowej
 
Minim minim;
AudioPlayer player;
PImage tlo;              // Definicja zmiennych
int y;

PImage img;
float offset = 0;
float easing = 0.5;
 
void setup () {
                                  // Zdefiniowanie wielkości okna
  size (548, 548);
  tlo = loadImage("flower.png");  // Załadowanie obrazów do programu
  img = loadImage("flower.png");  
  noStroke ();         
  
  minim = new Minim (this);       // Załadowanie pliku dźwiękowego i odtwarzanie
  player = minim.loadFile ("smfg.mp3");
  player.play ();
}
 
void draw () {

background(tlo);                // Tło

image(img, 0, 0);              // Wyświetlenie obrazu
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);              // Przesuwanie obrazu kursorem
  image(img, offset, 0);
  
                              // Zwiększanie kształtu w zależności od głośności
  float dimension = player.mix.level () * 650;
   
                              // Rysowanie koła
  fill (255,255,0);
  ellipseMode (CENTER);
  ellipse (width/2, height/2, dimension, dimension);
