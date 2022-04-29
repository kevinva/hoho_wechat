import 'package:flutter/material.dart';

import '../const.dart';


class IndexBar extends StatefulWidget {

  final void Function(String str) indexBarCallback;

  const IndexBar({Key? key, required this.indexBarCallback}) : super(key: key);

  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {

  var _currentIndexLetter = '';
  final _index_words= [];
  Color _backgroundColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  var _showIndicator = true;
  var _indicatorAlignmentY = -1.13;

  @override
  void initState() {
    super.initState();

    _index_words.add('搜索');
    for (int i = 0; i < 26; i++) {
      var string = String.fromCharCode(i + 65);
      _index_words.add(string);
    }
  }

  String? getIndexLetter(BuildContext context, Offset globalPosition) {
    RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box != null) {
      double y = box.globalToLocal(globalPosition).dy;
      final itemHeight = screenHeight(context) / 2 / _index_words.length; // 每个字符的高度
      int index = (y ~/ itemHeight).clamp(0, _index_words.length - 1);  // ~/是除后取整运算
      // print('角标是${index_words[index]}');
      return _index_words[index];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> indexWidgets = [];
    for (int i = 0; i < 26; i++) {
      indexWidgets.add(
          Expanded(
            child: Text(
              _index_words[i],
              style: TextStyle(fontSize: 10, color: _textColor,),
            ),
          )
      );
    }

    return Positioned(
      top: screenHeight(context) / 8,
      right: 0,
      width: 100,
      height: screenHeight(context) / 2,
      child: Row(
        children: [
          Container(
            alignment: Alignment(0, _indicatorAlignmentY),
            width: 70,
            child: !_showIndicator ? null : Stack(
              alignment: Alignment(-0.3, 0),
              children: [
                Image(image: AssetImage('images/气泡.png'), width: 60,),
                Text(_currentIndexLetter, style: TextStyle(fontSize: 35, color: Colors.white),),
              ],
            ),
          ),
          GestureDetector(
            onVerticalDragDown: (DragDownDetails details) {
              String indexLetterSelected = getIndexLetter(context, details.globalPosition)!;
              if (_currentIndexLetter != indexLetterSelected) {
                _currentIndexLetter = indexLetterSelected;
                widget.indexBarCallback(indexLetterSelected);
              }

              _backgroundColor = Color.fromRGBO(1, 1, 1, 0.5);
              _textColor = Colors.white;
              _showIndicator = true;
              setState(() {

              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              _backgroundColor = Color.fromRGBO(1, 1, 1, 0.0);
              _textColor = Colors.black;
              _showIndicator = false;
              setState(() {

              });
            },
            onVerticalDragUpdate: (DragUpdateDetails details) {
              String indexLetterSelected = getIndexLetter(context, details.globalPosition)!;
              if (_currentIndexLetter != indexLetterSelected) {
                _currentIndexLetter = indexLetterSelected;
                widget.indexBarCallback(indexLetterSelected);
                _indicatorAlignmentY = (1.13 + 1.13) / (_index_words.length.toDouble() - 1) * _index_words.indexOf(_currentIndexLetter) - 1.13;
              }
            },
            child: Container(
              color: Color.fromRGBO(1, 1, 1, 0.25),
              child: Column(
                children: indexWidgets,
              ),
            ),
          ),
        ],
      )
    );
  }

}