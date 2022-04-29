class AddressBook {

  final String imageName;
  final String title;

  AddressBook(this.imageName, this.title);

}

List<AddressBook> addressBooks = [
  AddressBook('images/新的朋友.png', '新的朋友'),
  AddressBook('images/群聊.png', '群聊'),
  AddressBook('images/标签.png', '标签'),
  AddressBook('images/公众号.png', '公众号'),
];

class Friends {

  final String imageUrl;
  final String name;
  final String? indexLetter;
  final String? message;
  final String? time;

  Friends({
    required this.imageUrl,
    required this.name,
    required this.indexLetter,
    this.message,
    this.time,
  });

}

List<Friends> datas = [
  Friends(
    imageUrl: 'https://randomuser.me/api/portraits/women/57.jpg',
    name: 'Lina',
    indexLetter: 'L',
    message: 'hello hank!!!',
    time: '下午 3:45'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/70.jpg',
      name: '菲儿',
      indexLetter: 'F',
      message: '忙完了吗？',
      time: '下午 3:25'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/60.jpg',
      name: '安莉',
      indexLetter: 'A',
      message: '我再看看，稍等。',
      time: '下午 2:45'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/91.jpg',
      name: 'Martin',
      indexLetter: 'M',
      message: '我F...佛慈悲~',
      time: '下午 19:05'
  ),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/76.jpg',
      name: '啊啊啦',
      indexLetter: 'A',
      message: 'heheoeo~',
      time: '上午 00:23'
  ),
];