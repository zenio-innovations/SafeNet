import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';


class Gmap extends StatefulWidget {
  @override
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  GoogleMapController mapController;

  String searchAddr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        // GoogleMap(
        //   onMapCreated: onMapCreated,
        //   options: GoogleMapOptions(
        //       cameraPosition: CameraPosition(
        //           target: LatLng(40.7128, -74.0060), zoom: 10.0)),
        // ),
        GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 10.0)
        ),
        Positioned(
          top: 30.0,
          right: 15.0,
          left: 15.0,
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Address',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){},
                      iconSize: 30.0)),
              onChanged: (val) {
                setState(() {
                  searchAddr = val;
                });
              },
            ),
          ),
        )
      ],
    ));
  }

  // searchandNavigate() {
  //   Geolocator().placemarkFromAddress(searchAddr).then((result) {
  //     mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //         target:
  //             LatLng(result[0].position.latitude, result[0].position.longitude),
  //         zoom: 10.0)));
  //   });
  // }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}