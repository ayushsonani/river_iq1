import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimationFirstApp(),
  ));
}

class AnimationFirstApp extends StatefulWidget {
  const AnimationFirstApp({super.key});

  @override
  State<AnimationFirstApp> createState() => _AnimationFirstAppState();
}

class _AnimationFirstAppState extends State<AnimationFirstApp> {
  List images = [
    "https://cdn.pixabay.com/photo/2023/06/22/05/35/nature-8080591_640.jpg",
    "https://cdn.pixabay.com/photo/2023/06/22/05/35/nature-8080591_640.jpg",
    "https://cdn.pixabay.com/photo/2023/06/22/05/35/nature-8080591_640.jpg",
    "https://cdn.pixabay.com/photo/2023/06/22/05/35/nature-8080591_640.jpg",
    "https://cdn.pixabay.com/photo/2023/06/22/05/35/nature-8080591_640.jpg",
    "https://cdn.pixabay.com/photo/2023/06/22/05/35/nature-8080591_640.jpg",
    "https://cdn.pixabay.com/photo/2023/06/22/05/35/nature-8080591_640.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 10,crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,PageTransition(duration: Duration(seconds: 5),type: PageTransitionType.rotate, alignment: Alignment.bottomLeft, child: ImagePage(index,images)));
              },
              child: Container(
                decoration: BoxDecoration(
                    image:
                    DecorationImage(image: NetworkImage("${images[index]}"))),
              ),
            );
          },
        ),
      ),
    );
  }
}
class ImagePage extends StatelessWidget {
  int inx;
  List immages=[];
  ImagePage(this.inx,this.immages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // color: Colors.deepOrange,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${immages[inx]}"))),
      ),
    );
  }
}
