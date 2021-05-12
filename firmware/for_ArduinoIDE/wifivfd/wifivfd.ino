#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
#include <ESP8266HTTPClient.h>
#include <Ticker.h>
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>
#include <OneButton.h>
#include <WiFiUdp.h>
#include <NTPClient.h>

// VFD 引脚设置
uint8_t din = D4;   // DA
uint8_t clk = D5;   // CK
uint8_t cs = D2;    // CS
uint8_t Reset = D1; // RS
uint8_t en = D0;    // EN

// B站UID
String biliuid = "623441609";

// 时间偏移（时区） 单位：秒，默认+8小时（北京时间）
int timeoffset = 28800;

void Conn_WIFI(void);
void write_6302(unsigned char w_data);
void VFD_cmd(unsigned char command);
void S1201_show(void);
void VFD_init(void);
void S1201_WriteOneChar(unsigned char x, unsigned char chr);
void S1201_WriteStr(unsigned char x, char *str);
void FansGet_Callback(void);
void PageChange_Callback(void);
void ShowFans(void);
void FansUpdate(void);
void DHTGet_Callback(void);
void DHTUpdate(void);
void ShowTemp(void);
void ShowHumi(void);
void Button_LongPress(void);
void TimeGet_Callback(void);
void Time_Cal(void);
void ShowTime(void);
void TimeUpdate(void);
void VFD_bright(char level);
void Button_DoubleClick(void);

DynamicJsonDocument jsonBuffer(1024);
WiFiClient client;
// 温度传感器设置
DHT_Unified dht(D6, DHT11);
// 按钮设置
OneButton button(D3, true);

// NTP服务器设置
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "cn.pool.ntp.org");
int hours = 0, minutes = 0, seconds = 0;

bool FansGet_Flag = false;
bool DHTGet_Flag = false;
bool TimeGet_Flag = false;
bool PageAuto = true;
int bilifans = 0;
int PageChange_Flag = 0;
int Bright_Flag = 2;
float DHT_Temp = 0;
float DHT_Humi = 0;

Ticker FansGet;
Ticker DHTGet;
Ticker PageChange;
Ticker TimeGet;
Ticker TimeCal;

// 初始化
void setup()
{
  delay(500);
  Serial.begin(115200);

  pinMode(en, OUTPUT);
  pinMode(clk, OUTPUT);
  pinMode(din, OUTPUT);
  pinMode(cs, OUTPUT);
  pinMode(Reset, OUTPUT);
  digitalWrite(en, HIGH);
  digitalWrite(Reset, LOW);
  delay(10);
  digitalWrite(Reset, HIGH);
  VFD_init();

  // 欢迎信息 BEGIN
  S1201_WriteStr(0, (char *)"Hello...");
  S1201_show();
  for (int x = 0; x < 255; x++)
  {
    VFD_bright(x);
    delay(5);
  }
  delay(1000);
  S1201_WriteStr(0, (char *)"Tenten  ");
  S1201_show();
  for (int x = 255; x >= 0; x--)
  {
    VFD_bright(x);
    delay(5);
  }
  delay(1000);
  // 欢迎信息 END

  VFD_bright(Bright_Flag * 85);
  WiFi.mode(WIFI_STA);

  dht.begin();

  button.reset();
  button.attachClick(PageChange_Callback);
  button.attachDoubleClick(Button_DoubleClick);
  button.attachLongPressStart(Button_LongPress);

  Conn_WIFI();

  Serial.println();
  Serial.print("IP Address:");
  Serial.println(WiFi.localIP());

  S1201_WriteStr(0, (char *)"WiFi OK ");
  S1201_show();
  delay(1000);
  S1201_WriteStr(0, (char *)"        ");
  S1201_show();

  timeClient.begin();
  timeClient.setTimeOffset(timeoffset);

  FansGet.attach(5, FansGet_Callback);
  DHTGet.attach(2, DHTGet_Callback);
  PageChange.attach(30, PageChange_Callback);
  TimeGet.attach(10, TimeGet_Callback);
  TimeCal.attach(1, Time_Cal);
  TimeUpdate();
  FansUpdate();
}

