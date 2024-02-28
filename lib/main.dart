import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:testing_app/core/constants/theme.dart';
import 'package:testing_app/data/repositories/auth_repo_impl.dart';
import 'package:testing_app/data/repositories/firestore_repo_impl.dart';
import 'package:testing_app/data/repositories/local_repo_impl.dart';
import 'package:testing_app/data/repositories/shared_preference_repo_impl.dart';
import 'package:testing_app/data/repositories/theme_repo_impl.dart';
import 'package:testing_app/domain/repositories/locale_shared_preference.dart';
import 'package:testing_app/domain/repositories/theme_shared_preference_repositories.dart';
import 'package:testing_app/firebase_options.dart';
import 'package:testing_app/generated/l10n.dart';
import 'package:testing_app/presentation/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:testing_app/presentation/screens/auth/auth_screen/auth_screen.dart';
import 'package:testing_app/presentation/screens/home_screen/todo_bloc/todo_bloc.dart';
import 'package:testing_app/presentation/screens/settings_screen/settings_bloc/settings_bloc.dart';
import 'package:testing_app/utils/size/app_size.dart';

void main() async {
  
  GetIt.I.registerLazySingleton<ThemeDataSharedPreference>(() => ThemeDataSharedPreferenceImpl());
  GetIt.I.registerLazySingleton<LocalSharedPreference>(() => LocalSharedPreferenceImpl());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FirestoreRepositoriesImpl(),
        ),
        RepositoryProvider(
          create: (context) => LocalStorageImpl(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepositoriesImpl(
              localStorage: RepositoryProvider.of<LocalStorageImpl>(context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                repositories:
                    RepositoryProvider.of<AuthRepositoriesImpl>(context)),
          ),
          BlocProvider(
            create: (context) => TodoBloc(
                repositories:
                    RepositoryProvider.of<FirestoreRepositoriesImpl>(context)),
          ),
          BlocProvider(
            create: (context) => SettingsBloc()..add(SettingsInit()),
          ),
        ],
        child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: const MyMaterialApp()),
      ),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test App',
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: state.locale ,//?? const Locale('uk'),
          supportedLocales: S.delegate.supportedLocales,
          theme: state.themeData,
          home: const AuthScreen(),
        );
      },
    );
  }
}
