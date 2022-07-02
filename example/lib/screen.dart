import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      'Screen 1',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    )));
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Screen 2',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Screen 3',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Screen 4',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }
}