// 主循环
void loop()
{
  button.tick();
  if (TimeGet_Flag)
  {
    TimeUpdate();
  }
  if (FansGet_Flag)
  {
    FansUpdate();
  }
  if (DHTGet_Flag)
  {
    DHTUpdate();
  }

  switch (PageChange_Flag)
  {
  case 0:
  {
    ShowFans();
    break;
  }
  case 1:
  {
    ShowTime();
    break;
  }
  case 2:
  {
    ShowTemp();
    break;
  }
  case 3:
  {
    ShowHumi();
    break;
  }
  }
  delay(100);
}

// 显示时间
void ShowTime()
{
  char outStr[8];
  sprintf(outStr, "%02d:%02d:%02d", hours, minutes, seconds);
  S1201_WriteStr(0, outStr);
  S1201_show();
}

// 更新时间计时器函数
void TimeGet_Callback(void)
{
  TimeGet_Flag = true;
}

// 更新时间
void TimeUpdate(void)
{
  TimeGet_Flag = false;
  if (WiFi.status() == WL_CONNECTED)
  {
    timeClient.update();
    hours = timeClient.getHours();
    minutes = timeClient.getMinutes();
    seconds = timeClient.getSeconds();
  }
}

// 时间进制处理（一秒一次）
void Time_Cal(void)
{
  seconds++;
  if (seconds >= 60)
  {
    minutes++;
    seconds = 0;
  }
  if (minutes >= 60)
  {
    hours++;
    minutes = 0;
  }
  if (hours > 24)
  {
    hours = 0;
  }
}

// 按钮双击事件
void Button_DoubleClick()
{
  Bright_Flag++;
  if (Bright_Flag > 3)
  {
    Bright_Flag = 1;
  }
  VFD_bright(Bright_Flag * 85);
}

// 按钮长按事件
void Button_LongPress()
{
  if (PageAuto)
  {
    S1201_WriteStr(0, (char *)"Manual  ");
    PageChange.detach();
  }
  else
  {
    S1201_WriteStr(0, (char *)"Auto    ");
    PageChange.attach(30, PageChange_Callback);
  }

  PageAuto = !PageAuto;
  S1201_show();
  delay(1000);
}

// 显示湿度
void ShowHumi()
{
  char humiStr[8];
  sprintf(humiStr, "%.2f", DHT_Humi);
  S1201_WriteStr(0, (char *)"        ");
  S1201_WriteStr(0, humiStr);
  S1201_WriteOneChar(7, 0x25);
  S1201_show();
}

// 显示温度
void ShowTemp()
{
  char tempStr[8];
  sprintf(tempStr, "%.2f", DHT_Temp);
  S1201_WriteStr(0, (char *)"        ");
  S1201_WriteStr(0, tempStr);
  S1201_WriteOneChar(6, 0xEF);
  S1201_WriteOneChar(7, 0x43);
  S1201_show();
}

// 更新DHT传感器数据
void DHTUpdate()
{
  DHTGet_Flag = false;
  sensors_event_t event;
  dht.temperature().getEvent(&event);
  if (isnan(event.temperature))
  {
    Serial.println("Error reading temperature!");
  }
  else
  {
    DHT_Temp = event.temperature;
  }

  dht.humidity().getEvent(&event);
  if (isnan(event.relative_humidity))
  {
    Serial.println("Error reading humidity!");
  }
  else
  {
    DHT_Humi = event.relative_humidity;
  }
}

// DHT传感器计时器函数
void DHTGet_Callback()
{
  DHTGet_Flag = true;
}

