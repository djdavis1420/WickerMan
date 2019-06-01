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
  background(#00247D);
  
  sum += (rms.analyze() - sum) * smoothFactor;
  
  float rmsHorizontal = sum * (width/2);
  float rmsVertical = sum * (height/2);
  
  stroke(#FFFFFF);
  strokeWeight(75);
  line(640, 360, 0, 0);
  line(640, 360, 1280, 0);
  line(640, 360, 1280, 720);
  line(640, 360, 0, 720);
  
  stroke(#CF142B);
  strokeWeight(25);
  line(640, 360, (640 + rmsHorizontal), (360 + rmsVertical));
  line(640, 360, (640 + rmsHorizontal), (360 - rmsVertical));
  line(640, 360, (640 - rmsHorizontal), (360 + rmsVertical));
  line(640, 360, (640 - rmsHorizontal), (360 - rmsVertical));
  
  stroke(#FFFFFF);
  strokeWeight(100);  
  line(640, 360, 640, 0);
  line(640, 360, 1280, 360);
  line(640, 360, 640, 720);
  line(640, 360, 0, 360);

  stroke(#CF142B);
  strokeWeight(75);
  line(640, 360, (640 + rmsHorizontal), 360);
  line(640, 360, (640 - rmsHorizontal), 360);
  line(640, 360, 640, (360 + rmsVertical));
  line(640, 360, 640, (360 - rmsVertical));

}
