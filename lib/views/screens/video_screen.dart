import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/video_controller.dart';
import '../widgets/circle_animation.dart';
import '../widgets/video_player_item.dart';
import 'comment_screen.dart';
import 'profile_screen.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

  buildProfile(context, String profilePhoto, String uid) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(uid: uid),
        ),
      ),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: textColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  buildMusicAlbum(context, String profilePhoto, String uid) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(uid: uid),
        ),
      ),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(11),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        buttonColor,
                        textColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(
                    image: NetworkImage(profilePhoto),
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(
                  videoUrl: data.videoUrl,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    data.username,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    data.caption,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        size: 15,
                                        color: textColor,
                                      ),
                                      Text(
                                        data.songName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: textColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: size.height / 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildProfile(
                                  context,
                                  data.profilePhoto,
                                  data.uid,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          videoController.likeVideo(data.id),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: data.likes.contains(
                                                authController.user.uid)
                                            ? buttonColor
                                            : textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.likes.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CommentScreen(
                                            id: data.id,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.comment,
                                        size: 40,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.commentCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          videoController.shareVideo(data.id),
                                      child: const Icon(
                                        Icons.share,
                                        size: 40,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.shareCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                      ),
                                    )
                                  ],
                                ),
                                CircleAnimation(
                                  child: buildMusicAlbum(
                                    context,
                                    data.profilePhoto,
                                    data.uid,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
