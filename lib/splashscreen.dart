import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tala/fullpageposter.dart';
import 'package:tala/home.dart';
import 'package:tala/utilities/constants.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [
      Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/p1.jpg"),
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
                    stops: [0.1, 0.7, 0.9],
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black54,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text("khkhkj",
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontFamily: 'Ubuntu',
                      //         fontSize: 36,
                      //         fontWeight: FontWeight.bold)),
                      // SizedBox(height: 10),

                      Container(
                        alignment: Alignment.center,
                        height: 130.0,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            "Bienvenu sur semeron , Profitez exhorter tous les jours,aussi longtemps qu’on peut dire:Aujourd’hui",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: 19,
                                fontFamily: 'Ubuntu')),
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                )),
          ],
        ),
      ),
      Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/p2.jpg"),
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
                    stops: [0.1, 0.7, 0.9],
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black54,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text("khkhkj",
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontFamily: 'Ubuntu',
                      //         fontSize: 36,
                      //         fontWeight: FontWeight.bold)),
                      // SizedBox(height: 10),

                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 130.0,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            "Profitez des exhortations de nos differents contributeurs et hommes de Dieu du haut katanga et dans le monde entier",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: 19,
                                fontFamily: 'Ubuntu')),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                )),
          ],
        ),
      ),
      Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/p3.jpg"),
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
                    stops: [0.1, 0.7, 0.9],
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black54,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text("khkhkj",
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontFamily: 'Ubuntu',
                      //         fontSize: 36,
                      //         fontWeight: FontWeight.bold)),
                      // SizedBox(height: 10),

                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 130.0,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            "Partager la bonne nouvelle avec vos proches familles et amies en un simple clique , exhortez les nations a votre tour",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: 19,
                                fontFamily: 'Ubuntu')),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                )),
          ],
        ),
      ),
      Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/p4.jpg"),
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
                    stops: [0.1, 0.7, 0.9],
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black54,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text("khkhkj",
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontFamily: 'Ubuntu',
                      //         fontSize: 36,
                      //         fontWeight: FontWeight.bold)),
                      // SizedBox(height: 10),

                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 130.0,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            "Profitez des message pour mediter chaques jours la parole comme il a ete conseiller a josue par le seigneur",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: 19,
                                fontFamily: 'Ubuntu')),
                      ),
                      SizedBox(height: 10),

                      SizedBox(height: 10),
                    ],
                  ),
                )),
          ],
        ),
      ),
      Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/p5.jpg"),
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
                    stops: [0.1, 0.7, 0.9],
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black54,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text("khkhkj",
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontFamily: 'Ubuntu',
                      //         fontSize: 36,
                      //         fontWeight: FontWeight.bold)),
                      // SizedBox(height: 10),

                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 130.0,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            "Ecoutez des messages et exhortations partout ou vous etes et quand vous le voulez",
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: 19,
                                fontFamily: 'Ubuntu')),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                )),
          ],
        ),
      )
    ];

    return Container(
        child: Stack(
      children: <Widget>[
        LiquidSwipe(
          pages: data,
          enableLoop: false,
          onPageChangeCallback: pageChangeCallback,
          waveType: WaveType.liquidReveal,
          liquidController: liquidController,
          ignoreUserGestureWhileAnimating: true,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(data.length, _buildDot),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 0),
            child: FlatButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeP(),
                    ),
                    (route) => false);
              },
              child: Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.blue)),
              color: Colors.white.withOpacity(0.01),
            ),
          ),
        ),
      ],
    ));
  }

  pageChangeCallback(int lpage) {
    if (page == 4) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeP(),
          ),
          (route) => false);
    }
    setState(() {
      page = lpage;
    });
  }
}
