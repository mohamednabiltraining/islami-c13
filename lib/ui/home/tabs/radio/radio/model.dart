// import 'dart:convert';

// class RadioMODEL {
//   final int id;
//   final String name;
//   final String url;

//   RadioMODEL({required this.id, required this.name, required this.url});

//   factory RadioMODEL.fromJson(Map<String, dynamic> json) {
//     return RadioMODEL(
//       id: json['id'],
//       name: json['name'],
//       url: json['url'],
//     );
//   }
// }

// class RadioResponse {
//   final List<RadioMODEL> radios;

//   RadioResponse({required this.radios});

//   factory RadioResponse.fromJson(Map<String, dynamic> parsedJson) {
//     final List<dynamic> radioList = parsedJson['radios'];

//     return RadioResponse(
//       radios: radioList.map((json) => RadioMODEL.fromJson(json)).toList(),
//     );
//   }
// }
// // import 'dart:convert';

// // class Radio {
// //   final int id;
// //   final String name;
// //   final String url;

// //   Radio({required this.id, required this.name, required this.url});

// //   factory Radio.fromJson(Map<String, dynamic> json) {
// //     return Radio(
// //       id: json['id'],
// //       name: json['name'],
// //       url: json['url'],
// //     );
// //   }
// // }

// // class RadioResponse {
// //   final List<Radio> radios;

// //   RadioResponse({required this.radios});

// //   factory RadioResponse.fromJson(String responseBody) {
// //     final Map<String, dynamic> parsed = jsonDecode(responseBody);
// //     final List<dynamic> radioList = parsed['radios'];

// //     return RadioResponse(
// //       radios: radioList.map((json) => Radio.fromJson(json)).toList(),
// //     );
// //   }
// // }
