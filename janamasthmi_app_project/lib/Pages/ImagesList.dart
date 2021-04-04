import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';

import '../utils/SizeConfig.dart';
import 'ImageDetailPage.dart';

class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  static final facebookAppEvents = FacebookAppEvents();

  var data = [
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/1.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/2.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/3.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/4.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/5.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/6.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/7.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/8.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/9.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/10.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/11.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/12.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/13.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/14.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/15.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/16.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/17.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/18.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/19.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/20.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/21.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/22.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/23.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/24.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/25.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/26.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/27.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/28.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/29.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/30.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/31.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/32.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/33.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/35.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/36.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/37.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/38.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/39.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/40.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/41.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/42.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/43.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/44.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/45.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/46.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/47.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/48.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/49.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/50.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/51.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/52.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/53.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/54.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/55.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/56.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/57.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/58.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/59.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/60.jpg",
    "http://www.andiwiniosapps.in/janmashtami_message/janmashtami_images/61.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Images",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: data != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Padding(
                        padding:
                            EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),
                        child: ListTile(
                          title: CachedNetworkImage(
                            imageUrl: data[index],
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                                  
                                ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fadeOutDuration: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 3),
                          ),
                          
                          /*Image.network(
                            data[index],
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace)
                            {
                              
                              return Center(
                                child: CircularProgressIndicator(
                                  value: 0.45,
                                ),
                              );
                            
                            }
                          ),*/
                          
                          
                        ),
                      ),
                      onTap: () {
                        print("Click on Image Grid item $index");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    ImageDetailPage(data[index], index)));

                        facebookAppEvents.logEvent(
                          name: "Image List",
                          parameters: {
                            'clicked_on_jpeg_image_index': '$index',
                          },
                        );
                      });
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
