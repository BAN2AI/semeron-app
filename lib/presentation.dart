import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardResume extends StatelessWidget {
  final String name, address, tags, image;
  final dynamic cmd;
  int command = 0;
  CardResume(this.name, this.address, this.tags, this.image, this.cmd);
  Map<String, String> currentuser;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      margin: const EdgeInsets.only(top: 10.0, left: 10),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 30,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 150,
              decoration: new BoxDecoration(
                color: Color(0xfffcfcfc),
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0f000000),
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.25),
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Color(0xff454f63),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset("assets/images/course.png", width: 30),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "20 Av. des unsines Q/baudoin",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                "Lubumbashi",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        address,
                        style: TextStyle(
                          color: Color(0xff818897),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "25" + "\$",
                            style: TextStyle(
                                color: Color(0xFFFFBF00),
                                fontWeight: FontWeight.w600,
                                fontSize: 26.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFBF00),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: 30,
            child: Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
