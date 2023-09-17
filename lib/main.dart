import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirsPage(),
  ));
}

class FirsPage extends StatefulWidget {
  const FirsPage({super.key});

  @override
  State<FirsPage> createState() => _FirsPageState();
}

class _FirsPageState extends State<FirsPage> {
  bool temp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PageTransitionSwitcher(
              child: temp ? FirstCon() : SecondCon(),
              duration: Duration(seconds: 1),
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return SharedAxisTransition(
                    child: child,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.scaled);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  temp = !temp;
                  setState(() {});
                },
                child: Text("Page Transition switcher")),
            Slidable(
                closeOnScroll: false,
                child: ListTile(
                  title: Text("Slidoble"),
                ),

                startActionPane: ActionPane(motion: DrawerMotion(), children: [
                  SlidableAction(
                    autoClose: true,
                    backgroundColor: Colors.black,
                    onPressed: (context) {

                    },
                    icon: Icons.add,
                    foregroundColor: Colors.red,
                  )
                ]))
          ],
        ),
      ),
    );
  }
}

class FirstCon extends StatelessWidget {
  const FirstCon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.indigo,
    );
  }
}

class SecondCon extends StatelessWidget {
  const SecondCon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }
}
