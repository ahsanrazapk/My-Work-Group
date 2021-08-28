import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:latest/Constant.dart';
import 'item_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: radiusCircular,
                bottomRight: radiusCircular),
            color: accentColor,
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: titleTopPadding),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize),
            ),
          )),
        ),
      ),
      body: Container(
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          itemCount: count,
          itemBuilder: (BuildContext context, int index) =>
              InkWell(onTap: () {}, child: _getBox(index)),
          staggeredTileBuilder: (int index) {
            if (Number.values[index].valid) {return fullTile;}
            return halfTile;
          },
          crossAxisSpacing: crossAxisSpacing,
        ),
      ),
    );
  }

  Widget _getBox(int index) {
   ItemData itemData =  ItemData.listOfItems[index];
    switch (Number.values[index]) {
      case Number.Zero:
        return _getTopCell(title: itemData.title, subtitle: itemData.subTitle!);
      case Number.One:
        return _getTopCell(title: itemData.title, subtitle: itemData.subTitle!);
      case Number.Two:
        return Padding(
          padding: EdgeInsets.all(padding6),
          child: Card(
            elevation: elevation,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius10)),
            child: Container(
              padding:  EdgeInsets.all(padding8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Image.asset(itemData.path!, fit: BoxFit.fill,),
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: padding10),
                        child: Text(
                          itemData.title,
                          style: TextStyle(
                              color: Colors.black12,
                              fontSize: fontSize23,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: iconSize30,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      case Number.Three:
        return Padding(
          padding: EdgeInsets.only(left: padding20, top: padding10, bottom: padding10),
          child: _getMidCell(title: itemData.title, child: Text(itemData.subTitle!, style: TextStyle(fontSize: fontSize26),)),
        );
      case Number.Four:
        return Padding(
          padding:  EdgeInsets.only(right: padding20, top: padding10, bottom: padding10),
          child: _getMidCell(
              title: itemData.title,
              child: Icon(
                Icons.message,
                color: accentColor,
              )),
        );
      case Number.Five:
        return _getEndCell(
            path: itemData.path!,
            title: itemData.title,
            subtitle: itemData.subTitle!,
            isVisible: false,
          col: accentColor,
        );
      case Number.Six:
        return _getEndCell(
            path: itemData.path!,
            title: itemData.title,
            subtitle: itemData.subTitle!,
          isVisible: true,
          col: Colors.red
        );
      default:
        return Container();
    }
  }
  Widget _getTopCell({required String title, required String subtitle}) {
    return Material(
      elevation: elevation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: fontSize18),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: fontSize28),
          )
        ],
      ),
    );
  }
  Widget _getMidCell({required String title, required Widget child}) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          child
        ],
      ),
    );}
  Widget _getEndCell(
      {required String path,
      required String title,
      required String subtitle,
      required bool isVisible,
      required Color col}) {
    return Padding(
      padding:  EdgeInsets.only(left: padding6, right: padding6),
      child: Card(
        elevation: elevation,
        child: Container(
          padding:  EdgeInsets.all(padding8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: radius25,
                    child: Image.asset(path),
                  ),
                  Positioned(
                      left: positioned35,
                      top: positioned35,
                      child: Image.asset("assets/phone.png", scale: scale35,)),

                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize18,
                      color: accentColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: fontSize14, color: col),
                  ),
                ],
              )),
              Visibility(
                visible: isVisible,
                maintainSize: true,
                maintainAnimation: true,
                maintainSemantics: true,
                maintainInteractivity: true,
                maintainState: true,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: iconSize30,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
