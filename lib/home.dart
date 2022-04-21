import 'dart:math';

import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:tala/bookdetails.dart';
import 'package:tala/detailsexhortations.dart';
import 'package:tala/stories.dart';
import 'package:tala/utilities/books.dart';
import 'package:intl/intl.dart';
import 'package:tala/utilities/exhortations.dart';
import 'package:tala/utilities/storiemessages.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key key}) : super(key: key);

  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  int _index = 0;
  final _random = new Random();
  var now = new DateTime.now();
  DateFormat formatter = new DateFormat('yyyy-MM-dd');
  String formattedDate = "";
  //

  List<String> images = [
    "assets/images/forest.gif",
    "assets/images/autumn.gif",
    "assets/images/night.gif",
    "assets/images/forest1.gif",
    "assets/images/afternoon.gif",
    "assets/images/sunrise.gif"
  ];

  List<Books> books = [
    Books(
        cover:
            "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1546016710-best-christian-movies-knowing-god-1546016696.jpg?crop=1xw:1xh;center,top&resize=480:*",
        name: "test book",
        url:
            "https://www.koina.org/page-6/page111/files/Pourquoi_sur_terre_AL.pdf",
        date: "10/15",
        publisher: "Benny Hyn",
        description:
            "Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.",
        categories: "Spirituality"),
    Books(
        cover:
            "https://images-na.ssl-images-amazon.com/images/I/51BMXvmt8WL._SX330_BO1,204,203,200_.jpg",
        name: "test book",
        url:
            "https://www.koina.org/page-6/page111/files/Pourquoi_sur_terre_AL.pdf",
        date: "10/15",
        publisher: "Atoms Mbumba",
        description:
            "Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.",
        categories: "Spirituality"),
    Books(
        cover:
            "https://www.biblesociety.org.uk/uploads/content/shop/covers/9780564047871_End-of-the-Road.jpg",
        name: "test book",
        url:
            "https://www.koina.org/page-6/page111/files/Pourquoi_sur_terre_AL.pdf",
        date: "10/15",
        publisher: "Marcelo Tunasi",
        description:
            "Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.",
        categories: "Music"),
  ];

  List<StoriesM> stories = [
    StoriesM(
        url: "https://youtu.be/O42jLTJkZDw",
        publisher: "assets/images/atoms.jpg",
        datetime: "15-01-2015"),
    StoriesM(
        url: "https://youtu.be/O42jLTJkZDw",
        publisher: "assets/images/marcelo.jpg",
        datetime: "15-01-2015"),
    StoriesM(
        url: "https://youtu.be/O42jLTJkZDw",
        publisher: "assets/images/p2.jpg",
        datetime: "15-01-2015"),
  ];

  List<Exhortations> exhortations = [
    Exhortations(
        datetime: "15-12-2015",
        publisher: "Atoms Mbumba",
        audioreader:
            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        image:
            "https://drive.google.com/uc?export=view&id=1vG-MlydHFZk4ZTlaZ85B5QGCtPrd_U4Y",
        description:
            "Mixing and matching audio pluginsThe flutter plugin ecosystem contains a wide variety of useful audio plugins. In order to allow these to work together in a single app, just_audio \"just\" plays audio. By focusing on a single responsibility, different audio plugins can safely work together without overlapping responsibilities causing runtime conflicts.Other common audio capabilities are optionally provided by separate plugins:    audio_service: Use this to allow your app to play audio in the background and respond to controls on the lockscreen, media notification, headset, AndroidAuto/CarPlay or smart watch.audio_session: Use this to configure and manage how your app interacts with other audio apps (e.g. phone call or navigator interruptions)."),
    Exhortations(
        datetime: "15-12-2015",
        publisher: "Atoms Mbumba",
        audioreader:
            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        image:
            "https://drive.google.com/uc?export=view&id=1vG-MlydHFZk4ZTlaZ85B5QGCtPrd_U4Y",
        description:
            "Mixing and matching audio pluginsThe flutter plugin ecosystem contains a wide variety of useful audio plugins. In order to allow these to work together in a single app, just_audio \"just\" plays audio. By focusing on a single responsibility, different audio plugins can safely work together without overlapping responsibilities causing runtime conflicts.Other common audio capabilities are optionally provided by separate plugins:    audio_service: Use this to allow your app to play audio in the background and respond to controls on the lockscreen, media notification, headset, AndroidAuto/CarPlay or smart watch.audio_session: Use this to configure and manage how your app interacts with other audio apps (e.g. phone call or navigator interruptions)."),
    Exhortations(
        datetime: "15-12-2015",
        publisher: "Atoms Mbumba",
        audioreader:
            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        image:
            "https://drive.google.com/uc?export=view&id=1vG-MlydHFZk4ZTlaZ85B5QGCtPrd_U4Y",
        description:
            "Mixing and matching audio pluginsThe flutter plugin ecosystem contains a wide variety of useful audio plugins. In order to allow these to work together in a single app, just_audio \"just\" plays audio. By focusing on a single responsibility, different audio plugins can safely work together without overlapping responsibilities causing runtime conflicts.Other common audio capabilities are optionally provided by separate plugins:    audio_service: Use this to allow your app to play audio in the background and respond to controls on the lockscreen, media notification, headset, AndroidAuto/CarPlay or smart watch.audio_session: Use this to configure and manage how your app interacts with other audio apps (e.g. phone call or navigator interruptions)."),
    Exhortations(
        datetime: "15-12-2015",
        publisher: "Atoms Mbumba",
        audioreader:
            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        image:
            "https://drive.google.com/uc?export=view&id=1vG-MlydHFZk4ZTlaZ85B5QGCtPrd_U4Y",
        description:
            "Mixing and matching audio pluginsThe flutter plugin ecosystem contains a wide variety of useful audio plugins. In order to allow these to work together in a single app, just_audio \"just\" plays audio. By focusing on a single responsibility, different audio plugins can safely work together without overlapping responsibilities causing runtime conflicts.Other common audio capabilities are optionally provided by separate plugins:    audio_service: Use this to allow your app to play audio in the background and respond to controls on the lockscreen, media notification, headset, AndroidAuto/CarPlay or smart watch.audio_session: Use this to configure and manage how your app interacts with other audio apps (e.g. phone call or navigator interruptions)."),
    Exhortations(
        datetime: "15-12-2015",
        publisher: "Atoms Mbumba",
        audioreader:
            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        image:
            "https://drive.google.com/uc?export=view&id=1vG-MlydHFZk4ZTlaZ85B5QGCtPrd_U4Y",
        description:
            "Mixing and matching audio pluginsThe flutter plugin ecosystem contains a wide variety of useful audio plugins. In order to allow these to work together in a single app, just_audio \"just\" plays audio. By focusing on a single responsibility, different audio plugins can safely work together without overlapping responsibilities causing runtime conflicts.Other common audio capabilities are optionally provided by separate plugins:    audio_service: Use this to allow your app to play audio in the background and respond to controls on the lockscreen, media notification, headset, AndroidAuto/CarPlay or smart watch.audio_session: Use this to configure and manage how your app interacts with other audio apps (e.g. phone call or navigator interruptions)."),
    Exhortations(
        datetime: "15-12-2015",
        publisher: "Atoms Mbumba",
        audioreader:
            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        image:
            "https://drive.google.com/uc?export=view&id=1vG-MlydHFZk4ZTlaZ85B5QGCtPrd_U4Y",
        description:
            "Mixing and matching audio pluginsThe flutter plugin ecosystem contains a wide variety of useful audio plugins. In order to allow these to work together in a single app, just_audio \"just\" plays audio. By focusing on a single responsibility, different audio plugins can safely work together without overlapping responsibilities causing runtime conflicts.Other common audio capabilities are optionally provided by separate plugins:    audio_service: Use this to allow your app to play audio in the background and respond to controls on the lockscreen, media notification, headset, AndroidAuto/CarPlay or smart watch.audio_session: Use this to configure and manage how your app interacts with other audio apps (e.g. phone call or navigator interruptions)."),
  ];

  int val = 0;
  PageController pagecontroller =
      PageController(initialPage: 0, viewportFraction: 1 / 4);

  int active;

  int _currentIndex = 0;
  List<SliverChildDelegate> _children = [];
  List<String> titles = ["Home", "Exhortations", "Livres"];

  int next(int min, int max) => min + _random.nextInt(max - min);
  double storypadding = 10;

  @override
  void initState() {
    // TODO: implement initState
    val = next(0, images.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    formattedDate = formatter.format(now);
    _children = [
      SliverChildListDelegate([
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Stories",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu'),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // margin: EdgeInsets.only(left: 20),
          child: PageView.builder(
              controller:
                  PageController(initialPage: 1, viewportFraction: 1 / 2),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: exhortations.length,
              pageSnapping: true,
              onPageChanged: (int index) {
                setState(() {
                  active = index;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeOutQuint,
                  margin: EdgeInsets.only(
                      top: index == active ? 0 : 20,
                      bottom: index == active ? 20 : 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              Stories(stories: exhortations[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width * 0.35,
                          width: MediaQuery.of(context).size.width * 0.35,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            boxShadow: index == active
                                ? [
                                    BoxShadow(
                                      color: Colors.black87,
                                      blurRadius: 5,
                                    )
                                  ]
                                : null,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              image: NetworkImage(exhortations[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.35,
                          width: MediaQuery.of(context).size.width * 0.35,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.1, 0.6, 0.7, 0.9],
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black45,
                                Colors.black54,
                                Colors.black87,
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              }),
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Exhortation du jour",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu'),
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height * 0.3 / 2,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      alignment: Alignment.topCenter,
                      child: Text("Par: \n " + exhortations[0].publisher,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Ubuntu',
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                ExhortationsDetails(exho: exhortations[0])));
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueAccent),
                          child: Row(
                            children: [
                              Icon(Icons.headphones, color: Colors.white),
                              Expanded(
                                child: Text("Ecouter",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          )),
                      color: Colors.white.withOpacity(0.01),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Hero(
                tag: 'exho-cover',
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(exhortations[0].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Derniers livres",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu'),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView.builder(
              controller:
                  PageController(initialPage: 0, viewportFraction: 1 / 2),
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              pageSnapping: true,
              onPageChanged: (int index) {},
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BookDetails(book: books[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(children: <Widget>[
                      Container(
                        height: 200,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: NetworkImage(books[index].cover),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.1, 0.6, 0.7, 0.9],
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black45,
                              Colors.black54,
                              Colors.black87,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Color(0xFFFF921F)),
                                    child: Text(books[index].categories,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'montserrat',
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)))
                              ],
                            )

                            // Text(ls['duration'],
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(
                            //         color: whitecolor,
                            //         fontFamily:
                            //             'quicksand',
                            //         fontSize: 12,
                            //         fontWeight:
                            //             FontWeight.bold))
                          ],
                        ),
                      ),
                    ]),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 60,
        )
      ]),
      SliverChildListDelegate(exhortations
          .map((item) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    height: MediaQuery.of(context).size.height * 0.3 / 2,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            alignment: Alignment.topCenter,
                            child: Text("Par: \n " + item.publisher,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Ubuntu',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      ExhortationsDetails(exho: item)));
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blueAccent),
                                child: Row(
                                  children: [
                                    Icon(Icons.headphones, color: Colors.white),
                                    Expanded(
                                      child: Text("Ecouter",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                )),
                            color: Colors.white.withOpacity(0.01),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      tag: 'exho-cover',
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.height * 0.3,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(item.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ))
          .toList()),
      SliverChildListDelegate(books
          .map((item) => Container(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BookDetails(book: item)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(item.cover),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [0.1, 0.6, 0.7, 0.9],
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black45,
                            Colors.black54,
                            Colors.black87,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Color(0xFFFF921F)),
                                  child: Text(item.categories,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'montserrat',
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)))
                            ],
                          )

                          // Text(ls['duration'],
                          //     textAlign: TextAlign.left,
                          //     style: TextStyle(
                          //         color: whitecolor,
                          //         fontFamily:
                          //             'quicksand',
                          //         fontSize: 12,
                          //         fontWeight:
                          //             FontWeight.bold))
                        ],
                      ),
                    ),
                  ]),
                ),
              )))
          .toList()),
    ];

    return Scaffold(
      extendBody: true,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              //pinned: true,

              floating: false,
              actions: <Widget>[
                // IconButton(
                //   padding: EdgeInsets.all(0.0),
                //   color: Colors.white,
                //   icon: Icon(Icons.arrow_back),
                //   onPressed: () => Navigator.of(context).pop(),
                // )
              ],
              expandedHeight: MediaQuery.of(context).size.height * 0.4,

              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(images[val]),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0, left: 30),
                    child: Text("Bonjour",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white)),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 200,
                      // margin: EdgeInsets.only(top: 50),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Image.asset(
                                "assets/images/quotes.png",
                                // height: 50,
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 0.0, left: 10, right: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                          child: Text(
                                        "Au commencement, Dieu créa le ciel et la terre. 2Or, la terre était chaotique et vide. Les ténèbres couvraient l’abîme, et l’Esprit de Dieu planait au-dessus des eaux.",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )),
                                      Text(
                                        "Romain 10:15, Le semeur",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ]),
                              ),
                            ),
                          ]),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // boxShadow: [
                        //   new BoxShadow(
                        //     color: Colors.grey.withOpacity(0.2),
                        //     offset: Offset(0, 1),
                        //   ),
                        // ],
                      ),
                    ),
                  ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.6,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomCenter,
                  //       stops: [0.1, 0.7, 0.9],
                  //       colors: [
                  //         Colors.black.withOpacity(0),
                  //         Colors.black45,
                  //         Colors.black54,
                  //       ],
                  //     ),
                  //   ),
                  // )
                ]),
              ),
            ),
            SliverList(
                // itemExtent: 150,

                delegate: _children[_currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavbar(
        borderRadius: 20,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black45,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        }, // new
        currentIndex: _currentIndex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: ''),
          FloatingNavbarItem(icon: Icons.book_rounded, title: ''),
          FloatingNavbarItem(icon: Icons.menu_book, title: ''),
        ],
      ),
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  const CustomScrollPhysics({this.itemDimension, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position, double portion) {
    // <--
    return (position.pixels + portion) / itemDimension;
    // -->
  }

  double _getPixels(double page, double portion) {
    // <--
    return (page * itemDimension) - portion;
    // -->
  }

  double _getTargetPixels(
    ScrollMetrics position,
    Tolerance tolerance,
    double velocity,
    double portion,
  ) {
    // <--
    double page = _getPage(position, portion);
    // -->
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    // <--
    return _getPixels(page.roundToDouble(), portion);
    // -->
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final Tolerance tolerance = this.tolerance;
    // <--
    final portion = (position.extentInside - itemDimension) / 2;
    final double target =
        _getTargetPixels(position, tolerance, velocity, portion);
    // -->
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
