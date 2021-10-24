
import oscP5.*;
import netP5.*;

import ddf.minim.*;
import ddf.minim.ugens.*;


Minim minim;
AudioOutput out;
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
size(700,900);
oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
   minim = new Minim(this);
   out = minim.getLineOut();
   out.setTempo( 80 );
   
  // given start time, duration, and frequency
  
}

void draw() {
  
}

void oscEvent(OscMessage theOscMessage) {
  
  if (random(1) < 0.1 ) {
    out.playNote(0.0, theOscMessage.get(2).floatValue() * 4, map(theOscMessage.get(0).floatValue(), 0, 1, 80, 
      map(theOscMessage.get(1).floatValue(), 0, 1, 140, 440)));
  }
  if (random(1) < (theOscMessage.get(0).floatValue() / 10) ) {
    out.playNote(0.0, theOscMessage.get(1).floatValue() * 2, map(theOscMessage.get(3).floatValue(), 0, 1, 80, 
      map(theOscMessage.get(2).floatValue(), 0, 1, 840, 1240)));
  }
  println(theOscMessage.get(0).floatValue() + "::" + theOscMessage.get(1).floatValue());
}
