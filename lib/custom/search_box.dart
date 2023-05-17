import 'package:flutter/material.dart';
import 'package:recipe_app/constants/coolors.dart';

class SearchBox extends StatelessWidget {
  final runFilter;
  const SearchBox({
    super.key, this.runFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) {
          runFilter(value);
        },
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search,color: CoolorsLight.tdBlack, size: 20,),
          prefixIconConstraints: const BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: CoolorsLight.tdGrey),
        ),
      ),
    );
  }
}