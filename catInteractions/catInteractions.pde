// Dear Data 100: my cats
// Two bar charts, one for each week, showing how many times
// my cats interacted with me on each day.

Table table;
String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

void setup() {
  size(1000, 500);
  // here AI had been used to help me load the CSV straight from my GitHub repo so that any changes made can be referred back to the sketch.
  table = loadTable("https://raw.githubusercontent.com/Furtoot1/Dear-data-100/main/cat-interactions.csv", "header, csv");
  if (table == null) {
    table = loadTable("cat-interactions.csv", "header");
  }
  noLoop();
}


int totalForDay(String day, int week) {
  int total = 0;
  for (TableRow row : table.rows()) {

    if (day.equals(row.getString("Day")) && row.getInt(0) == week) {
      total = total + row.getInt("interactions");
    }
  }
  return total;
}

void draw() {
  background(250, 245, 235);

  fill(40);
  textAlign(CENTER);
  textSize(20);
  text("How often my cats interact with me", width / 2, 40);


  int biggest = 1;
  for (int week = 1; week <= 2; week++) {
    for (int i = 0; i < days.length; i++) {
      biggest = max(biggest, totalForDay(days[i], week));
    }
  }

  drawChart(1, 40, biggest);
  drawChart(2, width / 2 + 20, biggest);
}


void drawChart(int week, float chartX, int biggest) {
  float barWidth = 45;
  float gap = 18;
  float baseY = height - 60;
  float tallest = height - 180; // height of the bar for the biggest day

  fill(40);
  textSize(16);
  text("Week " + week, chartX + 3.5 * (barWidth + gap), 85);


  stroke(0);
  line(chartX - 10, baseY, chartX + 7 * (barWidth + gap), baseY);

// in the for loop, AI had been used to ensure my structure was correct, allowing me to create perfect bar charts based on what my data shows.
  for (int i = 0; i < days.length; i++) {
    int total = totalForDay(days[i], week);
    float x = chartX + i * (barWidth + gap);
    // map() scales each total so the biggest day is "tallest" pixels high
    float h = map(total, 0, biggest, 0, tallest);

    noStroke();
    fill(150, 110, 80);
    rect(x, baseY - h, barWidth, h);

    fill(40);
    textSize(14);
    text(days[i].substring(0, 3), x + barWidth / 2, baseY + 25);
    text(total, x + barWidth / 2, baseY - h - 8);
  }
}
