int analogpin = 0;
int bin_val = 0;
void setup() {
  // put your setup code here, to run once:
  pinMode(DAC0,OUTPUT);
  analogReadResolution(12);
  analogWriteResolution(12);
}

void loop() {
  bin_val = analogRead(analogpin);
  analogWrite(DAC0,bin_val);
  delayMicroseconds(1000);
}
