import 'package:flutter/material.dart';
import 'package:knowit/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;
  final String newsCnt;

  NewsContainer({
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 81, 0, 125), Colors.white],
        ),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  placeholder: "assets/img/placeholder.jpg",
                  image: imgUrl,
                ),
                SizedBox(height: 20),
                Text(
                  newsHead.length > 90
                      ? "${newsHead.substring(0, 90)}..."
                      : newsHead,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  newsDes,
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
                SizedBox(height: 10),
                Text(
                  newsCnt != ""
                      ? newsCnt.length > 250
                          ? "${newsCnt.substring(0, 0)}..."
                          : newsCnt
                      : newsCnt,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailViewScreen(newsUrl: newsUrl),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(22), // Button border radius
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 18), // Vertical padding inside the button
                      ),
                      child: Text(
                        "Read More",
                        style: TextStyle(
                            fontSize: 12), // Text style for the button text
                      ),
                    ),
                  ],
                ),
                Center(
                  child: TextButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse("https://newsapi.org/"));
                    },
                    child: Text(
                      "NewsAPI.org",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
