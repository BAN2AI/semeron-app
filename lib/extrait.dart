import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tala/utilities/constants.dart';
import 'package:video_player/video_player.dart';

class Extrait extends StatefulWidget {
  final String url, title;
  final bool visible;
  Extrait({Key key, this.url, this.title, this.visible}) : super(key: key);

  @override
  _ExtraitState createState() => _ExtraitState();
}

class _ExtraitState extends State<Extrait> {
  VideoPlayerController controller;

  double volume = 100.0;
  String get title => widget.title ?? '';
  bool get visible => widget.visible ?? false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url);
    controller.addListener(() {});
    controller.setLooping(true);
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {
          controller.play();
          controller.setVolume(volume);
        }));
    Timer(Duration(milliseconds: 500), init);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void init() {
    if (mounted)
      controller.addListener(() {
        setState(() {});
      });
  }

  void replay(double min, double current) {
    double anchor = current - 10000;
    controller
        .seekTo(Duration(milliseconds: (anchor < min ? min : anchor).round()));
  }

  void forward(double max, double current) {
    double anchor = current + 10000;
    controller
        .seekTo(Duration(milliseconds: (anchor > max ? max : anchor).round()));
  }

  void playcontinue() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    DragStartDetails startVerticalDragDetails;
    DragUpdateDetails updateVerticalDragDetails;

    Duration duration = controller != null &&
            controller.value != null &&
            controller.value.duration != null
        ? controller.value.duration
        : null;
    Duration position = controller != null && controller.value != null
        ? controller.value.position
        : null;
    int timeDuration = duration != null && position != null
        ? duration.inMilliseconds - position.inMilliseconds
        : 0;
    Duration timeline = duration != null && position != null
        ? Duration(milliseconds: (timeDuration < 0 ? 0 : timeDuration))
        : null;
    String durationText =
        timeline != null ? timeline.toString().split('.').first : '';
    final Size screenSize = MediaQuery.of(context).size;
    double currentValue = position != null
        ? controller.value.position.inMilliseconds?.toDouble() ?? 0.0
        : 0.0;
    final double minValue = 0.0;
    double maxValue = duration != null
        ? controller.value.duration.inMilliseconds?.toDouble()
        : 0.0;
    return Material(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: screenSize.height,
        width: screenSize.width,
        color: Colors.black,
        padding:
            EdgeInsets.only(bottom: 20.0, left: 0.0, right: 0.0, top: 10.0),
        child: Opacity(
          opacity: visible ? 1 : 0,
          child: visible
              ? Stack(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onVerticalDragStart: (dragDetails) {
                        startVerticalDragDetails = dragDetails;
                      },
                      onVerticalDragUpdate: (dragDetails) {
                        updateVerticalDragDetails = dragDetails;
                      },
                      onVerticalDragEnd: (endDetails) {
                        double dx =
                            updateVerticalDragDetails.globalPosition.dx -
                                startVerticalDragDetails.globalPosition.dx;
                        double dy =
                            updateVerticalDragDetails.globalPosition.dy -
                                startVerticalDragDetails.globalPosition.dy;
                        double velocity = endDetails.primaryVelocity;

                        //Convert values to be positive
                        if (dx < 0) dx = -dx;
                        if (dy < 0) dy = -dy;

                        if (velocity < 0) {
                          setState(() {
                            if (volume < 100) {
                              volume += 1;
                            }
                          });
                        } else {
                          setState(() {
                            if (volume > 0) {
                              volume += 1;
                            }
                          });
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.15),
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: MediaQuery.of(context).size.width,
                          child: controller.value.initialized
                              ? AspectRatio(
                                  aspectRatio:
                                      controller.value.size.aspectRatio,
                                  child: VideoPlayer(controller),
                                )
                              : Center(
                                  child: SizedBox(
                                  child: CircularProgressIndicator(
                                    backgroundColor: redcolor,
                                  ),
                                  height: 50.0,
                                  width: 50.0,
                                ))),
                    ),
                    Positioned(
                      bottom: 50,
                      child: Container(
                        width: screenSize.width,
                        height: 100.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
                              iconSize: 40.0,
                              icon: Icon(Icons.replay_10),
                              onPressed: () => replay(minValue, currentValue),
                            ),
                            IconButton(
                              color: Colors.white,
                              iconSize: 80.0,
                              icon: Icon(controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              onPressed: playcontinue,
                            ),
                            IconButton(
                              color: Colors.white,
                              iconSize: 40.0,
                              icon: Icon(Icons.forward_10),
                              onPressed: () => forward(maxValue, currentValue),
                            ),
                            IconButton(
                              color: Colors.white,
                              iconSize: 40.0,
                              icon: Icon(Icons.fullscreen),
                              onPressed: () => {
                                showGeneralDialog(
                                  barrierLabel: "Barrier",
                                  barrierDismissible: true,
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  transitionDuration:
                                      Duration(milliseconds: 100),
                                  context: context,
                                  pageBuilder: (context, __, ___) {
                                    return RotatedBox(
                                      quarterTurns: 1,
                                      child: Material(
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          height: screenSize.height,
                                          width: screenSize.width,
                                          color: Colors.black,
                                          padding: EdgeInsets.only(
                                              bottom: 0,
                                              left: 10.0,
                                              right: 10.0,
                                              top: 0),
                                          child: Opacity(
                                            opacity: visible ? 1 : 0,
                                            child: visible
                                                ? Stack(
                                                    // mainAxisSize: MainAxisSize.min,
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onVerticalDragStart:
                                                            (dragDetails) {
                                                          startVerticalDragDetails =
                                                              dragDetails;
                                                        },
                                                        onVerticalDragUpdate:
                                                            (dragDetails) {
                                                          updateVerticalDragDetails =
                                                              dragDetails;
                                                        },
                                                        onVerticalDragEnd:
                                                            (endDetails) {
                                                          double dx = updateVerticalDragDetails
                                                                  .globalPosition
                                                                  .dx -
                                                              startVerticalDragDetails
                                                                  .globalPosition
                                                                  .dx;
                                                          double dy = updateVerticalDragDetails
                                                                  .globalPosition
                                                                  .dy -
                                                              startVerticalDragDetails
                                                                  .globalPosition
                                                                  .dy;
                                                          double velocity =
                                                              endDetails
                                                                  .primaryVelocity;

                                                          //Convert values to be positive
                                                          if (dx < 0) dx = -dx;
                                                          if (dy < 0) dy = -dy;

                                                          if (velocity < 0) {
                                                            setState(() {
                                                              if (volume <
                                                                  100) {
                                                                volume += 1;
                                                              }
                                                            });
                                                          } else {
                                                            setState(() {
                                                              if (volume > 0) {
                                                                volume += 1;
                                                              }
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                            height:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            child: controller
                                                                    .value
                                                                    .initialized
                                                                ? AspectRatio(
                                                                    aspectRatio: controller
                                                                            .value
                                                                            .size
                                                                            .aspectRatio /
                                                                        2,
                                                                    child: VideoPlayer(
                                                                        controller),
                                                                  )
                                                                : Center(
                                                                    child:
                                                                        SizedBox(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      backgroundColor:
                                                                          redcolor,
                                                                    ),
                                                                    height:
                                                                        50.0,
                                                                    width: 50.0,
                                                                  ))),
                                                      ),
                                                      Positioned(
                                                        bottom: 50,
                                                        child: Container(
                                                          width:
                                                              screenSize.height,
                                                          height: 30.0,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: <Widget>[
                                                              IconButton(
                                                                color: Colors
                                                                    .white,
                                                                iconSize: 30.0,
                                                                icon: Icon(Icons
                                                                    .replay_10),
                                                                onPressed: () =>
                                                                    replay(
                                                                        minValue,
                                                                        currentValue),
                                                              ),
                                                              IconButton(
                                                                color: Colors
                                                                    .white,
                                                                iconSize: 40.0,
                                                                icon: Icon(controller
                                                                        .value
                                                                        .isPlaying
                                                                    ? Icons
                                                                        .pause
                                                                    : Icons
                                                                        .play_arrow),
                                                                onPressed:
                                                                    playcontinue,
                                                              ),
                                                              IconButton(
                                                                color: Colors
                                                                    .white,
                                                                iconSize: 30.0,
                                                                icon: Icon(Icons
                                                                    .forward_10),
                                                                onPressed: () =>
                                                                    forward(
                                                                        maxValue,
                                                                        currentValue),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 0,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: <Widget>[
                                                            Container(
                                                              width: screenSize
                                                                      .height -
                                                                  90.0,
                                                              child: Slider(
                                                                activeColor: Color
                                                                    .fromRGBO(
                                                                        219,
                                                                        0,
                                                                        0,
                                                                        1.0),
                                                                inactiveColor:
                                                                    Color.fromRGBO(
                                                                        86,
                                                                        77,
                                                                        77,
                                                                        1.0),
                                                                value: currentValue >
                                                                        maxValue
                                                                    ? maxValue
                                                                    : currentValue,
                                                                onChanged: (double
                                                                        value) =>
                                                                    controller.seekTo(Duration(
                                                                        milliseconds:
                                                                            value.round())),
                                                                min: minValue,
                                                                max: maxValue,
                                                              ),
                                                            ),
                                                            Text(
                                                              durationText,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 10,
                                                        child: Container(
                                                          width:
                                                              screenSize.width,
                                                          height: 30.0,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              IconButton(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                color: Colors
                                                                    .white,
                                                                icon: Icon(Icons
                                                                    .close),
                                                                onPressed: () =>
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(),
                                                              ),
                                                              Container(
                                                                width: screenSize
                                                                        .width -
                                                                    100.0,
                                                                child: Center(
                                                                  child: Text(
                                                                    title,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  transitionBuilder: (_, anim, __, child) {
                                    return SlideTransition(
                                      position: Tween(
                                              begin: Offset(0, 1),
                                              end: Offset(0, 0))
                                          .animate(anim),
                                      child: child,
                                    );
                                  },
                                )
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            width: screenSize.width - 90.0,
                            child: Slider(
                              activeColor: Color.fromRGBO(219, 0, 0, 1.0),
                              inactiveColor: Color.fromRGBO(86, 77, 77, 1.0),
                              value: currentValue > maxValue
                                  ? maxValue
                                  : currentValue,
                              onChanged: (double value) => controller.seekTo(
                                  Duration(milliseconds: value.round())),
                              min: minValue,
                              max: maxValue,
                            ),
                          ),
                          Text(
                            durationText,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        width: screenSize.width,
                        height: 30.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.all(0.0),
                              color: Colors.white,
                              icon: Icon(Icons.arrow_back),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            Container(
                              width: screenSize.width - 100.0,
                              child: Center(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }

  void showDialog() {}
}
