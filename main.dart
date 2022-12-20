import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m12/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  runApp(const MyApp());
}

void backgroundCompute(args){
  print("Background computer callback");
  print("Calculating fibonacci from a background process");

  int first = 0;
  int second = 1;
  for(var i = 2; i <= 50; i++){
    var temp = second;
    second = first + second;
    first = temp;
    sleep(const Duration(milliseconds: 200));
    print("First : $first, second : $second");
  }
  print("Finished calculating fibonacci");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: const Text("Calculate fibo on computer isolate"),
            onPressed: (){
              compute(backgroundCompute, null);
            },
          ),
        ),
      ),
    );
  }
}