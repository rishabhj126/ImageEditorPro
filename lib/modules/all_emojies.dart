import 'package:flutter/material.dart';
import 'package:image_editor_pro/data/data.dart';

class Emojies extends StatefulWidget {
  @override
  _EmojiesState createState() => _EmojiesState();
}

class _EmojiesState extends State<Emojies> {
  List emojes = <dynamic>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          blurRadius: 10.9,
          color: Colors.grey[400]!,
        )]
      ),
      child: Column(children:[
        Padding(
          padding: EdgeInsets.all(20),
           child: Row(children:[Text('Select Emoji')])),
        Divider(
          height: 1,
        ),
        SizedBox(height: 10),
        Container(
          height: 315,
          padding: EdgeInsets.all(0.0),
          child: GridView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.0, maxCrossAxisExtent: 60.0),
                  children: emojis.map((String emoji) {
                    return GridTile(
                        child:
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, {
                                  'name': emoji,
                                  'color': Colors.white,
                                  'size': 12.0,
                                  'align': TextAlign.center
                                });
                              },
                              child: Container(padding: EdgeInsets.zero,
                                child: Text(emoji, style: TextStyle(
                                    fontSize: 35
                                ),),
                              ),
                            ),);
                  }).toList()),
        )
      ]),
    );
  }

  List<String> emojis = [];
  @override
  void initState() {
    super.initState();
    emojis = getSmileys();
  }
}
