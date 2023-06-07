import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

import '../../const/color.dart';

class KakaoMapView extends StatefulWidget {
  final double deptLat;
  final double deptLng;

  const KakaoMapView({
    Key? key,
    required this.deptLat,
    required this.deptLng,
  }) : super(key: key);

  @override
  State<KakaoMapView> createState() => _KakaoMapViewState();
}

class _KakaoMapViewState extends State<KakaoMapView> {

  late KakaoMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    print("${widget.deptLat}, ${widget.deptLng}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      height: 331,
      width: double.infinity,
      child: KakaoMap(
        currentLevel: 5,
        onMapCreated: ((controller) async {
          mapController = controller;
          markers.add(
            Marker(
              markerId: UniqueKey().toString(),
              latLng: await mapController.getCenter(),
              draggable: true,
            ),
          );
          setState(() {});
        }),
        markers: markers.toList(),
        minLevel: 0,
        maxLevel: 8,
        zoomControl: true,
        center: LatLng(37.62915393610253, 127.09569185257587),
      ),
    );
  }
}