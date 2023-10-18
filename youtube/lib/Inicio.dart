import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}


class _InicioState extends State<Inicio> {

  Future<List<Video>> buscar(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);

  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: buscar("MILHO"),
      builder: (context,snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            print("AGUARDANDO");
            return Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.done:
            print("Conexão Finalizada");
            if(snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index){
                    List<Video>? lista = snapshot.data as List<Video>;
                    Video video = lista[index];
                    return YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: video.id,
                            flags: YoutubePlayerFlags(
                              autoPlay: false,
                            ),
                          ),
                        ),
                        builder: (context,player){
                          return Column(
                            children: [
                              player,
                              ListTile(
                                title: Text(video.titulo),
                                subtitle: Text(video.descricao),
                              ),
                            ],
                          );
                        }
                    );
                  },

                  separatorBuilder: (context,index)=>Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: (snapshot.data as List<Video>).length
              );
            }else{
              return Center(
                child: Text("Nenhum Vídeo a ser exibido atualmente."),
              );
            }
        }
      }
    );
  }
}
