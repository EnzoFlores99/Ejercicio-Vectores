PVector PosicionTesoro;
Vector vectorPersonaje;
Vector vectorPersonajeTesoro;
PImage imgTesoro;
PImage imgMago;

void setup() {
  size(600,600);
  vectorPersonaje = new Vector(new PVector(0,0),new PVector(40,0));
  PosicionTesoro = new PVector(width/2, height/2);
  vectorPersonajeTesoro = new Vector();
  imgTesoro = loadImage("tesoro.png");
  imgTesoro.resize(imgTesoro.width/10, imgTesoro.height/10);
  
  imgMago = loadImage("mago.png");
  imgMago.resize(imgMago.width/10, imgMago.height/10);
}

void draw() {
  background(#686F65);
  dibujarTesoro();
  dibujarMago();
  vectorPersonaje.setOrigen(new PVector(mouseX,mouseY));
  vectorPersonaje.display();
  dibujarVectorPersonajeTesoro();
  
}
public void dibujarVectorPersonajeTesoro(){
  vectorPersonajeTesoro.setOrigen(vectorPersonaje.getOrigen());
  vectorPersonajeTesoro.setDestino(PVector.sub(PosicionTesoro,vectorPersonaje.getOrigen()).normalize().mult(40));
  vectorPersonajeTesoro.display();
}

public void dibujarTesoro(){
  //point (PosicionTesoro.x,PosicionTesoro.y);
  imageMode(CENTER);
  image(imgTesoro,PosicionTesoro.x, PosicionTesoro.y);
}
public void dibujarMago(){
  imageMode(CENTER);
  image(imgMago,vectorPersonaje.getOrigen().x,vectorPersonaje.getOrigen().y);
}
