// in seconds
float times[] = {
  2,
  15,
  3,
  5,
  6,
  10,
  30,
  20,
  1,
  4
};

int types[] = {
  0,
  2,
  1,
  3,
  0,
  1,
  3,
  1,
  0,
  2
};

HashMap play_types = new HashMap();

HashMap color_map = new HashMap();
color colors[] = new color[4];

void setup() {
  size(640, 200);

  colorMode(HSB, 360.0, 1.0, 1.0, 1.0);
  noStroke();

  play_types.put(0, "pause");
  play_types.put(1, "play test");
  play_types.put(2, "design");
  play_types.put(3, "programming");

  colors[0] = color(211.0, 0.44, 0.81, 1.0);
  colors[1] = color(303.0, 0.26, 0.67, 1.0);
  colors[2] = color(  0.0, 0.82, 0.93, 1.0);
  colors[3] = color( 36.0, 0.75, 0.99, 1.0);
}


void draw() {
  background(0);

  float duration_sum = 0;
  for(int i = 0; i < times.length; i++) {
    duration_sum += times[i];
  }

  float ratio = width / duration_sum;
  float offset = 0;

  for(int i = 0; i < times.length; i++) {
    int box_height = 20 + 10 * (int) types[i];
    int position_y = (height/2) - box_height;

    int box_width = (int)(times[i] * ratio);
    int position_x = (int) offset;
    offset += box_width;

    fill(colors[types[i]]);

    rect(position_x, position_y, box_width, box_height);
  }
}
