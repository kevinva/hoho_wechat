import 'dart:convert';

import 'package:flutter/material.dart';
import '../../pages/const.dart';
import 'package:http/http.dart' as http;

import '../../model/chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin {

  List<Chat> _chatList = [];
  bool _cancelConnect = false;

  bool get wantKeepAlive => true;

  PopupMenuItem _buildMenuItem(String imageName, String title) {
    return PopupMenuItem(
      value: {
        'imageName': imageName,
        'title': title,
      },
      child: Row(
        children: [
          Image(
            image: AssetImage(imageName),
            width: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // final chat = {
    //   'name': '张三',
    //   'message': '吃了吗'
    // };

    // Map转JSON
    // final jsonChat = json.encode(chat);
    // print(jsonChat);
    //
    // // JSON转Map
    // final mapChat = json.decode(jsonChat);
    // print(mapChat);
    // (mapChat is Map);

    getData().then((List<Chat>? value) {
      if (!_cancelConnect) {
        setState(() {
          _chatList = value!;
        });
      }
    }).catchError((onError) {
      print('getData onError: ${onError}');
    }).whenComplete(() {
      print('完成');
    }).timeout(Duration(milliseconds: 10000)).catchError((timeoutError) {
      _cancelConnect = true;
      print('timeout error: ${timeoutError}');
    });
    // print('来了');
  }

  Future<List<Chat>?> getData() async {
    _cancelConnect = false;
    var response = await http.get(Uri.parse('http://rap2api.taobao.org/app/mock/data/2254192'));
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      print(responseMap);
      List<Chat> chatList = responseMap['chatlist'].map<Chat>(
          (item) {
            return Chat.fromMap(item);
          }
      ).toList();
      return chatList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text('微信', style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              color: Colors.red,
              onSelected: (item) {
                print(item);
              },
              onCanceled: () {
                print('onCanceled');
              },
              offset: Offset(0, 60),
              child: Image(
                image: AssetImage('images/圆加.png'),
                width: 25,
                height: 25,
              ),
              itemBuilder: (BuildContext ctx) {
                return <PopupMenuItem>[
                  _buildMenuItem('images/发起群聊.png', '发起群聊'),
                  _buildMenuItem('images/添加朋友.png', '添加朋友'),
                  _buildMenuItem('images/扫一扫1.png', '扫一扫'),
                  _buildMenuItem('images/收付款.png', '收付款'),
                ];
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: _chatList.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount:_chatList.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return ListTile(
                    title: Text(_chatList[index].name),
                    subtitle: Container(
                      height: 20,
                      width: 20,
                      child: Text(
                        _chatList[index].message,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_chatList[index].imageUrl),
                    ),
                  );
                }
              ),
      ),
    );
  }
}