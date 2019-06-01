
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
int sampleSize = 1024;
int bandCount = 0;
FFT fft;

float smoothFactor = 0.25;

float sum;

void setup() {
  size(1280, 720);
  minim = new Minim(this);
  song = minim.loadFile("Wicker_Man.mp3", sampleSize);
  song.loop();
  fft = new FFT(song.bufferSize(), song.sampleRate() );
}

void draw() {
  background(#00247D);
  
  fft.forward(song.mix);
  
  float amplitude = fft.calcAvg(0, 20000);
  
  sum += (amplitude / 3.5 - sum) * smoothFactor;
  
  float rmsHorizontal = sum * (width/2);
  float rmsVertical = sum * (height/2);
  
  stroke(#FFFFFF);
  strokeWeight(75);
  line(640, 360, 0, 0);
  line(640, 360, 1280, 0);
  line(640, 360, 1280, 720);
  line(640, 360, 0, 720);
  
  stroke(#CF142B);
  strokeWeight(35);
  line(640, 360, (640 + rmsHorizontal), (360 + rmsVertical));
  line(640, 360, (640 + rmsHorizontal), (360 - rmsVertical));
  line(640, 360, (640 - rmsHorizontal), (360 + rmsVertical));
  line(640, 360, (640 - rmsHorizontal), (360 - rmsVertical));
  
  stroke(#FFFFFF);
  strokeWeight(125);  
  line(640, 360, 640, 0);
  line(640, 360, 1280, 360);
  line(640, 360, 640, 720);
  line(640, 360, 0, 360);

  stroke(#CF142B);
  strokeWeight(80);
  line(640, 360, (640 + rmsHorizontal), 360);
  line(640, 360, (640 - rmsHorizontal), 360);
  line(640, 360, 640, (360 + rmsVertical));
  line(640, 360, 640, (360 - rmsVertical));

}
