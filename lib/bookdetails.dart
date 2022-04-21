import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:tala/pdfreader.dart';
import 'package:tala/utilities/books.dart';

class BookDetails extends StatefulWidget {
  final Books book;
  const BookDetails({Key key, this.book}) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  PDFDocument pdf;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            // IconButton(
            //   padding: EdgeInsets.all(0.0),
            //   color: Colors.white,
            //   icon: Icon(Icons.close),
            //   onPressed: () => Navigator.of(context).pop(),
            // )
          ],
          expandedHeight: MediaQuery.of(context).size.height * 0.5,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(children: <Widget>[
              Hero(
                tag: 'exho-cover',
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.book.cover),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    margin: EdgeInsets.only(bottom: 30, right: 20),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xFFFF921F)),
                    child: Text(widget.book.categories,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.bold))),
              )
            ]),
          ),
        ),
        SliverList(
            // itemExtent: 150,
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Autheur",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              widget.book.publisher,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Annee de publication",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              widget.book.date,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Resumer",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              widget.book.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Ubuntu'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(
                    top: 2.0,
                    bottom: 2.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue),
                  child: TextButton(

                      // color: redcolor,

                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PdfReader(url: widget.book.url)));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.read_more_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Lire le resumer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontFamily: 'montserrat',
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(
                  top: 2.0,
                  bottom: 2.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.orange),
                child: TextButton(

                    // color: redcolor,

                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                        ),
                        Text(
                          "Acheter",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    )),
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
