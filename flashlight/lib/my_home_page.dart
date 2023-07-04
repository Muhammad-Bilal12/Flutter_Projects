import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:torch_light/torch_light.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// Torch light is on

  Future<void> torchOn() async {
    try {
      await TorchLight.enableTorch();
    } on EnableTorchExistentUserException catch (e) {
      // The camera is in use
      debugPrint(" --------The camera is in use ------ ");
      print(e);
    } on EnableTorchNotAvailableException catch (e) {
      debugPrint("Torch is not available");
      print(e);
    } on EnableTorchException catch (e) {
      debugPrint("Something went wrong");
      print(e);
    }
  }

// Torch light is off
  Future<void> torchOff() async {
    try {
      await TorchLight.disableTorch();
    } on DisableTorchExistentUserException catch (e) {
      // The camera is in use
      debugPrint(" --------The camera is in use ------ ");
      debugPrint(e.toString());
    } on DisableTorchNotAvailableException catch (e) {
      debugPrint("Torch is not available");
      print(e);
    } on DisableTorchException catch (e) {
      debugPrint("Something went wrong");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff025464),
        elevation: 0.0,
        foregroundColor: Colors.white,
        title: const Text("Flash Light"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffE8AA42),
              Color(0xffE57C23),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: LiteRollingSwitch(
            width: 150,
            //initial value
            value: false,
            textOn: 'Torch On',
            textOff: 'Torch Off',
            colorOn: Colors.green,
            colorOff: Colors.red,
            iconOn: CupertinoIcons.lightbulb_fill,
            iconOff: CupertinoIcons.lightbulb_slash,
            textSize: 16.0,
            onChanged: (bool state) {
              // print(state);
              if (state) {
                torchOff();
              } else {
                torchOn();
              }
            },
            onDoubleTap: () {},
            onSwipe: () {},
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
