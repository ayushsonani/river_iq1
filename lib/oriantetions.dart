import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: oriantetionPage(),
  ));
}

class oriantetionPage extends StatefulWidget {
  const oriantetionPage({super.key});

  @override
  State<oriantetionPage> createState() => _oriantetionPageState();
}

class _oriantetionPageState extends State<oriantetionPage> {
  bool temp = false;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          temp = true;
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        }
        if (orientation == Orientation.landscape) {
          temp = false;
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
            SystemUiOverlay.bottom
          ]);
        }
        return WillPopScope(
          onWillPop: () async{ 
            showDialog(context: context, builder: (context) {
              return AlertDialog(title: Text("hello"),actions: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.exit_to_app))
              ],);
            },);
            return true;
          },
          child: Scaffold(
            appBar: temp?AppBar():null,
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 20),
             itemCount: 15, itemBuilder: (context, index) {
                return Container(
                  color: Colors.black,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
