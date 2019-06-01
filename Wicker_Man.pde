import processing.sound.*;

SoundFile sample;


void setup() {
  size(1280, 720);
  
  sample = new SoundFile(this, "Wicker_Man.mp3");
  sample.loop();
  
}

void draw() {
  background(0, 0, 0);
  
  stroke(183, 29, 37);
  strokeWeight(10);
  
  line(640, 360, 640, 600);

}
