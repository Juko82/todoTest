import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/presentation/screens/home_screen/todo_bloc/todo_bloc.dart';
import 'package:testing_app/presentation/widgets/container_with_shadow.dart';
import 'package:testing_app/utils/size/app_size.dart';

class CustomHideBar extends StatelessWidget {
  const CustomHideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count;
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        count = state is TodoLoadedState ? state.model.todoList.length : 0;

        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[80],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.size20),
              topRight: Radius.circular(AppSize.size20),
            ),
          ),
          height: count <= 12 ? AppSize.screenHeigth - AppSize.size55 : null,
          child: Column(
            children: [
              count <= 8
                  ? const SizedBox.shrink()
                  : Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: AppSize.size15),
                        width: AppSize.size25,
                        height: AppSize.size5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(AppSize.size10),
                        ),
                      ),
                    ),
              SizedBox(
                height: AppSize.size55,
              ),
              Wrap(
                spacing: AppSize.size15,
                runSpacing: AppSize.size20,
                children: state is TodoLoadingState
                    ? [const CircularProgressIndicator()]
                    : state is TodoLoadedState
                        ? _getTask(context: context, state: state)
                        : [],
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> _getTask(
      {required TodoLoadedState state, required BuildContext context}) {
    return state.model.todoList
        .map(
          (e) => ContainerWithShadow(
            width: AppSize.size165,
            height: AppSize.size70,
            child: Center(
              child: Text(
                e,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        )
        .toList();
  }
}
