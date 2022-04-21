import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tala/extrait.dart';
import 'package:tala/utilities/constants.dart';
import 'package:tala/utilities/provides.dart';

class Fullpagefilm extends StatefulWidget {
  final String title;
  final String description;
  final String imgurl;
  final String type;
  final String duration;
  final String urlvideotrailer;
  final int episodenumber;
  final dynamic data;

  Fullpagefilm(
      {Key key,
      this.title,
      this.description,
      this.imgurl,
      this.type,
      this.duration,
      this.data,
      this.urlvideotrailer,
      this.episodenumber})
      : super(key: key);

  @override
  _FullpagefilmState createState() => _FullpagefilmState();
}

class _FullpagefilmState extends State<Fullpagefilm> {
  bool videocalaunch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imgurl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black54,
                    Colors.black87,
                    Colors.black,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'quicksand',
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkcolor),
                          child: Text(widget.type,
                              style: TextStyle(
                                  color: whitecolor,
                                  fontSize: 19,
                                  fontFamily: 'quicksand')),
                        ),
                        Text(widget.duration,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'quicksand',
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 130.0,
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.all(5.0),
                      child: Text(widget.description,
                          style: TextStyle(
                              color: whitecolor,
                              fontSize: 19,
                              fontFamily: 'quicksand')),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: redcolor),
                          child: FlatButton(
                              textColor: whitecolor,
                              // color: redcolor,

                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection("logs")
                                    .add({"id": widget.title, "time": ""});
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Regarder",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.play_arrow),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                            textColor: whitecolor,
                            // color: redcolor,

                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Extrait(
                                        title: widget.title,
                                        url: widget.urlvideotrailer,
                                        visible: true,
                                      )));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Extrait",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.personal_video),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(height: 10),
                    InkWell(
                        onTap: () {
                          displayBottomSheet(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.3,
                              bottom: 5.0,
                              top: 25.0),
                          padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: whitecolor),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text("Derniers regarder",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: darkcolor,
                            fontFamily: 'quicksand',
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      height: 250,
                      child: FutureBuilder<Object>(
                          future: Datas().gethistory(),
                          builder: (context, snapshot) {
                            var res = snapshot.data;
                            print("something***************************");
                            print(res);
                            List<Widget> list = List();

                            for (var i in res) {
                              list.add(Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Stack(children: <Widget>[
                                  Container(
                                    height: 200,
                                    alignment: Alignment.bottomLeft,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      image: DecorationImage(
                                        image: NetworkImage(i['imgurl']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    width: MediaQuery.of(ctx).size.width * 0.8,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        stops: [0.1, 0.5, 0.7, 0.9],
                                        colors: [
                                          Colors.black.withOpacity(0),
                                          Colors.black54,
                                          Colors.black87,
                                          Colors.black,
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // Text(i['titre'],
                                        //     textAlign: TextAlign.left,
                                        //     style: TextStyle(
                                        //         color: whitecolor,
                                        //         fontFamily: 'quicksand',
                                        //         fontSize: 36,
                                        //         fontWeight: FontWeight.bold)),
                                        Text(i['title'],
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: whitecolor,
                                                fontFamily: 'quicksand',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ]),
                              ));
                            }
                            return list.length != 0
                                ? PageView(
                                    controller:
                                        PageController(viewportFraction: 0.8),
                                    scrollDirection: Axis.horizontal,
                                    pageSnapping: true,
                                    onPageChanged: (int index) {},
                                    children: list,
                                  )
                                : Center(
                                    child: Text("Vous n'avez aucu historique"),
                                  );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
