import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Desenhos extends StatefulWidget {
  const Desenhos({super.key});

  @override
  State<Desenhos> createState() => _DesenhosState();
}

class _DesenhosState extends State<Desenhos> {

  Completer<GoogleMapController> controller = Completer();

  Set<Polygon> listaPoligonos = {};

  onMapCreated (GoogleMapController googleMapController){
    controller.complete(googleMapController);
  }

  desenharPoligonos(){
    Set<Polygon> poligonos = {};

    Polygon poligono1 = Polygon(
        polygonId: PolygonId("poligono1"),
        fillColor: Colors.green,
        strokeColor: Colors.red,
        points: [
          LatLng(-25.401215, -49.253158),
          LatLng(-25.401455, -49.254882),
          LatLng(-25.402881, -49.253627),

        ]
    );

    poligonos.add(poligono1);
    setState(() {
      listaPoligonos = poligonos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Container(
          child: GoogleMap(
            mapType: MapType.satellite,
            initialCameraPosition: CameraPosition(
                target: LatLng(-25.401645, -49.253664),
                zoom: 16
            ),
            onMapCreated: onMapCreated,
            polygons: listaPoligonos,
          )
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    desenharPoligonos();
  }
}
