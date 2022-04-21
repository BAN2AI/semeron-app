import 'package:flutter/material.dart';

import 'package:tala/utilities/constants.dart';
import 'package:video_player/video_player.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.asset("assets/images/starter.mp4");
    _controller.addListener(() {});
    _controller.setLooping(true);
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {
          _controller.play();
          // _controller.setVolume(0);
        }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _onBackPressed() {
    _controller.pause();
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.6, 0.9],
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black87,
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Tala, vos films et series preferer partout",
                          style: TextStyle(
                              color: whitecolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              fontFamily: 'quicksand')),
                      SizedBox(height: 10),
                      Text(
                          "Regardez vos films et series nolliwood, bollywood ou novelas preferer partout et quand vous les voulez.Tous cela avec un minimum de connexion internet ",
                          style: TextStyle(
                              color: whitecolor,
                              fontSize: 19,
                              fontFamily: 'quicksand')),
                      SizedBox(height: 10),
                      Container(
                        width: 200,
                        padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: redcolor),
                        child: FlatButton(
                            textColor: whitecolor,
                            // color: redcolor,

                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Se connecter",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            )),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
