import 'dart:async';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import '../utils/SizeConfig.dart';
import 'NativeAdContainer.dart';

/*
how to pass data into another screen watch this video
https://www.youtube.com/watch?v=d5PpeNb-dOY
 */

class ShayariDetailPage extends StatefulWidget {
  String message;
  int index;
  ShayariDetailPage(this.message, this.index);
  @override
  _ShayariDetailPageState createState() =>
      _ShayariDetailPageState(message, index);
}

class _ShayariDetailPageState extends State<ShayariDetailPage> {
  String message;
  int index;
  _ShayariDetailPageState(this.message, this.index);
  // Native Ad Open
  static String _adUnitID = NativeAd.testAdUnitId;
  final _nativeAdController = NativeAdmobController();
  double _height = 0;
  StreamSubscription _subscription;
  static final facebookAppEvents = FacebookAppEvents();

//Native Ad Close

  @override
  void initState() {
    super.initState();
    //Native Ad
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    //
  }

  @override
  void dispose() {
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Shayari No. ${index + 1}",
        style: Theme.of(context).appBarTheme.textTheme.headline1,
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      message,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 1.93 * SizeConfig.widthMultiplier),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                              child: Text("Share"),
                              onPressed: () {
                                print("Share Button Clicked");
                                shareText(message);
                              }),
                          // RaisedButton(
                          //     child: Text("Download"),
                          //     onPressed: () {
                          //       print("Download Button Clicked");
                          //     })
                        ],
                      ),
                    ),
                    Divider(),
                    NativeAdContainer(
                        height: _height,
                        adUnitID: _adUnitID,
                        nativeAdController: _nativeAdController),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> shareText(String message) async {
    try {
      Share.text('Share Message', message, 'text/plain');
    } catch (e) {
      print('error: $e');
    }

    facebookAppEvents.logEvent(
                        name: "Shayari Share",
                        parameters: {
                          'shayari_shared': '$message',
                        },
                      );
  }
}
