#include <Adafruit_Sensor.h>
#include <WiFi.h>
#include <PubSubClient.h>
//const char* ssid = "mingdaWiFi";
//const char* password = "wmd97128";
//const char* ssid = "huiling";
//const char* password = "bhl000721";
const char* ssid = "mingdaWiFi";
const char* password = "wmd97128";
const char* mqtt_server = "broker.hivemq.com";
const char* mqtt_server2 = "broker.hivemq.com";
WiFiClient espClient;
PubSubClient client(espClient);

int freq = 2000;
int channel = 0;
int resolution = 8;

void setup_wifi() {
  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  randomSeed(micros());

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
  if((char)payload[0] == '0')
    buzzer1();
  else if((char)payload[0] == '1')
    buzzer2();
  else if((char)payload[0] == '2')
    buzzer2();
  else if((char)payload[0] == '3')
    buzzer2();
  else if((char)payload[0] == '4')
    buzzer2();
}



void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);
    if (client.connect(clientId.c_str())) {
      Serial.println("connected");
      client.subscribe("cryBaby");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}


void setup() {
  
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  ledcSetup(channel, freq, resolution);
  ledcAttachPin(4, channel);
  
}

void loop() {

  if (!client.connected()) {
    reconnect();
  }
  client.loop();
  
  delay(5000);

}

void buzzer1(){
  for(int i=0; i<3;i++){
    ledcWriteTone(channel, 2000);
    ledcWrite(channel, 125);
    delay(600);
    ledcWrite(channel, 0);
    delay(400);
    }
  }
void buzzer2(){
  for(int i=0; i<10;i++){
    ledcWriteTone(channel, 2000);
    ledcWrite(channel, 125);
    delay(100);
    ledcWrite(channel, 0);
    delay(100);
    }
  }
