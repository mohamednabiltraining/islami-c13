// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class AudioPlayerWidget extends StatefulWidget {
//   final String url;

//   const AudioPlayerWidget({Key? key, required this.url}) : super(key: key);

//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }

// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   bool isMuted = false;

//   void _togglePlayPause() async {
//     if (isPlaying) {
//       await _audioPlayer.pause();
//     } else {
//       await _audioPlayer.play(UrlSource(widget.url));
//     }
//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   void _toggleMuteUnmute() async {
//     if (isMuted) {
//       await _audioPlayer.setVolume(1.0); // Unmute
//     } else {
//       await _audioPlayer.setVolume(0.0); // Mute
//     }
//     setState(() {
//       isMuted = !isMuted;
//     });
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose(); // Dispose player when widget is destroyed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//           onPressed: _togglePlayPause,
//         ),
//         IconButton(
//           icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
//           onPressed: _toggleMuteUnmute,
//         ),
//       ],
//     );
//   }
// }
