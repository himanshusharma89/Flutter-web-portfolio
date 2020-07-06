import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HandCursor extends MouseRegion {
  // Get a regerence to the body of the view
  static final appContainer = html.window.document.querySelectorAll('flt-glass-pane')[0];

  HandCursor({Widget child})
    : super(
        onHover: (PointerHoverEvent evt) {
          appContainer.style.cursor = 'pointer';
        },
        onExit: (PointerExitEvent evt) {
          appContainer.style.cursor = 'default';
        },
        child: child,
      );
  }