import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Locationscreen extends StatefulWidget {
  const Locationscreen({super.key});

  @override
  State<Locationscreen> createState() => _LocationscreenState();
}

class _LocationscreenState extends State<Locationscreen> {
  String myPosition = '';

  Future<Position> getPosition() async {
    await Future.delayed(const Duration(seconds: 3));
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      setState(() {
        // myPosition = myPosition;
        myPosition =
            "Latitude: ${myPos.latitude.toString()} - Longtitude: ${myPos.longitude.toString()}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final myWidget = myPosition == '' ? const CircularProgressIndicator() : Text(myPosition);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location - Dika yonanda putra'),
      ),
      body: Center(
        child:
            myPosition == '' ? CircularProgressIndicator() : Text(myPosition),
      ),
    );
  }
}
