class ApiConstants {
  static const String baseUrl = 'http://142.93.106.105';
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
  
  static const String authToken = 'Basic dml0ZWNkZXY6bFRFUWNJNGJuUGcz';
  
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': authToken,
  };
  
  static const String routesEndpoint = '/interview/getRoutes.php';
  
  static const Duration cacheExpiration = Duration(minutes: 1);
  
  static const int itemsPerPage = 2;
}
