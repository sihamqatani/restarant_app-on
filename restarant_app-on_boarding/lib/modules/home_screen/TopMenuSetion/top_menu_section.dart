import 'package:flutter/material.dart';
import 'package:restarant_app/models/catoregy/catogrey_model.dart';
import 'package:restarant_app/modules/home_screen/TopMenuSetion/top_menu_items.dart';

class TopMenuSection extends StatelessWidget {
  List<Cateorgy> menuType;
  TopMenuSection({Key? key, required this.menuType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20),
      height: 100,
      width: MediaQuery.of(context).size.width,

      child: ListView.builder(
        // reverse: true,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            TopMenuItems(menuType: menuType[index]),
        //shrinkWrap: true,

        itemCount: menuType.length,
        itemExtent: 50,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
