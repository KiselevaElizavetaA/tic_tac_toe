import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          home: StreamBuilder(
            stream: _authStateChanges(),
            builder: (context, snapshot) {
              // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
              if (snapshot.hasData) {
                return const HomePage();
              }
              // Otherwise, they're not signed in. Show the sign in page.
              return const SignInPage();
            },
          ),
        ),
      ),
    );
  }

  _authStateChanges() {
    // TODO: authStateChanges
  }
}
