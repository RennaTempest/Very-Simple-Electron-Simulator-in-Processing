float randomFloat = random(1, 28.9);  // Generate a random float between 1 and 28
int randomInt = floor(randomFloat);  // Round the float down to the nearest integer

int numElectrons = randomInt;  // Number of electrons in chlorine
int innerShell = 0;
int middleShell = 0; 
int outerShell = 0;
float innerShellRadius = 50;
float middleShellRadius = 75;
float outerShellRadius = 100;
float electronRadius = 5;  // Radius of each electron
float[] electronPositions;  // Array to store the positions of the electrons

void setup() {
  size(400, 400);
  electronPositions = new float[numElectrons * 2];  // Initialize the array
  
  // Determine the number of electrons in each shell
  if (numElectrons > 2) {   //checks if electron is more, less, or equal to 2 then sets inner shell
    innerShell = 2;
    numElectrons -= 2;
  } else if (numElectrons == 2) {
    innerShell = 2;
    numElectrons = 0;
  } else if (numElectrons < 2) {
    innerShell = numElectrons;
    numElectrons = 0;
  }
  if (numElectrons > 8) {  //checks if electron is more, less, or equal to 8 then sets middle shell
    middleShell = 8;
    numElectrons -= 8;
  } else if (numElectrons == 8) {
    middleShell = 8;
    numElectrons = 0;
  } else if (numElectrons < 8) {
    middleShell = numElectrons;
    numElectrons = 0;
  }
  if (numElectrons > 0) {  //sets remaining electrons to outer shell
    outerShell = numElectrons;
    numElectrons = 0;
  }
}

void draw() {
  background(255);

  // Calculate the positions of the electrons in the inner shell
  for (int i = 0; i < innerShell; i++) {
    float angle = map(i, 0, innerShell, 0, TWO_PI);
    float x = 200 + innerShellRadius * cos(angle);
    float y = 200 + innerShellRadius * sin(angle);
    electronPositions[i * 2] = x;
    electronPositions[i * 2 + 1] = y;
  }

  // Draw the electrons in the inner shell
  strokeWeight(2);
  stroke(0);
  noFill();
  for (int i = 0; i < innerShell; i++) {
    ellipse(electronPositions[i * 2], electronPositions[i * 2 + 1], electronRadius, electronRadius);
  }
  
  // Draw a circle passing through the electrons in the inner shell
  strokeWeight(1);
  stroke(255,0,0);
  ellipse(200, 200, innerShellRadius*2, innerShellRadius*2);
  
  // Calculate the positions of the electrons in the middle shell
  for (int i = 0; i < middleShell; i++) {
    float angle = map(i, 0, middleShell, 0, TWO_PI);
    float x = 200 + middleShellRadius * cos(angle);
    float y = 200 + middleShellRadius * sin(angle);
    electronPositions[i * 2] = x;
    electronPositions[i * 2 + 1] = y;
  }

    // Draw the electrons in the middle shell
  strokeWeight(2);
  stroke(0);
  for (int i = 0; i < middleShell; i++) {
    ellipse(electronPositions[i * 2], electronPositions[i * 2 + 1], electronRadius, electronRadius);
  }
  
  // Draw a circle passing through the electrons in the middle shell
  strokeWeight(1);
  stroke(0,255,0);
  noFill();
  ellipse(200, 200, middleShellRadius*2, middleShellRadius*2);
  
  // Calculate the positions of the electrons in the outer shell
  for (int i = 0; i < outerShell; i++) {
    float angle = map(i, 0, outerShell, 0, TWO_PI);
    float x = 200 + outerShellRadius * cos(angle);
    float y = 200 + outerShellRadius * sin(angle);
    electronPositions[i * 2] = x;
    electronPositions[i * 2 + 1] = y;
  }

  // Draw the electrons in the outer shell
  strokeWeight(2);
  stroke(0);
  for (int i = 0; i < outerShell; i++) {
    ellipse(electronPositions[i * 2], electronPositions[i * 2 + 1], electronRadius, electronRadius);
  }
  
  // Draw a circle passing through the electrons in the outer shell
  strokeWeight(1);
  stroke(0,0,255);
  noFill();
  ellipse(200, 200, outerShellRadius*2, outerShellRadius*2);
  
  
textAlign(CENTER, CENTER);  // Align the text to the center of the screen
textSize(32);  // Set the size of the text
fill(0);  // Set the color of the text to black
text(randomInt, width / 2, height / 2);  // Draw the text at the center of the screen


}
