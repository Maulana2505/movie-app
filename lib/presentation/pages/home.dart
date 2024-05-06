import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/alltreinding_widget.dart';
import 'package:movie_app/presentation/widgets/tabbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [AlltrendingWidget(),TabbarWidget()],
      ),
    );
  }
}
