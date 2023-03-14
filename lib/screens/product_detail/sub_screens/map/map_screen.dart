import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';
import 'dart:ui' as ui;

import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/data/repositories/geocoding_repository.dart';
import 'package:ishonch/screens/product_detail/sub_screens/map/widgets/my_drop_down.dart';
import 'package:ishonch/service/api_service/api_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.latLong}) : super(key: key);
  final LatLongModel latLong;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition initialCameraPosition;
  late CameraPosition cameraPosition;

  Set<Marker> mapMarkers = {
    // const Marker(
    //   markerId: MarkerId("id_1"),
    //   infoWindow: InfoWindow(
    //     title: "Najot Ta'lim",
    //     snippet: "Zamonaviy kasblar markazi",
    //   ),
    //   position: LatLng(
    //     41.286393176986685,
    //     69.20411702245474,
    //   ),
    // ),
  };

  _init() {
    initialCameraPosition = CameraPosition(
      target: LatLng(
        widget.latLong.lat,
        widget.latLong.long,
      ),
      zoom: 15,
    );
    cameraPosition = CameraPosition(
      target: LatLng(
        widget.latLong.lat,
        widget.latLong.long,
      ),
      zoom: 15,
    );

    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  String kind = "house";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MapCubit(geocodingRepo: GeocodingRepo(apiService: ApiService())),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: BlocBuilder<MapCubit, MapState>(
            builder: (context, state) {
              return Stack(
                children: [
                  GoogleMap(
                    // markers: mapMarkers,
                    padding: const EdgeInsets.all(16),
                    //  myLocationEnabled: true,
                    // liteModeEnabled: true,
                    // zoomControlsEnabled: false,
                    // zoomGesturesEnabled: true,
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    initialCameraPosition: initialCameraPosition,
                    onCameraMoveStarted: () {
                      print("MOVE STARTED");
                    },
                    onCameraMove: (position) {
                      print("CAMERA POSITION:${position.target.toString()}");
                      cameraPosition = position;
                    },
                    onCameraIdle: () {
                      print("CAMERA POSITION STOPPED");
                      print(
                        "CAMERA POSITION STOPPED:${cameraPosition.target.toString()}",
                      );
                      BlocProvider.of<MapCubit>(context).fetchAddress(
                        latLongModel: LatLongModel(
                          lat: cameraPosition.target.latitude,
                          long: cameraPosition.target.longitude,
                        ),
                        kind: kind,
                      );
                    },
                  ),
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Text(
                      state.currentAddress,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/images/location_icon.png",
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: MyDropDown(
                      onDropSelected: (value) {
                        setState(() {
                          kind = value;
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // mapMarkers.add(
              //   Marker(
              //       markerId: MarkerId(
              //           cameraPosition.target.latitude.toString()),
              //       infoWindow: InfoWindow(
              //         title: "Manzil",
              //         snippet: context
              //             .read<MapViewModel>()
              //             .addressText,
              //       ),
              //       position: cameraPosition.target,
              //   ),
              // );
              // _addMarker(context.read<MapCubit>().addressText);
            },
            child: const Icon(Icons.done),
          ),
        ),
      ),
    );
  }

  Future<void> _addMarker(String title) async {
    Uint8List markerImage = await getBytesFromAsset(
      "assets/images/location_icon.png",
      70,
    );
    mapMarkers.add(
      Marker(
        markerId: MarkerId(cameraPosition.target.latitude.toString()),
        infoWindow: InfoWindow(
          title: "Manzil",
          snippet: title,
        ),
        position: cameraPosition.target,
        icon: BitmapDescriptor.fromBytes(markerImage),
      ),
    );
    setState(() {});
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
