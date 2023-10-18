import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/Video.dart';

const CHAVE_GOOGLE = 'AIzaSyAcj-H0ZDDV02zTrvTSfiU6qEbm9TbOYho';
const ID_CANAL = 'UCZDsqSxJMnEsPg8Jm4FH8dQ';
const  URL_BASE = 'https://www.googleapis.com/youtube/v3/search';

class Api{


  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response resposta = await http.get(
        Uri.parse(URL_BASE +
            "?part=snippet"
             "&type=video"
             "&maxResults=15"
             "&order=date"
             "&channelId=${ID_CANAL}"
             "&key=${CHAVE_GOOGLE}"
             "&q=${pesquisa}"
        )
    );

    if(resposta.statusCode == 200){
      Map<String,dynamic> dadosJson = json.decode(resposta.body);
      List<Video> listaVideos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      return listaVideos;
    }else{
      return List.empty();
    }
}


}