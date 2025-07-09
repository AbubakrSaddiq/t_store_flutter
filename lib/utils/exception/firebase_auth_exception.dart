class StoreFirebaseAuthException implements Exception{
  final String code;

  StoreFirebaseAuthException(this.code);

  String get message{
    switch (code) {
      case 'invalid-email':
      return 'The email address is badly formatted.';
      case 'user-disabled':
      return 'The user has been disabled.';
      case 'user-not-found':
      return 'No user found for that email.';
      case 'wrong-password':
      return 'Wrong password provided.';
      case 'email-already-in-use':
      return 'Account already exists.';
      case 'operation-not-allowed':
      return 'Sign-in method not enabled.';
      case 'weak-password':
      return 'Password too weak.';
      default:
      return 'Handle unknown errors';
    }
  }
}