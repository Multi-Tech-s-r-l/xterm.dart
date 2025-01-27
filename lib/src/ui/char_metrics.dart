import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:xterm/src/ui/terminal_text_style.dart';

Size calcCharSize(TerminalStyle style, double textScaleFactor) {
  const test = 'mmmmmmmmmm';

  final textStyle = style.toTextStyle();
  final builder = ParagraphBuilder(textStyle.getParagraphStyle());
  builder.pushStyle(textStyle.getTextStyle(textScaler: TextScaler.linear(textScaleFactor)));
  builder.addText(test);

  final paragraph = builder.build();
  paragraph.layout(ParagraphConstraints(width: double.infinity));

  return Size(
    paragraph.maxIntrinsicWidth / test.length,
    paragraph.height,
  );
}
