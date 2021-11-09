import 'package:flutter/cupertino.dart';

extension MiseEnForme on Widget {
  Padding withPaddingWidget({
    EdgeInsets padding = const EdgeInsets.all(8.0),
  }) {
    return Padding(padding: padding, child: this);
  }

  Flexible withFlexibleWidget({
    int flex = 1,
    FlexFit fit = FlexFit.tight,
  }) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
    );
  }

  Expanded withExpandedWidget({
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }
}
