// screens/contribute/disp_image.dart

import 'package:flutter/material.dart';

class DispImage extends StatelessWidget{
  final String _assetPath;

  DispImage(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 112, width: 160),
      decoration: BoxDecoration(color: Colors.grey),
      child: Image.asset(
        _assetPath,
        fit: BoxFit.cover,
      )
    );
  }
}