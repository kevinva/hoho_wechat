import 'package:flutter/material.dart';
import '../../pages/const.dart';


class SearchCell extends StatelessWidget {
  const SearchCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: themeColor,
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/放大镜b.png'), width: 25, color: Colors.red,),
            Text('微信', style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}