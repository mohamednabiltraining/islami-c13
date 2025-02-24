// import 'package:dio/dio.dart';
// import 'model.dart';
// // import 'radio_model.dart'; // Import your model file

// class RadioService {
//   final Dio _dio = Dio();

//   Future<List<RadioMODEL>> fetchRadios() async {
//     try {
//       Response response = await _dio.get('https://mp3quran.net/api/v3/radios');

//       if (response.statusCode == 200) {
//         final data = RadioResponse.fromJson(response.data);
//         return data.radios;
//       } else {
//         throw Exception('Failed to load radios');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }

// // import 'package:dio/dio.dart';

// // import 'model.dart';

// // class RadioService {
// //   final Dio _dio = Dio();

// //    Future<List<Radio>> fetchRadios() async {
// //     try {
// //       Response response = await _dio.get('https://mp3quran.net/api/v3/radios');

// //       if (response.statusCode == 200) {
// //         final data = RadioResponse.fromJson(response.data);
// //         return data.radios;
// //       } else {
// //         throw Exception('Failed to load radios');
// //       }
// //     } catch (e) {
// //       throw Exception('Error: $e');
// //     }
// //   }
// // }

// // // import 'package:dio/dio.dart';

// // // class RadioService {
// // //   final Dio _dio = Dio();

// // //   Future<List<dynamic>> fetchRadios() async {
// // //     try {
// // //       final response = await _dio.get('https://mp3quran.net/api/v3/radios');
// // //       if (response.statusCode == 200) {
// // //         return response.data['radios']; // List of reciters
// // //       } else {
// // //         throw Exception('Failed to load radios');
// // //       }
// // //     } catch (e) {
// // //       print('Error fetching radios: $e');
// // //       throw Exception('Failed to fetch radios');
// // //     }
// // //   }

// // //   // Get a sample audio URL from the reciter's moshaf list
// // //   String? getSampleAudioUrl(Map<String, dynamic> reciter) {
// // //     if (reciter['moshaf'] != null && reciter['moshaf'].isNotEmpty) {
// // //       return reciter['moshaf'][0]['server']; // Base URL for reciter's audios
// // //     }
// // //     return null;
// // //   }
// // // }