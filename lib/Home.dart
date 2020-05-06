import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  bool playResume =true;
  double volume = 0.5;


  _executar() async{


    if (playResume == true){
      audioPlayer.setVolume(volume);
      audioPlayer = await audioCache.play("Guns N' Roses - Sweet Child O' Mine (Official Music Video).mp3");
      playResume = false;

    }else{
      int resumido = await audioPlayer.resume();
    }




    /*
    //String url = "https://www.youtube.com/watch?v=1w7OgIMMRc4";
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    int resultado = await audioPlayer.play(url);

    if(resultado==1){
      //sucesso

    }else{
      //erro
    }*/


  }

  _pausar() async{
    int resumir = await audioPlayer.pause();

  }

  _parar() async{

    int pausar = await audioPlayer.stop();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:AppBar(
        title: Text("Executando sons"),
      ) ,
      body: Column(
        children: <Widget>[
          //slides
          Slider(
              value: volume,
              min: 0,
              max: 1,
              //divisions: 10,
              onChanged: (novoVolume){

                setState(() {
                  volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);
              }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //item 1
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: (){
                    _executar();
                  },
                ),
              ),
              //item 2
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: (){
                    _pausar();
                  },
                ),
              ),
              //item 3
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: (){
                    _parar();
                  },
                ),
              )
            
            ],
          )
        ],
      ),
    );
  }
}
