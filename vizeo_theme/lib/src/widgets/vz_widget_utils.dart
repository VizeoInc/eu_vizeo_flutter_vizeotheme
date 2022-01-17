import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/private/vizeo_radius.dart';

import '../../vizeo_theme.dart';

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

  Center withCenter() {
    return Center(
      child: this,
    );
  }

  Future<dynamic> showHimself() {
    return showDialog(
      context: vzThemeKey.currentContext!,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            this,
          ],
        );
      },
    );
  }

  Container withContainerTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radiusGlobal,
        color: VzColor.backgroundSecondary(),
        border: Border.all(color: VzColor.backgroundSecondary(isReverse: true,),),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: VzColor.backgroundSecondary(isReverse: true),
              borderRadius: radiusTopOnly,
            ),
            child: VzText.typePrimary(
              data: title,
              style: TypeDeTextStyle.body1,
              color: VzColor.textPrimary(isReverse: true),
            ).withPaddingWidget().withCenter(),
          ).withPaddingWidget().withFlexibleWidget(),
        ],
      ),
    );
  }
}
