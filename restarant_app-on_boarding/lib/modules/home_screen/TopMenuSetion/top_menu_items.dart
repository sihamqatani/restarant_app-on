import 'package:flutter/material.dart';
import 'package:restarant_app/models/catoregy/catogrey_model.dart';
import 'package:restarant_app/modules/catogragy_screen/catogragy_screen.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';

class TopMenuItems extends StatelessWidget {
  Cateorgy menuType;
  TopMenuItems({Key? key, required this.menuType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin:EdgeInsets.symmetric(horizontal:5),
      child: Column(
        children: [
          Card(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  navigateTo(context, CatogryScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  width: 50,
                  height: 50,
                  child: Card(
                    elevation: 0,
                    /* shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),*/

                    child: Container(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Image.asset(menuType.imageUrl),
                      ),
                    ),
                  ),
                ),
              )),
          //SizedBox(width: 10,height: 10,),
          Text(
            menuType.name,
            style: TextStyle(
                color: ModeCubit.get(context).isDark
                    ? Colors.white60
                    : Colors.grey[900],
                fontSize: 12,
                fontFamily: 'Cairo'),
          ),
        ],
      ),
    );
  }
}
