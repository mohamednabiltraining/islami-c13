import 'package:dio/dio.dart';

class ReciterService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchReciters() async {
    try {
      final response = await _dio
          .get('https://www.mp3quran.net/api/v3/reciters?language=ar');
      if (response.statusCode == 200) {
        return response.data['reciters']; // List of reciters
      } else {
        throw Exception('Failed to load reciters');
      }
    } catch (e) {
      print('Error fetching reciters: $e');
      throw Exception('Failed to fetch reciters');
    }
  }

  // Get a sample audio URL from the reciter's moshaf list
  String? getSampleAudioUrl(Map<String, dynamic> reciter) {
    if (reciter['moshaf'] != null && reciter['moshaf'].isNotEmpty) {
      return reciter['moshaf'][0]['server']; // Base URL for reciter's audios
    }
    return null;
  }
}

// import 'package:dio/dio.dart';

// class ReciterService {
//   final Dio _dio = Dio();

//   Future<List<dynamic>> fetchReciters() async {
//     try {
//       final response = await _dio.get('https://www.mp3quran.net/api/v3/reciters?language=ar');

//       if (response.statusCode == 200) {
//         return response.data['reciters']; // List of reciters
//       } else {
//         throw Exception('Failed to load reciters');
//       }
//     } catch (e) {
//       print('Error fetching reciters: $e');
//       throw Exception('Failed to fetch reciters');
//     }
//   }
// }
