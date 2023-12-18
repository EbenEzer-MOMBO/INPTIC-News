// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:blurrycontainer/blurrycontainer.dart';

class Flouteur extends StatefulWidget {
  const Flouteur({this.width, this.height, super.key});

  final double? width;
  final double? height;

  @override
  State<Flouteur> createState() => _FlouteurState();
}

class _FlouteurState extends State<Flouteur> {
  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      child: Text(""),
      blur: 5,
      width: widget.width,
      height: widget.height,
      elevation: 0,
      color: Colors.transparent,
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    );
  }
}
