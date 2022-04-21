import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfReader extends StatefulWidget {
  final String url;
  const PdfReader({Key key, this.url}) : super(key: key);

  @override
  _PdfReaderState createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  PDFDocument document;

  var _isLoading;

  @override
  void initState() {
    loadPdf();
    // TODO: implement initState
    super.initState();
  }

  void loadPdf() async {
    document = await PDFDocument.fromURL(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecture'),
      ),
      body: Center(
          child: document == null
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: document)),
    );
  }
}
