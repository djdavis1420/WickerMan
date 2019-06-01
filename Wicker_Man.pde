import processing.sound.*;

SoundFile sample;
Amplitude rms;

float scale = 2.0;

float smoothFactor = 0.25;

float sum;

void setup() {
  size(1280, 720);
  
  sample = new SoundFile(this, "Wicker_Man.mp3");
  sample.loop();
  
  rms = new Amplitude(this);
  rms.input(sample);
}

void draw() {
  background(0, 0, 0);
  
  stroke(183, 29, 37);
  strokeWeight(10);
  
  sum += (rms.analyze() - sum) * smoothFactor;
  
  float rmsScaled = sum * (height/2) * scale;
  
  line(640, 360, rmsScaled, 360);
  line(640, 360, 640, rmsScaled);

}
