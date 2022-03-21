import 'package:google_sign_in/google_sign_in.dart';

import 'db_service.dart';

class AuthService{
  final _db = DatabaseService();

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      // TODO: signUp
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signIn({
     required String email,
     required String password,
  }) async {
    try {
      // TODO: signIn
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      // TODO: signOut
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // TODO: signInWithGoogle
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}



