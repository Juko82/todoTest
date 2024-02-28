import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/constants/app_color.dart';
import 'package:testing_app/generated/l10n.dart';
import 'package:testing_app/presentation/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:testing_app/presentation/screens/auth/auth_screen/auth_screen.dart';
import 'package:testing_app/presentation/screens/home_screen/todo_bloc/todo_bloc.dart';
import 'package:testing_app/presentation/screens/settings_screen/settings_bloc/settings_bloc.dart';
import 'package:testing_app/presentation/screens/settings_screen/widgets/settings_listTile.dart';
import 'package:testing_app/presentation/widgets/container_with_shadow.dart';
import 'package:testing_app/utils/size/app_size.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: theme.textTheme.titleMedium,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSize.size15, horizontal: AppSize.size20),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Column(
              children: [
                SettingsLitTile(
                  title: S.of(context).darkTheme,
                  val: state.darkTheme,
                  onChanged: (val) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsChangeThemEvent(value: !val));
                  },
                ),
                SettingsLitTile(
                  title: S.of(context).languageSettings,
                  val: state.enLocal,
                  onChanged: (val) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsChangeLocaleEvent(enLocal: state.enLocal));
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    BlocProvider.of<TodoBloc>(context).add(TodoClearState());
                    BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(),
                      ),
                    );
                  },
                  child: ContainerWithShadow(
                    width: double.infinity,
                    padding: 10,
                    height: 50,
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: [ColorsApp.blue, ColorsApp.cyan]),
                    child: Center(
                      child: Text(
                        S.of(context).logout,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
