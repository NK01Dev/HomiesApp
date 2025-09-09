import 'dart:async';

class Throttler {
  Timer? _timer;

  void throttle(Function() function, {Duration? duration}) {
    _cancelTimer();

    _timer = Timer(
        duration ??
            const Duration(
              milliseconds: 500,
            ), () {
      function();
      _timer = null;
    });
  }

  void dispose() {
    _cancelTimer();
  }

  void _cancelTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }
}