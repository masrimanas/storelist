// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart'
//     show
//         CameraPosition,
//         GoogleMap,
//         GoogleMapController,
//         InfoWindow,
//         LatLng,
//         Marker,
//         MarkerId;

// import '../../domain/entities/store.dart';

// class MapsView extends StatefulWidget {
//   final Store store;
//   const MapsView({
//     Key? key,
//     required this.store,
//   }) : super(key: key);

//   @override
//   MapsViewState createState() => MapsViewState();
// }

// class MapsViewState extends State<MapsView> {
//   final Map<String, Marker> _markers = {};
//   Future<void> _onMapCreated(GoogleMapController controller) async {
//     setState(() {
//       final storeLong = double.parse(widget.store.longitude);
//       final storeLat = double.parse(widget.store.latitude);
//       _markers.clear();
//       final marker = Marker(
//         markerId: MarkerId(widget.store.storeName),
//         position: LatLng(storeLat, storeLong),
//         infoWindow: InfoWindow(
//           title: widget.store.storeName,
//           snippet: widget.store.address,
//         ),
//       );
//       _markers[widget.store.storeName] = marker;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final storeLong = double.parse(widget.store.longitude);
//     final storeLat = double.parse(widget.store.latitude);
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Google Office Locations'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: LatLng(storeLat, storeLong),
//             zoom: 2,
//           ),
//           markers: _markers.values.toSet(),
//         ),
//       ),
//     );
//   }
// }
