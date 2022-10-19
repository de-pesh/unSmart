import 'dart:async';

import 'package:flutter/material.dart';
import 'controller.dart';
//import 'package:unsmart/controller.dart';
import 'models/feedback.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'unSmart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isButtonActive = true;
  void _submitForm() {
    FeedbackForm feedbackForm = FeedbackForm("hi");
    FormController formController = FormController((response) {});
    formController.submitForm(feedbackForm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 152, 152),
        title: const Text(
          "de unSmart Light",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: isButtonActive == true
                            ? () {
                                _submitForm();
                                setState(() {
                                  isButtonActive = false;
                                });
                                Timer(const Duration(seconds: 3), () {
                                  setState(() {
                                    isButtonActive = true;
                                  });
                                });
                              }
                            : null,
                        child: const Text('Request Service'))
                    // ElevatedButton(
                    //   child: const Center(
                    //     child: Text('Request Service'),
                    //   onPressed: (){_submitForm,

                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
