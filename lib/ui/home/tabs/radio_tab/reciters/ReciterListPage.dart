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
    if (_playerState == PlayerState.playing)
    {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        currentPlayingUrl = url;
      });
    }
    setState(() {
      
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
               
              },
            ),
    );
  }
}
