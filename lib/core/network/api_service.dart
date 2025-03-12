import 'package:dio/dio.dart';

class ApiService {
  // دالة لإرجاع البيانات
  final Dio dio;
  ApiService({required this.dio});
  final String _baseUrl = 'https://api.exchangerate.host/timeframe?';

  Future<Map<String, dynamic>> getData({
    required String startDate,
    required String endDate,
    required String sourceCurr,
  }) async {
    try {
      Response response = await dio.get(
          "$_baseUrl start_date=$startDate&end_date=$endDate&source=$sourceCurr&access_key=55b940c3c2ec972db09cbf56ba9a7b11");
      return response.data;
    } catch (e) {
      throw Exception("Api Error : ${e.toString()}");
    }
  }
}
