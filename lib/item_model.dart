class ItemData {
  String title;
  String? subTitle;
  String? path;

  ItemData({required this.title, this.subTitle, this.path});

  static List<ItemData> listOfItems = [
    ItemData(title: 'Top Client', subTitle: '0'),
    ItemData(title: 'Total Income', subTitle: '\$ 0'),
    ItemData(title: 'Green Cabs', path: 'assets/photo.png'),
    ItemData(title: 'Total Drivers', subTitle: '64'),
    ItemData(title: 'Group Chat'),
    ItemData(title: 'Jessica Miller',subTitle: 'Group Admin' ,path: 'assets/photo.png'),
    ItemData(title: 'Jessica Miller',subTitle: 'Pending Approval' ,path: 'assets/photo.png'),
  ];
}
