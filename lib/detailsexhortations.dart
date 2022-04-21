import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tala/utilities/exhortations.dart';
import 'package:social_share/social_share.dart';
import 'package:floatingpanel/floatingpanel.dart';

class ExhortationsDetails extends StatefulWidget {
  final Exhortations exho;

  const ExhortationsDetails({Key key, this.exho}) : super(key: key);

  @override
  _ExhortationsDetailsState createState() => _ExhortationsDetailsState();
}

class _ExhortationsDetailsState extends State<ExhortationsDetails> {
  final player = AudioPlayer();
  var duration;

  bool isplaying = false;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    loadAudio();
  }

  loadAudio() async {
    await player.setUrl(widget.exho.audioreader);
    await player.setVolume(1);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Material(
        child: Stack(children: <Widget>[
      CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          //pinned: true,

          floating: false,
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0.0),
              color: Colors.white,
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
          expandedHeight: MediaQuery.of(context).size.height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(children: <Widget>[
              Hero(
                tag: 'exho-cover',
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.exho.image),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                      child: Icon(Icons.share),
                      backgroundColor: Colors.orange,
                      onPressed: () {
                        downloadFile(
                                widget.exho.image,
                                "exho_semeron.jpeg" + widget.exho.datetime,
                                "assets")
                            .then((value) => {
                                  print(value),
                                  SocialShare.shareOptions(
                                      "Exhortation d'aujourdhui sur semeron \n " +
                                          widget.exho.description +
                                          "\n images" +
                                          widget.exho.image)
                                })
                            .onError((error, stackTrace) =>
                                {print(error.toString())});
                      }))
            ]),
          ),
        ),
        SliverList(
            // itemExtent: 150,
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/atoms.jpg"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Par",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          widget.exho.publisher,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
            child: Text(
              widget.exho.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: Text(
              "Ecoutez le message d'exhortation",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: FloatingActionButton(
                onPressed: () {
                  Duration position = player.position;
                  if (isplaying) {
                    player.setUrl(widget.exho.audioreader,
                        initialPosition: position + Duration(seconds: 10));
                  }
                },
                child: Icon(Icons.replay_10),
                backgroundColor: Colors.blueAccent,
              )),
              Expanded(
                  child: FloatingActionButton(
                onPressed: () {
                  if (isplaying) {
                    player.pause();
                    setState(() {
                      isplaying = false;
                    });
                  } else {
                    setState(() {
                      isplaying = true;
                    });
                    player.play();
                  }
                },
                child: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                backgroundColor: Colors.blueAccent,
              )),
              Expanded(
                  child: FloatingActionButton(
                onPressed: () {
                  Duration position = player.position;
                  if (isplaying) {
                    player.setUrl(widget.exho.audioreader,
                        initialPosition: position + Duration(seconds: 10));
                  }
                },
                child: Icon(Icons.forward_10),
                backgroundColor: Colors.blueAccent,
              ))
            ],
          ),
          SizedBox(
            height: 50,
          )
        ]))
      ])
    ]));
  }
}

Future<String> downloadFile(String url, String fileName, String dir) async {
  HttpClient httpClient = new HttpClient();
  File file;
  String filePath = '';
  String myUrl = '';

  try {
    myUrl = url;
    var request = await httpClient.getUrl(Uri.parse(myUrl));
    var response = await request.close();
    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      filePath = '$dir/$fileName';
      file = File(filePath);
      await file.writeAsBytes(bytes);
    } else
      filePath = 'Error code: ' + response.statusCode.toString();
  } catch (ex) {
    filePath = 'Can not fetch url';
  }

  return filePath;
}
