import 'package:flutter/material.dart';
import 'package:movie_theater/flip/flip_animation.dart';
import 'package:movie_theater/flip_card.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title, this.image}) : super(key: key);

  final String title;
  final String image;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _tripTiles = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _addTrips(context);
      });
    });
  }

  void _addTrips(BuildContext context) {
    List test = [
      top(context),
      body(context),
    ];

    Future ft = Future(() {});
    test.forEach((widget) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 300), () {
          _tripTiles.add(widget);
          _listKey.currentState.insertItem(_tripTiles.length - 1);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF382e63),
        child: AnimatedList(
            key: _listKey,
            initialItemCount: _tripTiles.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: animation.drive(_offset),
                child: _tripTiles[index],
              );
            }),
      ),
    );
  }

  Column body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //navbar and rate
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 16, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "ACTION | ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "ADVENTURE | ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "FANTASY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "Imb 7.1",
                  style: TextStyle(
                      color: Color(0xFFffc919),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //area button
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xFF42396e),
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 48,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Vientiane, Laos",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 320,
          child: ListView(
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .85,
                padding: EdgeInsets.all(4),
                color: Color(0xFF42396e),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Tomorrow",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "25 Mar",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {
                                    //animation out

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => FlipAnimation(
                                                  image: widget.image,
                                                )));
                                  },
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .85,
                padding: EdgeInsets.all(4),
                color: Color(0xFF42396e),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Tomorrow",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "25 Mar",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .85,
                padding: EdgeInsets.all(4),
                color: Color(0xFF42396e),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Tomorrow",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "25 Mar",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: OutlineButton(
                                  padding: EdgeInsets.all(8),
                                  onPressed: () {},
                                  borderSide: BorderSide(color: Colors.white24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "10:00am",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "IMAX",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFffc919),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Align top(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 300,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: "movie",
              child: Image.asset(
                widget.image,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                // color: Color(0xFF42396e),
              ),
            ),
            Positioned(
              left: 24,
              bottom: 20,
              child: Text(
                "KONG: SKULL ISLAND",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 32,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  print("object");
                  Navigator.of(context).pop();
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.play_circle_outline,
                  size: 50,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
