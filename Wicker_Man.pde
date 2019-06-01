import processing.sound.*;

SoundFile sample;
Amplitude rms;

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
  
  float rmsHorizontal = sum * (width/2);
  float rmsVertical = sum * (height/2);
  
  line(640, 360, (640 + rmsHorizontal), 360);
  line(640, 360, (640 - rmsHorizontal), 360);
  line(640, 360, 640, (360 + rmsVertical));
  line(640, 360, 640, (360 - rmsVertical));

  line(640, 360, (640 + rmsHorizontal), (360 + rmsVertical));
  line(640, 360, (640 + rmsHorizontal), (360 - rmsVertical));
  line(640, 360, (640 - rmsHorizontal), (360 + rmsVertical));
  line(640, 360, (640 - rmsHorizontal), (360 - rmsVertical));

}
