class ApiConstance {
  static const String baseUrl = 'https://student.valuxapps.com/api/';

  // static const String logInPath = '$baseUrl/login';
  static String getCategoryDetialsPath({required int categoryId}) =>
      'categories/$categoryId';
}
