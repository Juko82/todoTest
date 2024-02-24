import 'package:flutter/material.dart';
class HomeScreenDrawer extends StatelessWidget {

  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 80),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
