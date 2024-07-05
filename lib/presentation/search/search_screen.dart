import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:netflix/presentation/search/widget/serach_result.dart';

bool searchbarValue = false;

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onTap: () {
                setState(() {
                  searchbarValue = true;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  searchbarValue = false;
                });
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    searchValue = value;
                  });
                }
              },
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
            ),
            kheight,
            Expanded(
              child: searchbarValue
                  ? const SearchIdleWidget()
                  :  SearchResultWidget(
                    searchValue: searchValue
                  ),
            ),
          ],
        ),
      )),
    );
  }
}
