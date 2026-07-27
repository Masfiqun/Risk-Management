#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

// =============================
// WiFi Credentials
// =============================
const char* ssid = "MESL";
const char* password = "";

// =============================
// FastAPI Server
// Replace with your PC's IPv4
// Example:
// http://192.168.0.105:8000/sensor-data
// =============================
const char* serverUrl =
"http://192.168.0.100/sensor-data";

// =============================
// Analog Pins
// =============================
const int TEMP_PIN = 34;
const int GAS_PIN = 35;
const int HUMIDITY_PIN = 32;

// =============================
// Zone ID
// =============================
const int zoneId = 1;

// =============================

void connectWiFi()
{
    Serial.print("Connecting to WiFi");

    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
        Serial.print(".");
    }

    Serial.println();
    Serial.println("WiFi Connected!");

    Serial.print("ESP32 IP: ");
    Serial.println(WiFi.localIP());
}

void setup()
{
    Serial.begin(115200);

    pinMode(TEMP_PIN, INPUT);
    pinMode(GAS_PIN, INPUT);
    pinMode(HUMIDITY_PIN, INPUT);

    connectWiFi();
}

void loop()
{
    // ----------------------------
    // Reconnect WiFi if disconnected
    // ----------------------------

    if (WiFi.status() != WL_CONNECTED)
    {
        connectWiFi();
    }

    // ----------------------------
    // Read ADC
    // ----------------------------

    int tempRaw = analogRead(TEMP_PIN);
    int gasRaw = analogRead(GAS_PIN);
    int humidityRaw = analogRead(HUMIDITY_PIN);

    // ----------------------------
    // Convert values
    // ----------------------------

    float temperature =
        map(tempRaw, 0, 4095, 20, 80);

    float humidity =
        map(humidityRaw, 0, 4095, 0, 100);

    float gasLevel =
        map(gasRaw, 0, 4095, 0, 1000);

    // ----------------------------
    // Fire Detection
    // ----------------------------

    bool fireDetected = false;

    if (temperature > 60 || gasLevel > 700)
    {
        fireDetected = true;
    }

    // ----------------------------
    // Print Values
    // ----------------------------

    Serial.println("--------------------------------");

    Serial.print("Temperature: ");
    Serial.println(temperature);

    Serial.print("Humidity: ");
    Serial.println(humidity);

    Serial.print("Gas Level: ");
    Serial.println(gasLevel);

    Serial.print("Fire: ");
    Serial.println(fireDetected);

    // ----------------------------
    // Send HTTP POST
    // ----------------------------

    HTTPClient http;

    http.begin(serverUrl);

    http.addHeader(
        "Content-Type",
        "application/json"
    );

    JsonDocument doc;

    doc["zone_id"] = zoneId;
    doc["temperature"] = temperature;
    doc["humidity"] = humidity;
    doc["gas_level"] = gasLevel;
    doc["fire_detected"] = fireDetected;

    String json;

    serializeJson(doc, json);

    Serial.println();
    Serial.println("Sending JSON:");
    Serial.println(json);

    int httpResponseCode =
        http.POST(json);

    Serial.print("HTTP Response: ");
    Serial.println(httpResponseCode);

    if (httpResponseCode > 0)
    {
        String response =
            http.getString();

        Serial.println(response);
    }
    else
    {
        Serial.print("Error: ");
        Serial.println(
            http.errorToString(httpResponseCode)
        );
    }

    http.end();

    delay(2000);
}