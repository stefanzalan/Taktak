import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: backgroundColor,
              centerTitle: true,
              title: Text(
                controller.user['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: controller.user['profilePhoto'],
                                  height: 200,
                                  width: 200,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    controller.user['following'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Following',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: textColor,
                                width: 1,
                                height: 15,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    controller.user['followers'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Followers',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: textColor,
                                width: 1,
                                height: 15,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    controller.user['likes'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Likes',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 140,
                            height: 47,
                            decoration: const BoxDecoration(
                              color: buttonColor,
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  if (widget.uid == authController.user.uid) {
                                    authController.signOut();
                                  } else {
                                    controller.followUser();
                                  }
                                },
                                child: Text(
                                  widget.uid == authController.user.uid
                                      ? 'Sign Out'
                                      : controller.user['isFollowing']
                                          ? 'Unfollow'
                                          : 'Follow',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            controller.user['thumbnails'].length > 0
                                ? 'Videos'
                                : '',
                            style:
                                const TextStyle(color: textColor, fontSize: 15),
                          ),
                          const SizedBox(height: 15),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.user['thumbnails'].length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  controller.user['thumbnails'].length == 1
                                      ? 1
                                      : 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) {
                              String thumbnail =
                                  controller.user['thumbnails'][index];
                              return CachedNetworkImage(
                                imageUrl: thumbnail,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
