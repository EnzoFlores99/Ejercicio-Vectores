PVector PosicionTesoro;
Vector vectorPersonaje;
Vector vectorPersonajeTesoro;
PImage imgTesoro;
PImage imgMago;

void setup() {
  size(600,600);
  vectorPersonaje = new Vector(new PVector(0,0),new PVector(1,0));
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
  mostrarMensaje();
  
}
public void dibujarVectorPersonajeTesoro(){
  vectorPersonajeTesoro.setOrigen(vectorPersonaje.getOrigen());
  vectorPersonajeTesoro.setDestino(PVector.sub(PosicionTesoro,vectorPersonaje.getOrigen()).normalize().mult(1));
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
public void mostrarMensaje(){
  float dotProduct = vectorPersonaje.obtenerProductoPunto(vectorPersonajeTesoro);
  if (dotProduct < 0){
  //println (dotProduct);
  textSize(15);
  fill(#E02B65);
  text(dotProduct, 20,20);
  text("el tesoro esta detras",20,40);
  }
  else{
  //println (dotProduct);
  textSize(15);
  fill(#2BE0DF);
  text(dotProduct, 20,20);
  text("el tesoro esta delante",20,40);
  }
  
}
