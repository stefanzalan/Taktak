import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../widgets/details_list_item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text('Author',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor,
                    )),
                const Text('Zalán Stefán',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    )),
                const SizedBox(height: 20),
                const Text('Github',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor,
                    )),
                InkWell(
                    onTap: () => _openLinkInBrowser(
                        'https://github.com/stefanzalan/Taktak'),
                    child: const Text(
                      'stefanzalan/Taktak',
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        color: textColor,
                      ),
                    )),
                const SizedBox(height: 20),
                const Text('Features',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor,
                    )),
                const SizedBox(height: 10),
                const DetailsListItem(labelText: 'Responsive UI design'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText: 'Login & register via Firebase Authentication'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'Storing user and video data via Firestore Database'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'Storing videos and images via Firebase Storage'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'Scrollable home screen with uploaded videos and working buttons'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'Working Like, Message and Profile page buttons on the home page'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'Commenting and liking comments on the video messages page'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText: 'Elapsed time under comments on messages pages'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText: 'Search page with clickable profiles'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText: 'Video uploading via camera or gallery'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText: 'Adding details to videos before posting'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'Profile page with Following, Follower and Like counters'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'Follow, Unfollow or Sign Out functions on profile pages'),
                const SizedBox(height: 10),
                const DetailsListItem(
                    labelText:
                        'A list of related video thumbnails on profile pages'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openLinkInBrowser(String website) async {
    Uri url = Uri.parse(website);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
