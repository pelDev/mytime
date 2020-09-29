import 'package:flutter/material.dart';
import 'package:mytime/timer.dart';
import 'package:mytime/timermodel.dart';
import 'package:mytime/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyTimeHome extends StatefulWidget {
  @override
  _MyTimeHomeState createState() => _MyTimeHomeState();
}

class _MyTimeHomeState extends State<MyTimeHome> {
  int no;
  void emptyMethod() {
    print('start');
  }

  final CountDownTimer timer = CountDownTimer();
  final double defaultPadding = 5.0;

  void stop() {
    timer.stopTimer();
    print('stop');
  }

  void start() {
    timer.startTheTimer();
    print('start');
  }

  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Work Timer'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains) {
        final double availableWidth = constrains.maxWidth;
        return Column(
          children: [
            //
            //
            Row(
              children: [
                //
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                //
                Expanded(
                  child: ProductivityButton(
                      color: Color(0xff009688),
                      text: 'Work',
                      size: 150.0,
                      onPressed: timer.startWork),
                ),
                //
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                //
                Expanded(
                  child: ProductivityButton(
                      color: Color(0xff607D8B),
                      text: 'Short Break',
                      size: 150.0,
                      onPressed: () => timer.startBreak(true)),
                ),
                //
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                //
                Expanded(
                  child: ProductivityButton(
                    color: Color(0xff455A64),
                    text: 'Long Break',
                    size: 150.0,
                    onPressed: () => timer.startBreak(false),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                //
              ],
            ),
            //
            //
            StreamBuilder(
                initialData: '00:00',
                stream: timer.stream(),
                builder: (context, snapshot) {
                  TimerModel timer = snapshot.data == '00:00'
                      ? TimerModel('00:00', 1)
                      : snapshot.data;
                  return Expanded(
                    child: CircularPercentIndicator(
                      radius: availableWidth / 1.5,
                      lineWidth: 10.0,
                      percent: timer.percent,
                      center: Text(
                        timer.time,
                        style: Theme.of(context).textTheme.display1,
                      ),
                      progressColor: Color(0xff009688),
                    ),
                  );
                }),
            //
            //
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                //
                Expanded(
                  child: ProductivityButton(
                    color: Color(0xff212121),
                    text: 'Start',
                    size: 150.0,
                    onPressed: start,
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                //
                Expanded(
                  child: ProductivityButton(
                    color: Color(0xff212121),
                    text: 'Stop',
                    size: 150.0,
                    onPressed: stop,
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                //
              ],
            ),
          ],
        );
      }),
    );
  }
}
