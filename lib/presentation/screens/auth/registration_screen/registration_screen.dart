

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/constants/app_color.dart';
import 'package:testing_app/generated/l10n.dart';
import 'package:testing_app/presentation/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:testing_app/presentation/screens/home_screen/home_screen.dart';
import 'package:testing_app/presentation/screens/home_screen/todo_bloc/todo_bloc.dart';
import 'package:testing_app/presentation/widgets/custom_text_field.dart';
import 'package:testing_app/utils/size/app_size.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerPass2 = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPass.dispose();
    _controllerPass2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: ColorsApp.transparent,
        shadowColor: ColorsApp.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSize.size20),
          child: Column(
            children: [
              SizedBox(height: AppSize.size55),
              Container(
                padding: EdgeInsets.all(AppSize.size15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.size20),
                  color: ColorsApp.white,
                ),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthRegisterSuccessState) {
                      _controllerEmail.clear();
                      _controllerPass.clear();
                      _controllerPass2.clear();
                      BlocProvider.of<TodoBloc>(context).add(TodoGetDataEvent(userId: state.id));
                      Navigator.of(context).push(
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).registration,
                          style: TextStyle(
                              color: ColorsApp.blue,
                              fontSize: AppSize.size25,
                              fontWeight: FontWeight.bold),
                        ),
                        CustomTextField(
                          title: S.of(context).emailAddress,
                          controller: _controllerEmail,
                          errorText: state is AuthRegisterFailState
                              ? _getErrorRegistration(state, context, 0)
                              : null,
                          voidCallback: () => BlocProvider.of<AuthBloc>(context)
                              .add(RegistrationCleanFieldEvent()),
                        ),
                        CustomTextField(
                          title: S.of(context).password,
                          controller: _controllerPass,
                          obscureText: true,
                          errorText: state is AuthRegisterFailState
                              ? _getErrorRegistration(state, context, 1)
                              : null,
                          voidCallback: () => BlocProvider.of<AuthBloc>(context)
                              .add(RegistrationCleanFieldEvent()),
                        ),
                        CustomTextField(
                          title: S.of(context).repeatPassword,
                          controller: _controllerPass2,
                          obscureText: true,
                          errorText: state is AuthRegisterFailState
                              ? _getErrorRegistration(state, context, 2)
                              : null,
                          voidCallback: () => BlocProvider.of<AuthBloc>(context)
                              .add(RegistrationCleanFieldEvent()),
                        ),
                        SizedBox(height: AppSize.size15),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                RegistrationNewClientdEvent(
                                  email: _controllerEmail.text,
                                  password1: _controllerPass.text,
                                  password2: _controllerPass2.text,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsApp.blue),
                            child: state is AuthLoadingState
                                ? const CircularProgressIndicator(
                                    color: ColorsApp.white,
                                  )
                                : Text(
                                    S.of(context).registration,
                                    style: const TextStyle(color: ColorsApp.white),
                                  ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _getErrorRegistration(
      AuthRegisterFailState state, BuildContext context, int? passNum) {
    if (state.differentPass == true) {
      return S.of(context).passwordDifferend;
    } else if (passNum == 1 && state.errorPass1 == true) {
      return S.of(context).reuiredField;
    } else if (passNum == 2 && state.errrorPass2 == true) {
      return S.of(context).reuiredField;
    } else if (passNum == 0 && state.errorEmail == true) {
      return S.of(context).incorrectFormat;
    }
    return null;
  }
}
