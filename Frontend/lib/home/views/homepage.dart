import 'package:flutter/material.dart';

import '../../const/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: HomeSearch(searchController: searchController),
          actions: [
            IconButton(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/Const/Bell.png",
                  fit: BoxFit.cover,
                ),
              ),
              onPressed: () {
                print("알림");
              },
            ),
          ],
        ),
        body: const Center(
          child: Text("HomePage"),
        ),
      ),
    );
  }
}

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: TextField(
          controller: searchController,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: '원하는 모임방을 검색하세요.',
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                print("Search!");
              },
              icon: Image.asset(
                "assets/images/Const/Magnifier.png",
                fit: BoxFit.cover,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
