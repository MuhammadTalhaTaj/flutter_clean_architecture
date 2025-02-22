

import '../constants/imports.dart';

extension IntExtensions on int {

  SizedBox get h => SizedBox(height: this.toDouble());

  SizedBox get w => SizedBox(width: this.toDouble());
}