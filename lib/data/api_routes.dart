abstract class ApiRoutes {
  static const _baseUrl = 'https://flutter-academy-backend.herokuapp.com/';
  static const signUp = _baseUrl + 'auth/sign-up';
  static const signIn = _baseUrl + 'auth/sign-in';
}


// POST https://flutter-academy-backend.herokuapp.com/auth/sign-up
// {
// "email": email,
// "password": password
// }