import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors_picker.dart';

class TextEditorImage extends StatefulWidget {
  @override
  _TextEditorImageState createState() => _TextEditorImageState();
}

class _TextEditorImageState extends State<TextEditorImage> {
  TextEditingController name = TextEditingController();
  Color currentColor = Colors.black;
  double slider = 12.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          align == TextAlign.left
              ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              title: Icon(FontAwesomeIcons.alignLeft, color: Colors.white,),
                onTap: () {
                  setState(() {
                    align = null;
                  });
                }),
          )
              : IconButton(onPressed: () {
            setState(() {
              align = TextAlign.left;
            });
          }, icon: Icon(FontAwesomeIcons.alignLeft),),
          align == TextAlign.center
              ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                title: Icon(FontAwesomeIcons.alignCenter, color: Colors.white,),
                onTap: () {
                  setState(() {
                    align = null;
                  });
                }),
              )
              : IconButton(
              onPressed: () {
                setState(() {
                  align = TextAlign.center;
                });
              }, icon: Icon(FontAwesomeIcons.alignCenter),),
          align == TextAlign.right
              ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
                title: Icon(FontAwesomeIcons.alignRight, color: Colors.white,),
                onTap: () {
                  setState(() {
                    align = null;
                  });
                }),
          )
              : IconButton(
              onPressed: () {
                setState(() {
                  align = TextAlign.right;
                });
                }, icon: Icon(FontAwesomeIcons.alignRight),),
        ],
      ),
      bottomNavigationBar:
          Container(
            color: Colors.white,
            child: FlatButton(
        onPressed: () {
            Navigator.pop(context, {
              'name': name.text,
              'color': currentColor,
              'size': slider.toDouble(),
              'align': align
            });
        },
        color: Colors.black,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)), child: Text('Add Text', style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,),),
      ),
          ),
      body: Center(
        child: SingleChildScrollView(child: Column
            (children: [
              Container(
            height: MediaQuery.of(context).size.height / 2.2,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Insert Your Message',
                    hintStyle: TextStyle(color: Colors.white),
                    alignLabelWithHint: true,
                  ),
                  scrollPadding: EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 99999,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  autofocus: true,
                ),
              ),
              Container(
                  color: Colors.white,
                child: Column(children: [
                  //   SizedBox(height: 20),
                  Text('Slider Color'),
                  //   SizedBox(height: 10),
                  Row(children:[
                    Expanded(
                      child: BarColorPicker(
                          width: 300,
                          thumbColor: Colors.white,
                          cornerRadius: 10,
                          pickMode: PickMode.Color,
                          colorListener: (int value) {
                            setState(() {
                              currentColor = Color(value);
                            });
                          }),
                    ),
                    FlatButton(onPressed: () {}, child: Text('Reset'),)
                  ]),
                  //   SizedBox(height: 20),
                  Text('Slider White Black Color'),
                  //   SizedBox(height: 10),
                  Row(children:[
                    Expanded(
                      child: BarColorPicker(
                          width: 300,
                          thumbColor: Colors.white,
                          cornerRadius: 10,
                          pickMode: PickMode.Grey,
                          colorListener: (int value) {
                            setState(() {
                              currentColor = Color(value);
                            });
                          }),
                    ),
                    FlatButton(onPressed: () {}, child: Text('Reset'),)
                  ]),
                  Container(color: Colors.black,
                    child: Column(children:[
                      SizedBox(height: 10),
                      Text('Size Adjust'.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                      SizedBox(height: 10),
                      Slider(
                          activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                          value: slider,
                          min: 0.0,
                          max: 100.0,
                          onChangeEnd: (v) {
                            setState(() {
                              slider = v;
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              slider = v;
                            });
                          }),
                    ]),
                  )
                ]),
              ),
            ])),
      ),
    );
  }

  TextAlign? align;
}