// 显示粉丝数
void ShowFans()
{
  if (bilifans < 99999999)
  {
    char outStr[8];
    sprintf(outStr, "%08d", bilifans);
    S1201_WriteStr(0, outStr);
  }
  else
  {
    S1201_WriteStr(0, (char *)"OverLoad");
  }
  S1201_show();
}

// 连接Wifi
void Conn_WIFI()
{
  S1201_WriteStr(0, (char *)"WiFi    ");
  S1201_show();

  int pos = 0;
  int wificount = 0;
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    if (pos > 2)
    {
      pos = 0;
      S1201_WriteStr(0, (char *)"WiFi    ");
    }
    S1201_WriteOneChar(5 + pos, 0x2E);
    S1201_show();
    pos++;

    if (wificount++ >= 20)
    {
      WiFi.beginSmartConfig();
      while (!WiFi.smartConfigDone())
      {
        delay(500);
        S1201_WriteStr(0, (char *)"SmartCfg");
        S1201_show();
      }
      wificount = 0;
      pos = 3;
    }
  }
}

// 粉丝数更新
void FansUpdate(void)
{
  FansGet_Flag = false;
  if (WiFi.status() == WL_CONNECTED)
  {
    HTTPClient http;
    http.begin(client, "http://api.bilibili.com/x/relation/stat?vmid=" + biliuid);
    auto httpCode = http.GET();
    if (httpCode > 0)
    {
      String resBuff = http.getString();
      DeserializationError error = deserializeJson(jsonBuffer, resBuff);
      if (error)
      {
        Serial.println("Error bilibili api!");
      }
      JsonObject root = jsonBuffer.as<JsonObject>();
      bilifans = root["data"]["follower"];
      //Serial.println(fans);
    }
  }
}

// 获取粉丝数计时器函数
void FansGet_Callback(void)
{
  FansGet_Flag = true;
}

// 显示信息切换计时器函数
void PageChange_Callback(void)
{
  PageChange_Flag++;
  if (PageChange_Flag > 3)
  {
    PageChange_Flag = 0;
  }
}

// 发送单个字节数据
void write_6302(unsigned char w_data)
{
  unsigned char i;
  for (i = 0; i < 8; i++)
  {
    digitalWrite(clk, LOW);
    if ((w_data & 0x01) == 0x01)
    {
      digitalWrite(din, HIGH);
    }
    else
    {
      digitalWrite(din, LOW);
    }
    w_data >>= 1;
    digitalWrite(clk, HIGH);
  }
}

// 向屏幕发送指定命令
void VFD_cmd(unsigned char command)
{
  digitalWrite(cs, LOW);
  write_6302(command);
  digitalWrite(cs, HIGH);
  delayMicroseconds(5);
}

// 刷新屏幕显示输入的字符
void S1201_show(void)
{
  digitalWrite(cs, LOW);
  write_6302(0xe8);
  digitalWrite(cs, HIGH);
}

// 初始化屏幕
void VFD_init()
{
  digitalWrite(cs, LOW);
  write_6302(0xe0);
  delayMicroseconds(5);
  write_6302(0x07);
  digitalWrite(cs, HIGH);
  delayMicroseconds(5);
}

// 设置屏幕亮度
void VFD_bright(char level)
{
  digitalWrite(cs, LOW);
  write_6302(0xe4);
  delayMicroseconds(5);
  write_6302(level);
  digitalWrite(cs, HIGH);
  delayMicroseconds(5);
}

// 发送单个字符（寄存器）
void S1201_WriteOneChar(unsigned char x, unsigned char chr)
{
  digitalWrite(cs, LOW);
  write_6302(0x20 + x);
  write_6302(chr);
  digitalWrite(cs, HIGH);
  //S1201_show();
}

// 发送多个字符
void S1201_WriteStr(unsigned char x, char *str)
{
  digitalWrite(cs, LOW);
  write_6302(0x20 + x);
  while (*str)
  {
    write_6302(*str);
    str++;
  }
  digitalWrite(cs, HIGH);
  //S1201_show();
}
