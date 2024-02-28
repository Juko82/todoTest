
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/constants/app_color.dart';
import 'package:testing_app/generated/l10n.dart';
import 'package:testing_app/presentation/screens/home_screen/todo_bloc/todo_bloc.dart';
import 'package:testing_app/presentation/screens/settings_screen/settings_screen.dart';
import 'package:testing_app/presentation/widgets/clean_text_field.dart';
import 'package:testing_app/presentation/widgets/container_with_shadow.dart';
import 'package:testing_app/presentation/widgets/todo_icon_button.dart';

import 'package:testing_app/utils/size/app_size.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverAppBar(
      leading: TodoIconButton(
        icon: Icons.menu,
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        TodoIconButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          }, icon: Icons.settings),
        
      ],
      expandedHeight: AppSize.size280,
      surfaceTintColor: ColorsApp.transparent,
      backgroundColor: ColorsApp.cyan,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Container(
          height: AppSize.size350,
          color: theme.scaffoldBackgroundColor,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: AppSize.size25,
                    left: AppSize.size15,
                    right: AppSize.size15),
                width: double.maxFinite,
                height: AppSize.size150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    colors: [
                      ColorsApp.cyan,
                      ColorsApp.blue,
                    ],
                  ),
                ),
                child: const SizedBox.shrink(),
              ),
              Positioned(
                top: AppSize.size100,
                left: AppSize.size30,
                right: AppSize.size30,
                child: ContainerWithShadow(
                  width: double.maxFinite,
                  height: AppSize.size100,
                  child: Center(
                    child: CleanTextField(
                      controller: taskController,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: AppSize.size230,
                left: AppSize.size30,
                right: AppSize.size30,
                child: GestureDetector(
                  onTap: () {
                    if (taskController.text == '') return;
                    BlocProvider.of<TodoBloc>(context).add(
                      TodoRecordDataEvent(newTask: taskController.text),
                    );
                    taskController.text = '';
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ContainerWithShadow(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: [
                          ColorsApp.cyan,
                          ColorsApp.blue,
                        ],
                      ),
                      width: double.maxFinite,
                      height: AppSize.size35,
                      child: Center(
                        child: Text(
                          S.of(context).add,
                          style: const TextStyle(
                            color: ColorsApp.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


