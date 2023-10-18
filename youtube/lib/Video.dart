import 'dart:convert';

class Video{

  String id;
  String titulo;
  String descricao;
  String canal;
  String image;

  Video(this.id,this.titulo,this.descricao,this.canal,this.image);

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      json["id"]["videoId"],
      json["snippet"]["title"],
      json["snippet"]["description"],
      json["snippet"]["channelTitle"],
      json["snippet"]["thumbnails"]["high"]["url"],
    );
  }
}