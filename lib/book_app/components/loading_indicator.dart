import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

Center loadingIndicator(context) {
  return  Center(
    child: SpinKitDoubleBounce(
      size: 40.0,
      color: Theme.of(context).colorScheme.secondary,
    ),
  );
}
