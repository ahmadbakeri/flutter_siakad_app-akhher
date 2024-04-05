import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../common/widgets/big_text.dart';
import '../../common/widgets/small_text.dart';

class ItemPage extends StatefulWidget {
  final String title;
  final String description;
  final String videoId;
  const ItemPage({
    super.key,
    required this.title,
    required this.description,
    required this.videoId,
  });

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
            builder: (context, player) {
              return Column(
                children: [
                  // some widgets
                  player,
                  //some other widgets
                ],
              );
            },
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 10),
                BigText(text: widget.title),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 2,
                  color: Colors.grey[400],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: SmallText(
                        textAlign: TextAlign.justify,
                        text: widget.description,
                      ),
                    ),
                  ),
                ),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse(
                      'https://drive.google.com/file/d/18z8NfS1ZSd6Oo7vF62vUxYH3JzAsusEt/view?usp=sharing'),
                  builder: (context, followLink) {
                    return InkWell(
                      onTap: followLink,
                      child: Container(
                        height: 50,
                        color: Colors.blue[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              text: 'Download Module',
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
