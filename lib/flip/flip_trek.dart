import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:math';

import 'flip_enter.dart';

class FlipTrekking extends StatelessWidget {
  FlipTrekking({
    Key key,
    @required AnimationController controller,
    @required this.image,
  })  : animation = FlipTrekkingEnterAnimation(controller),
        super(key: key);
  final FlipTrekkingEnterAnimation animation;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1F0F4),
      body: AnimatedBuilder(
          animation: animation.controller,
          builder: (context, child) => Container(
                color: Color(0xFF382e63),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    buildScreen(context),
                    buildSeats(),
                    SizedBox(
                      height: 16,
                    ),
                    buildSeats(),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Session 9.30, 24 NOV 2020",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Row 9, Seats 10, 11",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              height: 40,
                              color: Colors.lightBlue.shade50,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Total: \$5",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " or 45000 bonuses",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        // height: double.infinity,
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text(
                            "CHECK OUT",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ))
                  ],
                ),
              )),
    );
  }

  AnimationLimiter buildSeats({Duration duration}) {
    return AnimationLimiter(
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 32),
        crossAxisCount: 10,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(
          50,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              delay: duration,
              duration: const Duration(milliseconds: 375),
              columnCount: 10,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: InkWell(
                    onTap: () {
                      print(index);
                    },
                    child: Container(
                      color: Colors.lightBlue.shade50,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container buildScreen(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Hero(
        tag: "movie",
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX((pi * animation.barHeight.value - 2.1)),
          child: Container(
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width * .7,
              height: 200,
              color: Colors.white38,
              colorBlendMode: BlendMode.overlay,
              fit: BoxFit.cover,
              // color: Color(0xFF42396e),
            ),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    spreadRadius: 20,
                    color: Color(0xFF423988),
                    blurRadius: 100.0,
                    offset: Offset(0.0, 200))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                topBar(animation.barHeight.value),
                circle(
                  size,
                  animation.avatarSize.value,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Opacity(
                  opacity: animation.titleOpacity.value,
                  child: placeholderBox(28, 150, Alignment.centerLeft),
                ),
                SizedBox(height: 6),
                Opacity(
                  opacity: animation.textOpacity.value,
                  child: placeholderBox1(
                      250, double.infinity, Alignment.centerLeft),
                ),
                SizedBox(height: 6),
                Opacity(
                  opacity: animation.imageOpacity.value,
                  child: placeholderBox2(Alignment.center),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      //color: Colors.blue,
      child: Image.asset(
        "images/3.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 100,
      left: size.width / 2 - 50,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          animationValue,
          animationValue,
          1.0,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.shade300,
            image: DecorationImage(image: AssetImage("images/1.jpg")),
          ),
        ),
      ),
    );
  }

  Align placeholderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFD5EBEC),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text("Trekking Mountain Instruction"),
        ),
      ),
    );
  }

  Align placeholderBox1(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 490,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFC7E4E9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  "1. Start walking now (it’s never too early to start training)."),
              SizedBox(
                height: 10,
              ),
              Text("2. Make leg-based cardio part of your routine…"),
              SizedBox(
                height: 10,
              ),
              Text("3. …and take the stairs every chance you get"),
              SizedBox(
                height: 10,
              ),
              Text("4. Make sure you’re walking properly"),
              SizedBox(
                height: 10,
              ),
              Text("5. Mix up your training terrain…"),
              SizedBox(
                height: 10,
              ),
              Text("6. …and walk in all types of weather"),
              SizedBox(
                height: 10,
              ),
              Text("7. Try using walking poles"),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 100,
                  width: width,
                  child: Image.asset(
                    "images/5.jpg",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("8. Train with a backpack"),
              SizedBox(
                height: 10,
              ),
              Text("9. Keep the tank fuelled"),
              SizedBox(
                height: 10,
              ),
              Text("10. Invest in a good pair of shoes"),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 100,
                  width: width,
                  child: Image.asset(
                    "images/6.jpg",
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _buildImage(String imgPath) {
    return Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: Container(
            height: 50.0,
            width: 115.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover))));
  }

  Widget placeholderBox2(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
          height: 70.0,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            _buildImage('images/1.jpg'),
            _buildImage('images/2.jpg'),
            _buildImage('images/3.jpg')
          ])),
    );
  }
}
