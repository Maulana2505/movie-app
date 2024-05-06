import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeWidget extends StatefulWidget {
  final String ytkey;
  const YoutubeWidget({super.key, required this.ytkey});

  @override
  State<YoutubeWidget> createState() => _YoutubeWidgetState();
}

class _YoutubeWidgetState extends State<YoutubeWidget> {
  late final YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    // TODO: implement initState
    _youtubePlayerController = YoutubePlayerController(
        initialVideoId: widget.ytkey,
        flags: YoutubePlayerFlags(
            autoPlay: true, enableCaption: true));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft
        ]);
      },
      onExitFullScreen: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.bottom,SystemUiOverlay.top]);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      },
      player: YoutubePlayer(controller: _youtubePlayerController),
      builder: (p0, player) => player,
    );
  }
}
