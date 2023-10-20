import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  Completer<GoogleMapController> controller = Completer();
  late CameraPosition localCamera;
  Set<Marker> listaMarcadores = {};

  onMapCreated (GoogleMapController googleMapController){
    controller.complete(googleMapController);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-23.354807, -51.162344),
                zoom: 16
          ),
          onMapCreated: onMapCreated,
          markers: listaMarcadores,
        )
      ),
    );
  }

  localizarDispositivo()async{
    bool servicosAtivos;
    LocationPermission permission;

    servicosAtivos = await Geolocator.isLocationServiceEnabled();
    if(!servicosAtivos){
      return Future.error("Serviços de Loc Desabilitados");
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Permissao para acesso negada");
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error("Permissao negada ");
    }

    Position posicao = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    criarMarcadores(posicao);
    setState(() {
      localCamera = CameraPosition(target: LatLng(posicao.latitude,posicao.longitude),
      zoom: 17);
    });
    movimentarCamera(localCamera);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  criarMarcadores(Position posicao) async{
    Set<Marker> marcadoresLocal = {};

    final Uint8List iconePer = await getBytesFromAsset('images/mulher.png', 200);
    Marker marcador3 = Marker(
        markerId: MarkerId("Marcador 3"),
        position: LatLng(posicao.latitude, posicao.longitude),
        infoWindow: InfoWindow(
            title: "Funcionária do Mês"
        ),
        icon: BitmapDescriptor.fromBytes(iconePer),

    );

    marcadoresLocal.add(marcador3);


    setState(() {
      listaMarcadores = marcadoresLocal;
    });
  }

  movimentarCamera(CameraPosition localCamera ) async{
    GoogleMapController googleMapController = await controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(localCamera));
  }

  @override
  void initState(){
    super.initState();
    localizarDispositivo();
  }
}
