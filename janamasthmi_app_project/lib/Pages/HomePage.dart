// Package Name : top.latest.birthday.wishes.shayari.quotes.messages.images.gif.videos.creator
import 'dart:async';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import '../utils/SizeConfig.dart';
import 'AboutUs.dart';
import 'GifsImages.dart';
import 'ImagesList.dart';
import 'MemeGenerator.dart';
import 'MessagesList.dart';
import 'MyDrawer.dart';
import 'NativeAdContainer.dart';
import 'ShayariList.dart';

// Height = 8.96
// Width = 4.14

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const String testDevice = 'c835aea0489176f272e2d174b8d921ca';
// const String testDevice = 'testDeviceId';

class _HomePageState extends State<HomePage> {
  static final facebookAppEvents = FacebookAppEvents();
  String interstitialTag = "";

// Native Ad Open
  static String _adUnitID = NativeAd.testAdUnitId;

  final _nativeAdController = NativeAdmobController();
  double _height = 0;

  StreamSubscription _subscription;

//Native Ad Close

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    //keywords: Keywords.adsKeywords,
    //contentUrl: 'http://foo.com/bar.html',
    childDirected: false,
    nonPersonalizedAds: true,
  );

  InterstitialAd _interstitialAd;

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
        if (event == MobileAdEvent.closed) {
          _interstitialAd = createInterstitialAd()..load();

          if (interstitialTag != null) {
            switch (interstitialTag) {
              case "message":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MessagesList()));
                break;
              case "gif":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => GifsImages()));
                break;

              case "image":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ImagesList()));
                break;

              case "shayari":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ShayariList()));
                break;

              case "meme":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MemeGenerator()));
                break;

              case "about":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
                break;
              default:
            }
          }
        } else if (event == MobileAdEvent.failedToLoad) {
          if (interstitialTag != null) {
            switch (interstitialTag) {
              case "message":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MessagesList()));
                break;
              case "gif":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => GifsImages()));
                break;

              case "image":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ImagesList()));
                break;

              case "shayari":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ShayariList()));
                break;

              case "meme":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MemeGenerator()));
                break;

              case "about":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
                break;
              default:
            }
          }
        } else {
          print(event.toString());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);

    _interstitialAd?.dispose();
    _interstitialAd = createInterstitialAd()..load();

    //Native Ad
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    //
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    //Native Ad
    _subscription.cancel();
    _nativeAdController.dispose();
    super.dispose();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height = 36.83 * SizeConfig.heightMultiplier;
        });
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _top(),
            SizedBox(
              //8
              height: 0.90 * SizeConfig.heightMultiplier,
            ),
            Padding(
              //16.0
              padding: EdgeInsets.all(3.86 * SizeConfig.widthMultiplier),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Catergory",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  // Text(
                  //   "View All",
                  //   style: Theme.of(context).textTheme.subtitle1,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 2.23 * SizeConfig.heightMultiplier,
            ),
            Container(
              //200
              height: 33.5 * SizeConfig.heightMultiplier,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 2),
                children: <Widget>[
                  InkWell(
                    child: _gridItem('assets/1.jpg', "Messages"),
                    onTap: () {
                      print("Messages Clicked");
                      interstitialTag = "message";
                      facebookAppEvents.logEvent(
                        name: "Message List",
                        parameters: {
                          'button_id': 'message_button',
                        },
                      );
                      _interstitialAd.isLoaded() != null
                          ? _interstitialAd?.show()
                          : Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MessagesList()));
                    },
                  ),
                  InkWell(
                    child: _gridItem("assets/3.gif", "Gifs"),
                    onTap: () {
                      print("Gifs Clicked");
                      interstitialTag = "gif";
                      facebookAppEvents.logEvent(
                        name: "GIF List",
                        parameters: {
                          'button_id': 'gif_button',
                        },
                      );

                      _interstitialAd.isLoaded() != null
                          ? _interstitialAd?.show()
                          : Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => GifsImages()));
                    },
                  ),
                  InkWell(
                    child: _gridItem("assets/2.jpg", "Images"),
                    onTap: () {
                      print("Images Clicked");
                      interstitialTag = "image";
                      facebookAppEvents.logEvent(
                        name: "Image List",
                        parameters: {
                          'button_id': 'Image_button',
                        },
                      );

                      _interstitialAd.isLoaded() != null
                          ? _interstitialAd?.show()
                          : Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => ImagesList()));
                    },
                  ),
                  InkWell(
                    child: _gridItem("assets/4.jpg", "Shayari"),
                    onTap: () {
                      print("Shayari Clicked");
                      interstitialTag = "shayari";
                      facebookAppEvents.logEvent(
                        name: "Shayari List",
                        parameters: {
                          'button_id': 'Shayari_button',
                        },
                      );
                      _interstitialAd.isLoaded() != null
                          ? _interstitialAd?.show()
                          : Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ShayariList()));
                    },
                  ),
                  InkWell(
                    child: _gridItem("assets/5.jpg", "Wish Maker"),
                    onTap: () {
                      print("Meme Clicked");
                      interstitialTag = "meme";
                      facebookAppEvents.logEvent(
                        name: "Meme List",
                        parameters: {
                          'button_id': 'Meme_button',
                        },
                      );

                      _interstitialAd.isLoaded() != null
                          ? _interstitialAd?.show()
                          : Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MemeGenerator()));
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            NativeAdContainer(
                height: _height,
                adUnitID: _adUnitID,
                nativeAdController: _nativeAdController),
            Divider(),
            Padding(
              padding: EdgeInsets.all(3.86 * SizeConfig.widthMultiplier),
              child: Row(
                children: <Widget>[
                  Text(
                    "Latest",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            InkWell(
              child: _cardItem(
                  "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_gifs/16.gif",
                  "Cute Kanha\nGifs",
                  "31 Items"),
              onTap: () {
                print("Gifs Clicked");
                interstitialTag = "gif";
                facebookAppEvents.logEvent(
                  name: "GIF List",
                  parameters: {
                    'button_id': 'gif_button',
                  },
                );
                _interstitialAd.isLoaded() != null
                    ? _interstitialAd?.show()
                    : Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => GifsImages()));
              },
            ),
            Divider(),
            InkWell(
              child: _cardItem(
                  "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/12.jpg",
                  "Janmashtami Krishna\nImages",
                  "61 Items"),
              onTap: () {
                print("Images Clicked");
                interstitialTag = "image";
                facebookAppEvents.logEvent(
                  name: "Image List",
                  parameters: {
                    'button_id': 'Image_button',
                  },
                );

                _interstitialAd.isLoaded() != null
                    ? _interstitialAd?.show()
                    : Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => ImagesList()));
              },
            ),
            Divider(),
            InkWell(
              child: _cardItem(
                  "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/20.jpg",
                  "Janmashtami Shayari",
                  "62 Items"),
              onTap: () {
                print("Shayari Clicked");
                interstitialTag = "shayari";
                facebookAppEvents.logEvent(
                  name: "Shayari List",
                  parameters: {
                    'button_id': 'Shayari_button',
                  },
                );
                // _interstitialAd.isLoaded() != null
                //     ? _interstitialAd?.show()
                //     : 
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => ShayariList()));
              },
            ),
            Divider(),
            InkWell(
              child: _cardItem(
                  "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/61.jpg",
                  "Janmashtami Wishes\n Messages",
                  "81 Items"),
              onTap: () {
                print("Messages Clicked");
                interstitialTag = "message";
                facebookAppEvents.logEvent(
                  name: "Message List",
                  parameters: {
                    'button_id': 'message_button',
                  },
                );
                // _interstitialAd.isLoaded() != null
                //     ? _interstitialAd?.show()
                //     : 
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => MessagesList()));
              },
            ),
            Divider(),
            NativeAdContainer(
                height: _height,
                adUnitID: _adUnitID,
                nativeAdController: _nativeAdController),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.all(3.86 * SizeConfig.widthMultiplier),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryVariant,
        borderRadius: BorderRadius.only(
          //30
          bottomLeft: Radius.circular(3.35 * SizeConfig.heightMultiplier),
          bottomRight: Radius.circular(3.35 * SizeConfig.heightMultiplier),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1158115409993691138/wABb5ZLe_400x400.jpg'),
                  ),
                  SizedBox(
                    width: 1.93 * SizeConfig.widthMultiplier,
                  ),
                  Text(
                    "Hello, User",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              // IconButton(
              //   icon: Icon(Icons.notifications,
              //       color: Theme.of(context).primaryIconTheme.color),
              //   onPressed: () {},
              // ),
            ],
          ),
          SizedBox(
            height: 3.35 * SizeConfig.heightMultiplier,
          ),
          Text(
            "Namaste, Have a look on Messages, Images, Shayari, Gifs & Wish Maker below for Your Love Ones.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.yellow),
          ),
        ],
      ),
    );
  }

  _gridItem(String str, text) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: MediaQuery.of(context).size.width / 6,
          backgroundImage: AssetImage(str),
          //Icon(icon,
          //size: 3.86*SizeConfig.widthMultiplier, color: Theme.of(context).primaryIconTheme.color),
          backgroundColor:
              Theme.of(context).colorScheme.primaryVariant.withOpacity(0.75),
        ),
        SizedBox(height: 1.12 * SizeConfig.heightMultiplier),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  _cardItem(image, title, subTitle) {
    return ImageTextHorizontalWidget(context: context, imageUrl: image, title: title,subTitle: subTitle);
  }
}

class ImageTextHorizontalWidget extends StatelessWidget {
  const ImageTextHorizontalWidget({
    Key key,
    @required this.context,
    @required this.imageUrl,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);

  final BuildContext context;
  final String imageUrl,title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.86 * SizeConfig.widthMultiplier),
      child: Row(
        children: <Widget>[
          Container(
            width: 24.15 * SizeConfig.widthMultiplier,
            height: 11.16 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius:
                  BorderRadius.circular(2.23 * SizeConfig.heightMultiplier),
            ),
          ),
          SizedBox(
            //20
            width: 4.83 * SizeConfig.widthMultiplier,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  maxLines: 2, style: Theme.of(context).textTheme.headline1),
              SizedBox(
                height: 1.12 * SizeConfig.heightMultiplier,
              ),
              Text(subTitle, style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ],
      ),
    );
  }
}
