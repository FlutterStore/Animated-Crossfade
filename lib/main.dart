import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AnimatedCrossFade',style: TextStyle(fontSize: 15),),
      ),
      body: GestureDetector(
        onTap: () {
        setState(() {
          selected = !selected;
        });
      },
        child: Center(
          child: AnimatedCrossFade(
            alignment: Alignment.center,
            excludeBottomFocus: true,
            firstCurve: Curves.linear,
            // layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {return Text("data");},
            reverseDuration: Duration(seconds: 2),
            secondCurve: Curves.linear,
            sizeCurve: Curves.linear, 
            duration: const Duration(seconds: 3),
            firstChild: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green
              ),
              alignment: Alignment.center,
              child: const Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            secondChild:  Container(
              height: 200,
              width: 300,
              alignment: Alignment.center,
              child: const Text("Successoft Infotech",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
            ),
            crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          )
        ),
      ),
    );
  }
}
