import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:tic_tac_toe/presentation/pages/sign_in/sign_in_page.dart';

import 'application/auth/auth_bloc.dart';
import 'infrastructure/services/auth_service.dart';
import 'infrastructure/services/db_service.dart';
import 'presentation/pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _db = DatabaseService();
    return RepositoryProvider(
      create: (context) => AuthService(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authService: RepositoryProvider.of<AuthService>(context),
        ),
        child: MaterialApp(
          title: 'Tic-Tac-Toe',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: const [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ],
          ),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  _authStateChanges() {
    // TODO: authStateChanges
  }
}
