import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Stories extends StatefulWidget {
  final dynamic stories;

  Stories({Key key, @required this.stories}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  List<StoryItem> items = List();

  @override
  void initState() {
    super.initState();
  }

  final storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(
          0,
        ),
        child: StoryView(
          storyItems: [
            StoryItem.pageImage(
                url: widget.stories.image,
                controller: storyController,
                caption: widget.stories.datetime,
                duration: Duration(milliseconds: 10000)),
          ],
          onStoryShow: (s) {
            print("Showing a story");
          },
          onComplete: () {
            Navigator.of(context).pop();
          },
          onVerticalSwipeComplete: (Direction direction) {
            if (direction == Direction.down) {
              return Navigator.of(context).pop();
            }
          },
          progressPosition: ProgressPosition.top,
          repeat: false,
          controller: storyController,
        ),
      ),
    );
  }
}
