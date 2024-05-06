import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/movietrending_wiget.dart';
import 'package:movie_app/presentation/widgets/tvtrending_widget.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({super.key});

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final List<Tab> _tabs = [
    const Tab(
      text: "Movies",
    ),
    const Tab(
      text: "TV Series",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                tabs: _tabs),
            Expanded(
                child: TabBarView(controller: _tabController, children: const [
              MovieTrendingWidget(),
              TvTrendingWidget()
            ]))
          ],
        ),
      ),
    );
  }
}
