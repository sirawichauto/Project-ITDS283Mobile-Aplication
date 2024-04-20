import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.743005930350497, 100.60166701876815),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(13.743005930350497, 100.60166701876815),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Set<Marker> _markers = {}; // เก็บหมุดที่จะปักลงบนแผนที่

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // กระทำเมื่อปุ่มย้อนกลับถูกกด
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _addMarker(); // เมื่อสร้างแผนที่เสร็จเรียบร้อยให้ปักหมุด
            },
            markers: _markers,
          ),
          Positioned(
            bottom: 16.0, // ระยะห่างจากด้านล่างของหน้าจอ
            left: 150.0,
            right: 150.0,
            child: FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: const Text('Hotel'),
              icon: const Icon(Icons.hotel),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  // เพิ่มฟังก์ชันสำหรับปักหมุด
  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('hotel'),
          position: LatLng(13.743005930350497, 100.60166701876815),
          infoWindow: InfoWindow(
            title: 'Hotel',
            snippet: 'This is a hotel',
          ),
          icon: BitmapDescriptor.defaultMarker, // ใช้ไอคอนหมุดเริ่มต้น
        ),
      );
    });
  }
}
