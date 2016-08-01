import oscP5.*;  //oscP5ライブラリをインポート
import netP5.*;

OscP5 osc;

int x; // 受信した値を保存するための変数

void setup(){
  size(100, 100);
  osc = new OscP5(this, 1234); //自分のポート番号:1234
  osc.plug(this,"getData","/test"); // getData:値を受け取る関数 , /test:値のアドレス
}

void getData(int a){
  x = a*10; //受け取ったaの10倍をxに代入
}

void draw(){
  background(0);
  fill(255, 0, 0);
  noStroke();
  ellipse(x + 10, 30, 10, 10); //受け取る値が変わると円のx座標が変化する
  println("Data : " + x);
}
