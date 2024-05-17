// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'dart:async';


// could build pur very own camer app.
// class CameraController extends StatefulWidget {
//   @override
//   const CameraController({super.key});
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _CameraControllerState();
//   }
// }

// class _CameraControllerState extends State<CameraController>
//     with WidgetsBindingObserver {
//   CameraController? _controller;
//   bool _cameraInit = false;
//   late final List<CameraDescription> _cameras;
//   Future<void> initCamera() async {
//     _cameras = await availableCameras();

//     await onNewCameraSelected(_cameras.first);
//   }

//   Future<void> onNewCameraSelected(CameraDescription description) async {
//     final previousCameraController = _controller;

//     final CameraController cameraController = CameraController(
//         description, ResolutionPreset.high, ImageFormatGroup.jpeg);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
