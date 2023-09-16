import 'package:flutter/widgets.dart';

class MenuController extends ChangeNotifier {
  MenuController({
    required this.vsync,
  }) : _animationController = AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double get percentOpen {
    return _animationController.value;
  }

  void open() {
    _animationController.forward();
  }

  void close() {
    _animationController.reverse();
  }

  void toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
