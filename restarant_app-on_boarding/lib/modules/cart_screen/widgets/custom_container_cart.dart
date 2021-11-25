import 'package:flutter/material.dart';

class CustomConatinerCart extends StatelessWidget {
  String nameMeal;
  String image;
  dynamic price;
  dynamic counter;
  CustomConatinerCart({
    required this.nameMeal,
    required this.image,
    required this.price,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment:
              //    MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 45,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red[100]!),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: InkWell(
                        child: Icon(
                          Icons.arrow_upward,
                          size: 22,
                          color: Colors.red[100],
                        ),
                        onTap: () {},
                      )),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                          child: Text(
                        counter.toString(),
                        style: TextStyle(
                          color: Colors.red[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_downward,
                            size: 22,
                            color: Colors.red[100],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Text(
                        nameMeal,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      price.toString(),
                      style: TextStyle(
                          color: Colors.red[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                    ),
                  ],
                ),
                //SizedBox(width: 30,),
                Expanded(
                  child: GestureDetector(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.cancel,
                            color: Colors.red[100],
                          )),
                      onTap: () {
                        AlertDialog(
                          title: Text('هل انت متأكد من الغاء طلبك'),
                          actions: [],
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
