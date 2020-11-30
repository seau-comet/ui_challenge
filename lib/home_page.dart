import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_theater/detail_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double padding = 20;
  int duration = 1000;
  AnimationController controller;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));
    controller.forward();
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: duration),
                opacity: controller.value,
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: controller.value,
        ),
        extendBodyBehindAppBar: true,
        extendBody: false,
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            buildSliverGrid(),
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    "Coming Soon",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            buildSliverGrid(),
          ],
        ),
      ),
    );
  }

  SliverGrid buildSliverGrid() {
    return SliverGrid.count(
      crossAxisCount: 2,
      children: List.generate(
          6,
          (index) => InkWell(
                onTap: () {
                  print(index);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                image: "images/${index + 1}.jpg",
                              )));
                },
                child: Transform(
                  transform: Matrix4.diagonal3Values(
                      1 + (controller.value * 0.1),
                      1 + (controller.value * 0.1),
                      1),
                  transformHitTests: true,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/${index + 1}.jpg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    color: Colors.black,
                    colorBlendMode: BlendMode.difference,
                  ),
                ),
              )),
    );
  }
}
