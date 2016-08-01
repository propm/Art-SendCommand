import oscP5.*;
import netP5.*;

OscP5 oscp5;
NetAddress address;
OscMessage mes;
int season = 0;
int count = 0;

void setup(){
  oscp5 = new OscP5(this, 1234);                    //季節を送信するインスタンス、自分のポート
  address = new NetAddress("172.23.5.84", 1234);    //相手のIPアドレス、ポート
  frameRate(1); // 1秒毎に1回更新
}

void draw(){
  count++;
  
  //60秒に一度季節変更、送信
  if(count >= 60){
    count = 0;
    season++;
    if(season >= 4)  season = 0;
  
    //メッセージに季節の値を追加、送信
    mes = new OscMessage("/test");
    mes.add(season);
    oscp5.send(mes, address);
  
    println("season:"+season);
  }
}
