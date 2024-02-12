int tileSize = 15; // higher is zoomed in
float scale = 0.001; // lower is more quality
float rizz = random(0, 0.5);
long seed = round(random(0, 10000000));
float xoff = 0;
float yoff = 0;
float speed = 0.001;

void setup() {
   size(1920, 1080);
   noStroke();
   colorMode(HSB);
   noiseDetail(8, 0.6); // changes stuff check docs
   noiseSeed(seed);
   drawTerrain();
   drawPlayer();
   textSize(50);
}

void draw() {
  drawTerrain();
  drawPlayer();
  fill(0);
  text(rizz, 50, 50);
  fill(0);
}

void drawPlayer() {
   fill(0);
   rect(width / 2, height / 2, tileSize * 2, tileSize * 2); 
}

void drawTerrain() {
     for(int i = 0; i < width/tileSize; i++) {
     for(int j = 0; j < height/tileSize; j++) {
       fill(getColour(i, j));
       rect(i * tileSize, j * tileSize, tileSize, tileSize);
     }
   }
}

void keyPressed() {
  if(key == ' ') {
    seed = round(random(0, 10000000));
    noiseSeed(seed);
    drawTerrain();
  }
  if(key == 'w')
  {
    yoff-=speed;
  }
  if(key == 's')
  {
    yoff+=speed;
  }
  if(key == 'a')
  {
    xoff-=speed;
  }
  if(key == 'd')
  {
    xoff+=speed;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e < 0)
  {
    rizz+=0.01;
  } else
  {
    rizz-=0.01;
  }
}

color getColour(int x, int y) {
  float v = noise(xoff + x * scale, yoff + y * scale) - rizz;
  /*
  if(v < 0.3) {
    return color(#0009E3);
  } else if(v < 0.4) {
    return color(30, 255, 255);
  } else if(v < 0.7) {
    return color(66, 255, 255);
  } else {
    return color(80, 255, 100);
  }
  */
  if(v < 0.1)
  {
    return color(#08CBFF);
  } else if(v < 0.2)
  {
    return color(#0ADCFF);
  } else if(v < 0.3)
  {
    return color(#FFD80F);
  } else if(v < 0.4)
  {
    return color(#1FB72A);
  } else if(v < 0.5)
  {
    return color(#106A16);
  } else if(v < 0.6)
  {
    return color(#C4C4C4);
  } else if(v < 0.7)
  {
    return color(#717171);
  } else
  {
    return color(255);
  }
}