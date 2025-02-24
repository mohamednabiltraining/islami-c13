import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islami_c13/ui/assets.dart';
import 'reciter_service.dart';

class ReciterListPage extends StatefulWidget {
  @override
  _ReciterListPageState createState() => _ReciterListPageState();
}

class _ReciterListPageState extends State<ReciterListPage> {
  final ReciterService _service = ReciterService();
  List<dynamic> reciters = [];
  bool isLoading = true;
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? currentPlayingUrl;
  PlayerState _playerState = PlayerState.stopped;
  Map<String, bool> isMutedMap = {};

  @override
  void initState() {
    super.initState();
    _loadReciters();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  Future<void> _loadReciters() async {
    try {
      List<dynamic> data = await _service.fetchReciters();
      setState(() {
        reciters = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading reciters: $e');
      setState(() => isLoading = false);
    }
  }

  void _togglePlayPause(String url) async {
    if (_playerState == PlayerState.playing) //currentPlayingUrl == url &&
    {
      await _audioPlayer.pause();
    } else {
      // await _audioPlayer.stop(); // Stop previous audio
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        currentPlayingUrl = url;
      });
    }
    setState(() {
      // _playerState=_playerState;
    });
  }

  void _toggleMute(String url) {
    setState(() {
      isMutedMap[url] = !(isMutedMap[url] ?? false);
      _audioPlayer.setVolume(isMutedMap[url]! ? 0.0 : 1.0);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Building ReciterListPage");

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Reciters')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: reciters.length,
              itemBuilder: (context, index) {
                final reciter = reciters[index];
                final sampleAudioUrl = _service.getSampleAudioUrl(reciter);

                return Container(
                  height: 125,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(left: 8,right: 8,bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/Mosque-02.png',),opacity: 0.5,alignment: Alignment.bottomCenter),
                    
                    color: AppColors.primaryGold,borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [Text(reciter['name'],style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                    Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (sampleAudioUrl != null) ...[
                        IconButton(
                          icon: Icon(
                            size: 35,

                            color: Colors.black,
                            currentPlayingUrl == sampleAudioUrl && _playerState == PlayerState.playing
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          onPressed: () => _togglePlayPause(sampleAudioUrl + "001.mp3"),
                        ),
                        IconButton(
                          icon: Icon(
                            color: Colors.black,
                            size: 35,

                            isMutedMap[sampleAudioUrl] == true ? Icons.volume_off : Icons.volume_up,
                          ),
                          onPressed: () => _toggleMute(sampleAudioUrl),
                        ),
                      ],
                    ],
                  ),
                    ],
                  ),
                );
                // return ListTile(
                //   title: Text(reciter['name']),
                //   subtitle: Text('عدد المصاحف: ${reciter['moshaf'].length}'),
                //   trailing: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       if (sampleAudioUrl != null) ...[
                //         IconButton(
                //           icon: Icon(
                //             currentPlayingUrl == sampleAudioUrl && _playerState == PlayerState.playing
                //                 ? Icons.pause
                //                 : Icons.play_arrow,
                //           ),
                //           onPressed: () => _togglePlayPause(sampleAudioUrl + "001.mp3"),
                //         ),
                //         IconButton(
                //           icon: Icon(
                //             isMutedMap[sampleAudioUrl] == true ? Icons.volume_off : Icons.volume_up,
                //           ),
                //           onPressed: () => _toggleMute(sampleAudioUrl),
                //         ),
                //       ],
                //     ],
                //   ),
                // );
              },
            ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'reciter_service.dart';

// class ReciterListPage extends StatefulWidget {
//   @override
//   _ReciterListPageState createState() => _ReciterListPageState();
// }

// class _ReciterListPageState extends State<ReciterListPage> {
//   final ReciterService _service = ReciterService();
//   List<dynamic> reciters = [];
//   bool isLoading = true;
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   String? currentPlayingUrl;
//   Map<String, bool> isMutedMap = {}; // Track mute state for each reciter
//   Map<String, bool> isPlayingMap = {}; // Track play/pause state for each reciter

//   @override
//   void initState() {
//     super.initState();
//     _loadReciters();
//   }

//   Future<void> _loadReciters() async {
//     try {
//       List<dynamic> data = await _service.fetchReciters();
//       setState(() {
//         reciters = data;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error loading reciters: $e');
//       setState(() => isLoading = false);
//     }
//   }

//   void _togglePlay(String url) async {
//     bool isPlaying = isPlayingMap[url] ?? false;

//     if (currentPlayingUrl == url && isPlaying == true) {
//       await _audioPlayer.pause();
//       setState(() => isPlayingMap[url] = false);
//     } else {
//       // await _audioPlayer.stop();
//       await _audioPlayer.play(UrlSource(url));
//       setState(() {
//         currentPlayingUrl = url;
//         isPlayingMap = {url: !isPlaying}; // Reset all others, keep only the current
//       });
//     }
//   }

//   void _toggleMute(String url) async {
//     bool isMuted = isMutedMap[url] ?? false;
//     await _audioPlayer.setVolume(isMuted ? 1.0 : 0.0);
//     setState(() {
//       isMutedMap[url] = !isMuted;
//     });
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: Text('Reciters')),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: reciters.length,
//               itemBuilder: (context, index) {
//                 final reciter = reciters[index];
//                 final sampleAudioUrl = _service.getSampleAudioUrl(reciter);
//                 final bool isPlaying = isPlayingMap[sampleAudioUrl] ?? false;
//                 final bool isMuted = isMutedMap[sampleAudioUrl] ?? false;

//                 return ListTile(
//                   title: Text(reciter['name']),
//                   subtitle: Text('عدد المصاحف: ${reciter['moshaf'].length}'),
//                   trailing: sampleAudioUrl != null
//                       ? Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//                               onPressed: () => _togglePlay(sampleAudioUrl + "001.mp3"),
//                             ),
//                             IconButton(
//                               icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
//                               onPressed: () => _toggleMute(sampleAudioUrl),
//                             ),
//                           ],
//                         )
//                       : null,
//                 );
//               },
//             ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'reciter_service.dart';

// // class ReciterListPage extends StatefulWidget {
// //   @override
// //   _ReciterListPageState createState() => _ReciterListPageState();
// // }

// // class _ReciterListPageState extends State<ReciterListPage> {
// //   final ReciterService _service = ReciterService();
// //   List<dynamic> reciters = [];
// //   bool isLoading = true;
// //   final AudioPlayer _audioPlayer = AudioPlayer();
// //   String? currentPlayingUrl;
// //   bool isPlaying = false;
// //   bool isMuted = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadReciters();
// //   }

// //   Future<void> _loadReciters() async {
// //     try {
// //       List<dynamic> data = await _service.fetchReciters();
// //       setState(() {
// //         reciters = data;
// //         isLoading = false;
// //       });
// //     } catch (e) {
// //       print('Error loading reciters: $e');
// //       setState(() => isLoading = false);
// //     }
// //   }

// //   void _togglePlayPause(String url) async {
// //     if (currentPlayingUrl == url && isPlaying) {
// //       await _audioPlayer.pause();
// //       setState(() => isPlaying = false);
// //     } else {
// //       // await _audioPlayer.stop();
// //       await _audioPlayer.play(UrlSource(url));
// //       setState(() {
// //         currentPlayingUrl = url;
// //         isPlaying = true;
// //       });
// //     }
// //   }

// //   void _toggleMuteUnmute() async {
// //     if (isMuted) {
// //       await _audioPlayer.setVolume(1.0);
// //     } else {
// //       await _audioPlayer.setVolume(0.0);
// //     }
// //     setState(() => isMuted = !isMuted);
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(title: Text('Reciters')),
// //       body: isLoading
// //           ? Center(child: CircularProgressIndicator())
// //           : ListView.builder(
// //               itemCount: reciters.length,
// //               itemBuilder: (context, index) {
// //                 final reciter = reciters[index];
// //                 final sampleAudioUrl = _service.getSampleAudioUrl(reciter);

// //                 return ListTile(
// //                   title: Text(reciter['name']),
// //                   subtitle: Text('عدد المصاحف: ${reciter['moshaf'].length}'),
// //                   trailing: Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       if (sampleAudioUrl != null)
// //                         IconButton(

// //                           icon: Icon(
// //                             currentPlayingUrl == sampleAudioUrl && isPlaying
// //                                 ? Icons.pause
// //                                 : Icons.play_arrow,
// //                           ),
// //                           onPressed: () {
// //                             _togglePlayPause(sampleAudioUrl + "001.mp3");
// //                           },
// //                         ),
// //                       IconButton(
// //                         icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
// //                         onPressed: _toggleMuteUnmute,
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'reciter_service.dart';

// // class ReciterListPage extends StatefulWidget {
// //   @override
// //   _ReciterListPageState createState() => _ReciterListPageState();
// // }

// // class _ReciterListPageState extends State<ReciterListPage> {
// //   final ReciterService _service = ReciterService();
// //   List<dynamic> reciters = [];
// //   bool isLoading = true;
// //   final AudioPlayer _audioPlayer = AudioPlayer();
// //   String? currentPlayingUrl;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadReciters();
// //   }

// //   Future<void> _loadReciters() async {
// //     try {
// //       List<dynamic> data = await _service.fetchReciters();
// //       setState(() {
// //         reciters = data;
// //         isLoading = false;
// //       });
// //     } catch (e) {
// //       print('Error loading reciters: $e');
// //       setState(() => isLoading = false);
// //     }
// //   }

// //   void _playAudio(String url) async {
// //   try {
// //     await _audioPlayer.stop(); // Stop any playing audio
// //     await _audioPlayer.play(UrlSource(url)); // No need to store a result
// //     setState(() {
// //       currentPlayingUrl = url;
// //     });
// //   } catch (e) {
// //     print('Error playing audio: $e');
// //   }
// // }

// //   void _stopAudio() async {
// //     await _audioPlayer.stop();
// //     setState(() {
// //       currentPlayingUrl = null;
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(title: Text('Reciters')),
// //       body: isLoading
// //           ? Center(child: CircularProgressIndicator())
// //           : ListView.builder(
// //               itemCount: reciters.length,
// //               itemBuilder: (context, index) {
// //                 final reciter = reciters[index];
// //                 final sampleAudioUrl = _service.getSampleAudioUrl(reciter);

// //                 return ListTile(
// //                   title: Text(reciter['name']),
// //                   subtitle: Text('عدد المصاحف: ${reciter['moshaf'].length}'),
// //                   trailing: sampleAudioUrl != null
// //                       ? IconButton(
// //                           icon: Icon(
// //                             currentPlayingUrl == sampleAudioUrl
// //                                 ? Icons.stop
// //                                 : Icons.play_arrow,
// //                           ),
// //                           onPressed: () {
// //                             if (currentPlayingUrl == sampleAudioUrl) {
// //                               _stopAudio();
// //                             } else {
// //                               _playAudio(sampleAudioUrl + "001.mp3"); // Sample Surah 1 (Al-Fatiha)
// //                             }
// //                           },
// //                         )
// //                       : null,
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'reciter_service.dart';

// // class ReciterListPage extends StatefulWidget {
// //   @override
// //   _ReciterListPageState createState() => _ReciterListPageState();
// // }

// // class _ReciterListPageState extends State<ReciterListPage> {
// //   final ReciterService _service = ReciterService();
// //   List<dynamic> reciters = [];
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadReciters();
// //   }

// //   Future<void> _loadReciters() async {
// //     try {
// //       List<dynamic> data = await _service.fetchReciters();
// //       setState(() {
// //         reciters = data;
// //         isLoading = false;
// //       });
// //     } catch (e) {
// //       print('Error loading reciters: $e');
// //       setState(() => isLoading = false);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Reciters')),
// //       body: isLoading
// //           ? Center(child: CircularProgressIndicator())
// //           : ListView.builder(
// //               itemCount: reciters.length,
// //               itemBuilder: (context, index) {
// //                 final reciter = reciters[index];
// //                 return ListTile(
// //                   title: Text(reciter['name']),
// //                   subtitle: Text('عدد المصاحف: ${reciter['moshaf'].length}'),
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }
