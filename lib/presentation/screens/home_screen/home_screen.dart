
import 'package:flutter/material.dart';
import 'package:testing_app/presentation/screens/home_screen/drawer.dart';
import 'package:testing_app/presentation/screens/home_screen/widgets/custom_app_bar_home_page.dart';
import 'package:testing_app/presentation/screens/home_screen/widgets/custom_hide_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeScreenDrawer(),
      body: GestureDetector(
        onHorizontalDragEnd: (_) {Scaffold.of(context).openDrawer();},
        child: const CustomScrollView(
          slivers: [
             CustomAppBar(),
            SliverToBoxAdapter(
              child: CustomHideBar(),
            )
          ],
        ),
      ),
    );
  }
}