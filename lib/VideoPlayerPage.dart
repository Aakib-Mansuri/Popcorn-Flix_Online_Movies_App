import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popcornflix/Animations/LoadingAnimation.dart';
import 'package:popcornflix/Modals/CustomURL.dart';
import 'package:popcornflix/Modals/VideoDetails.dart';
import 'package:popcornflix/Services/FetchVideos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  VideoURL url;
  VideoScreen({required this.url,Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchVideos(url: this.url).get(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            for (int i=0; i <= snapshot.data!.length; i++)
            {
                if(snapshot.data?[i].id != null)
                {
                  return VideoPlayer(video: snapshot.data![i]);
                }
            }
            return VideoPlayer(video: VdDetails(id: "xc_j6Hpj0YM",site: "YouTube"));
          }
          else{
            return LoadingAnimation();
          }
        },
    );
  }
}

class VideoPlayer extends StatefulWidget {
  VdDetails video;
  VideoPlayer({required this.video,Key? key}) : super(key: key);
  @override
  State<VideoPlayer> createState() => _VideoPlayerState(video: this.video);
}

class _VideoPlayerState extends State<VideoPlayer> {
  VdDetails video;
  late YoutubePlayerController _controller;

  _VideoPlayerState({required this.video});

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: video.id,
        flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            loop: false,
            forceHD: false,
            enableCaption: false,
            isLive: false
        )
    );
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      aspectRatio: 16/9,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.redAccent
          ),
        ),
        PlaybackSpeedButton(),
        FullScreenButton()
      ],
    );
  }
}