import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/private/vizeo_radius.dart';
import 'package:flemme/flemme.dart';

import '../../vizeo_theme.dart';

extension MiseEnForme on Widget {
  Container withContainerTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radiusGlobal,
        color: VzColor.backgroundSecondary(),
        border: Border.all(
          color: VzColor.backgroundSecondary(
            isReverse: true,
          ),
        ),
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
            ).withPadding().withCenter(),
          ),
          // ignore: unnecessary_this
          this.withPadding().withFlexible(),
        ],
      ),
    );
  }
}
