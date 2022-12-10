import 'dart:async';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
    StartTime();
  }

  StartTime() async{
  var duration = new Duration(milliseconds: 3500);
  return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => secondPage()
    )
    );
  }

  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RotationTransition(turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: FlutterLogo(size: 150,)),
          ),
        ),
      ),
    );
  }
}
class secondPage extends StatelessWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second page'), leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),),
      body: null,
    );
  }
}

