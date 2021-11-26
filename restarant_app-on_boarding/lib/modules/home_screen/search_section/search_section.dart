import 'package:flutter/material.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';

class SearchSection extends StatelessWidget {
  String hintText;
  TextEditingController? searchController;
  SearchSection({Key? key, required this.hintText, this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ModeCubit.get(context).isDark ? Colors.black12 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: TextField(
          controller: searchController,
          cursorColor: Colors.red[100],
          decoration: InputDecoration(
            focusColor: Colors.red[100],
            hintText: 'اكتب الوجبة التي تريدها',
            hintStyle: TextStyle(
              color: ModeCubit.get(context).isDark
                  ? Colors.white54
                  : Colors.grey[900],
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[50]!),
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.red[100],
            ),
          ),
        ),
      ),
    );
  }
}
