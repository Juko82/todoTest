import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/constants/app_color.dart';
import 'package:testing_app/generated/l10n.dart';
import 'package:testing_app/presentation/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:testing_app/presentation/screens/auth/registration_screen/registration_screen.dart';
import 'package:testing_app/presentation/screens/home_screen/home_screen.dart';
import 'package:testing_app/presentation/screens/home_screen/todo_bloc/todo_bloc.dart';
import 'package:testing_app/presentation/widgets/custom_text_field.dart';
import 'package:testing_app/utils/size/app_size.dart';
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSize.size20),
          child: Column(
            children: [
              SizedBox(
                height: AppSize.size100,
              ),
              Container(
                padding: EdgeInsets.all(AppSize.size15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsApp.white,
                  borderRadius: BorderRadius.circular(AppSize.size20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).login,
                      style: TextStyle(
                          color: ColorsApp.blue,
                          fontSize: AppSize.size25,
                          fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                      controller: controllerEmail,
                      title: S.of(context).emailAddress,
                    ),
                    CustomTextField(
                      controller: controllerPass,
                      title: S.of(context).password,
                      obscureText: true,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).forgotPassword,
                        style: const TextStyle(color: ColorsApp.blue),
                      ),
                    ),
                    SizedBox(height: AppSize.size5),
                    SizedBox(
                      width: double.maxFinite,
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccsessState) {
                            BlocProvider.of<TodoBloc>(context).add(TodoGetDataEvent(userId: state.id));
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          } else if (state is AuthErrorState) {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                height: AppSize.size200,
                                width: double.infinity,
                                color: ColorsApp.white,
                                child: Text(state.errorText),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthUserEvent(
                                    email: controllerEmail.text,
                                    password: controllerPass.text),
                              );
                              controllerEmail.clear();
                              controllerPass.clear();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsApp.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSize.size5)))
                              
                            ),
                            child: (state is AuthLoadingState)
                                ? const CircularProgressIndicator(
                                    color: ColorsApp.white,
                                  )
                                :  Text(
                                    S.of(context).enter,
                                    style: const TextStyle(
                                      color: ColorsApp.white,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                },
                child: Text(S.of(context).registration,
                    style: const TextStyle(color: ColorsApp.blue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
