import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: const Text(AppStringsManager.search).tr());
  }
}
