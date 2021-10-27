import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: VzSearchBar(
        controller: textEditingController,
        width: MediaQuery.of(context).size.width * 0.5,
        onFieldSubmitted: (txt) {
          debugPrint("Search => $txt");
        },
      ),
    );
  }
}
