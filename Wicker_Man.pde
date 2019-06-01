import processing.sound.*;

SoundFile sample;


void setup() {
  size(1280, 720);
  
  sample = new SoundFile(this, "Wicker_Man.mp3");
  sample.loop();
  
}

void draw() {
  background(0, 0, 0);

}
