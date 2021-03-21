import 'dart:async';

import 'package:flutter/cupertino.dart';

class CountDown extends StatefulWidget {
  const CountDown(this.start);
  final String start;

  @override
  State<StatefulWidget> createState() => CountDownState();
}

class CountDownState extends State<CountDown> {
  Timer _timer;
  int _start;

  @override
  void initState() {
    final int time = DateTime.parse(widget.start)
        .toLocal()
        .difference(DateTime.now().toLocal())
        .inSeconds;
    _start = time;
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (mounted) {
        if (_start <= 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _start <= 0
        ? Text('Expired try another')
        : Container(
            key: const Key('count_down_timer'),
            child: Text(
              _start.toString(),
            ));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
