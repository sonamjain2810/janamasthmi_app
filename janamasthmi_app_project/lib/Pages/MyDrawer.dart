import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/SizeConfig.dart';
import 'AboutUs.dart';
import 'HomePage.dart';
import 'ImagesList.dart';
import 'MessagesList.dart';

class MyDrawer extends StatefulWidget {
  static String AppName = "Happy Janamasthmi";

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String shareAppText = "Hey I have found this amazing app for you. "
      "Have a look on "
      "${MyDrawer.AppName}"
      " Url: ${AppUrl()}";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.primaryVariant,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 19 * SizeConfig.widthMultiplier,
                  backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/profile_images/1158115409993691138/wABb5ZLe_400x400.jpg'),
                  backgroundColor: Theme.of(context).iconTheme.color,
                ),
                accountName: Text("GJOneStudio"),
                accountEmail: Text("gj1studio@gmail.com")),
            Container(
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.home,
                          color: Theme.of(context).iconTheme.color),
                      title: Text("Home Page"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryIconTheme.color),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                      }),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.format_quote,
                        color: Theme.of(context).iconTheme.color),
                    title: Text("Quotes"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => MessagesList()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.image,
                        color: Theme.of(context).iconTheme.color),
                    title: Text("Images"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => ImagesList()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info,
                        color: Theme.of(context).iconTheme.color),
                    title: Text("About Developer"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      //interstitialTag = "about";
                      Navigator.of(context).pop();

                      //_interstitialAd.isLoaded() != null
                      //  ? _interstitialAd?.show()
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AboutUs()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.feedback,
                        color: Theme.of(context).iconTheme.color),
                    title: Text("Submit Feedback"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () async {
                      Navigator.of(context).pop();
                      print("Feedback Button Clicked");
                      const url = 'mailto:sonamjain2810@yahoo.com'
                          '?subject=feedback%20from%20Happy%20Birthday%20Wishes&body=Your%20Apps%20Rocks!!';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.more,
                        color: Theme.of(context).iconTheme.color),
                    title: Text("Other Apps"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      if (Platform.isAndroid) {
                        // Android-specific code
                        print("More Button Clicked");
                        launch(
                            "https://play.google.com/store/apps/developer?id=Festival+Messages+SMS");
                      } else if (Platform.isIOS) {
                        // iOS-specific code
                        print("More Button Clicked");
                        launch(
                            "https://apps.apple.com/us/developer/sonam-jain/id1440118616");

                        
                      }
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.rate_review,
                        color: Theme.of(context).iconTheme.color),
                    title: Text("Rate This App"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      launch(AppUrl());
                    },
                  ),
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.share,
                          color: Theme.of(context).iconTheme.color),
                      title: Text("Share App"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryIconTheme.color),
                      onTap: () {
                        print("Share Button Clicked");
                        Navigator.of(context).pop();
                        final RenderBox box = context.findRenderObject();
                        Share.share(
                          shareAppText,
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size,
                        );
                      }),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.close,
                        color: Theme.of(context).iconTheme.color),
                    title: Text("Close"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String AppUrl() {
  String url;
  if (Platform.isAndroid) {
    print("Android Platform");
    url =
        "https://play.google.com/store/apps/details?id=com.rrj_psj.good_morning_sms";
  } else if (Platform.isIOS) {
    print("iOS Platform");
    url = "https://apps.apple.com/us/app/-/id1523619788";
  }
  return url;
}
