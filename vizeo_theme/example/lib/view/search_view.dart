import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final textEditingController = TextEditingController();
  final textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        VzSearchBar(
          controller: textEditingController,
          hint: "Enable",
          width: MediaQuery.of(context).size.width * 0.45,
          onFieldSubmitted: (txt) {
            debugPrint("Search => $txt");
          },
        ),
        VzSearchBar(
          controller: textEditingController2,
          isEnable: false,
          hint: "Not Enable",
          width: MediaQuery.of(context).size.width * 0.45,
          onFieldSubmitted: (txt) {
            debugPrint("Search => $txt");
          },
        ),
      ],
    );
  }
}
