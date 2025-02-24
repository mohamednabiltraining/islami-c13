import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../../assets.dart';

class RadioStation {
  final int id;
  final String name;
  final String url;

  RadioStation({required this.id, required this.name, required this.url});

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}

class RadioListScreen extends StatefulWidget {
  @override
  _RadioListScreenState createState() => _RadioListScreenState();
}

class _RadioListScreenState extends State<RadioListScreen> {
  final Dio _dio = Dio();
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<RadioStation> _radios = [];
  bool _isLoading = true;
  bool isPlaying = false;
  String? currentUrl;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  // Future<void> fetchRadios() async {
  //   try {
  //     final response = await _dio.get('https://mp3quran.net/api/v3/radios?language=eng');
  //     if (response.statusCode == 200) {
  //       List<dynamic> radiosJson = response.data['radios'];print(response.data);

  //       setState(() {
  //         _radios = radiosJson.map((json) => RadioStation.fromJson(json)).toList();
    //       _isLoading = false;
    //     });
    //   }
    // } catch (e) {
    //   print('Error fetching radios: $e');
    //   setState(() {
    //     _isLoading = false;
    //   });
    // }
  // }
  Future<void> fetchRadios() async {
  try {
    print("Fetching radios...");
    final response =
        await _dio.get('https://mp3quran.net/api/v3/radios?language=eng');
    print("Response status: ${response.statusCode}");
    print("Response data: ${response.data}"); // Print full response

    if (response.statusCode == 200 && response.data != null) {
      List<dynamic> radiosJson = response.data['radios'] ?? [];
      print("Parsed radios: $radiosJson");

      setState(() {
        _radios = radiosJson.map((json) => RadioStation.fromJson(json)).toList();
        _isLoading = false;
      });
    } else {
      print("Invalid response format");
    }
  } catch (e) {
    print('Error fetching radios: $e');
    setState(() {
      _isLoading = false;
    });
  }
}


  void _playAudio(String url) async {
    if (isPlaying && currentUrl == url) {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        currentUrl = url;
        isPlaying = true;
      });
    }
  }

  void _toggleMute() {
    isMuted = !isMuted;
    _audioPlayer.setVolume(isMuted ? 0 : 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio Stations')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _radios.length,
              itemBuilder: (context, index) {
                final radio = _radios[index];
                return Container(
                  height: 125,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Mosque-02.png'),
                      opacity: 0.5,
                      alignment: Alignment.bottomCenter,
                    ),
                    color: AppColors.primaryGold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Radio-> ${radio.name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => _playAudio(radio.url),
                            icon: Icon(
                              size: 35,
                              color: Colors.black,
                              isPlaying && currentUrl == radio.url ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              color: Colors.black,
                              size: 35,
                              isMuted ? Icons.volume_off : Icons.volume_up,
                            ),
                            onPressed: _toggleMute,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}








// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:audioplayers/audioplayers.dart';

// import '../../../../assets.dart';
// // import 'package:islami_c13/ui/assets.dart';

// class RadioStation {
//   final int id;
//   final String name;
//   final String url;

//   RadioStation({required this.id, required this.name, required this.url});

//   factory RadioStation.fromJson(Map<String, dynamic> json) {
//     return RadioStation(
//       id: json['id'],
//       name: json['name'],
//       url: json['url'],
//     );
//   }
// }

// class RadioListScreen extends StatefulWidget {
//   @override
//   _RadioListScreenState createState() => _RadioListScreenState();
// }

// class _RadioListScreenState extends State<RadioListScreen> {
//   final Dio _dio = Dio();
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   List<RadioStation> _radios = [];
//   bool _isLoading = true;
//   bool isPlaying = false;
//   String isURL = '';
//  bool isMuted=false;

//   @override
//   void initState() {
//     super.initState();
//     fetchRadios();
//   }

//   Future<void> fetchRadios() async {
//     try {
//       final response =
//           await _dio.get('https://mp3quran.net/api/v3/radios?language=eng');
//       if (response.statusCode == 200) {
//         List<dynamic> radiosJson = response.data['radios'];
//         setState(() {
//           _radios =
//               radiosJson.map((json) => RadioStation.fromJson(json)).toList();
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Error fetching radios: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _playAudio(String url) {
//     setState(() {
//       isURL=url;
//       isPlaying = !isPlaying;
//     _audioPlayer.stop();
//     _audioPlayer.play(UrlSource(url));
//     });
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Radio Stations')),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _radios.length,
//               itemBuilder: (context, index) {
//                 final radio = _radios[index];
//                 return Container(
//                   height: 125,
//                   padding: EdgeInsets.all(15),
//                   margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(
//                             'assets/images/Mosque-02.png',
//                           ),
//                           opacity: 0.5,
//                           alignment: Alignment.bottomCenter),
//                       color: AppColors.primaryGold,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Column(
//                     children: [
//                       Text(maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                         radio.name,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 _playAudio(radio.url);
//                               },
//                               icon: Icon(size: 35,color: Colors.black,
//                                 isPlaying == true &&isURL== radio.url
//                                     ? Icons.pause
//                                     : Icons.play_arrow,
//                               )),
                         
//                             IconButton(
//                               icon: Icon(
//                                 color: Colors.black,
//                                 size: 35,

//                                 isMuted == true ? Icons.volume_off : Icons.volume_up,
//                               ),
//                               onPressed: () => {},
//                             ),
                          
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
// }

// // void main() {
// //   runApp(MaterialApp(
// //     home: RadioListScreen(),
// //   ));
// // }

// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';

// // class RadioStation {
// //   final int id;
// //   final String name;
// //   final String url;

// //   RadioStation({required this.id, required this.name, required this.url});

// //   factory RadioStation.fromJson(Map<String, dynamic> json) {
// //     return RadioStation(
// //       id: json['id'],
// //       name: json['name'],
// //       url: json['url'],
// //     );
// //   }
// // }

// // class RadioListScreen extends StatefulWidget {
// //   @override
// //   _RadioListScreenState createState() => _RadioListScreenState();
// // }

// // class _RadioListScreenState extends State<RadioListScreen> {
// //   final Dio _dio = Dio();
// //   List<RadioStation> _radios = [];
// //   bool _isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchRadios();
// //   }

// //   Future<void> fetchRadios() async {
// //     try {
// //       final response = await _dio.get('https://mp3quran.net/api/v3/radios?language=eng');
// //       if (response.statusCode == 200) {
// //         List<dynamic> radiosJson = response.data['radios'];
// //         setState(() {
// //           _radios = radiosJson.map((json) => RadioStation.fromJson(json)).toList();
// //           _isLoading = false;
// //         });
// //       }
// //     } catch (e) {
// //       print('Error fetching radios: $e');
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Radio Stations')),
// //       body: _isLoading
// //           ? Center(child: CircularProgressIndicator())
// //           : ListView.builder(
// //               itemCount: _radios.length,
// //               itemBuilder: (context, index) {
// //                 final radio = _radios[index];
// //                 return ListTile(
// //                   title: Text(radio.name),
// //                   subtitle: Text(radio.url),
// //                   onTap: () {
// //                     // Handle radio selection (e.g., open URL or play stream)
// //                   },
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: RadioListScreen(),
// //   ));
// // }
