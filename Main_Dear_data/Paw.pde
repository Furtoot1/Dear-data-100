class Paw {
  int week;
  String day;
  String time;
  int interactions;

  Paw(int week, String day, String time, int interactions ) {
    this.week = week;
    this.day = day;
    this.time = time;
    this.interactions = interactions;
    
    
  }
  void display() {
  noStroke();
  fill(70, 70, 70);
  ellipse(400, 400, 170, 100);
  ellipse(300, 300, 60, 100);
  ellipse(365, 260, 60, 110);
  ellipse(500, 300, 60, 100);
  ellipse(435, 260, 60, 110);

  fill(216, 133, 133);
  ellipse(400, 400, 110, 60);
  ellipse(300, 300, 30, 50);
  ellipse(365, 260, 30, 55);
  ellipse(500, 300, 30, 50);
  ellipse(435, 260, 30, 55);

  fill(70, 70, 70);
  triangle(425, 220, 435, 180, 445, 220);
  triangle(355, 220, 365, 180, 375, 220);
  triangle(290, 260, 300, 220, 310, 260);
  triangle(490, 260, 500, 220, 510, 260);
}

}
