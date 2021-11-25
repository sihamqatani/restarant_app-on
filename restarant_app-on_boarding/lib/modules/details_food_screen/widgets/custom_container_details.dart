import 'package:flutter/material.dart';
import 'package:restarant_app/modules/details_food_screen/widgets/custom_horizental_counter_conatiner.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';
import 'package:restarant_app/shared/shared_widgets/custom_rating.dart';

class CustomContainerDetails extends StatelessWidget {
  String? image;
  String? name;
  dynamic rating;
  dynamic price;
  CustomContainerDetails({
    this.image,
    this.name,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: ModeCubit.get(context).isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name.toString(),
                    // foodDetails[index].name,
                    // 'برجر لحم ',
                    // 'ستيك لحم مع الخضار',
                    style: TextStyle(
                        color: Colors.red[400],
                        wordSpacing: 3,
                        fontSize: 25,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.red[200],
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('التقييم :',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20,
                        color: ModeCubit.get(context).isDark
                            ? Colors.white70
                            : Colors.black,
                      )),
                  Spacer(),
                  Container(child: CustomRating(onRatingUpdate: (rating) {})),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'يتكون من لحم بقري طازج محضر بأجود انواع التوابل مع صوص خاص يجعل مذاقه لايقاوم الصوص حار وبارد حسب ',
                style: TextStyle(
                  fontSize: 15,
                  color: ModeCubit.get(context).isDark
                      ? Colors.white60
                      : Colors.black,
                ),
                maxLines: 3,
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: [
                Text(
                  ' ${price.toString()} ريال ',
                  style: TextStyle(
                      color: Colors.red[400],
                      wordSpacing: 3,
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomHorizCounterContainer(
                      counter: 3,
                      upward: () {},
                      downrd: () {},
                    ))
              ]),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: MaterialButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.red[200],
                  onPressed: () {},
                  child: Text(
                    'اطلب الان',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2,
                        fontFamily: 'Cairo'),
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              )

              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
