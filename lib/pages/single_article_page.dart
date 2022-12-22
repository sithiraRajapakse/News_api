import 'package:flutter/material.dart';
import 'package:sithira_newsapp/common/constants.dart';
import 'package:sithira_newsapp/common/styles.dart';
import 'package:sithira_newsapp/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleArticlePage extends StatelessWidget {
  final Article article;
  const SingleArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title!.substring(0, 50)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            article.title!,
            style: styleDrawerHeadingText,
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 16.0,
          ),
          ClipRRect(
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(10.0)),
            child: article.urlToImage == null
                ? Image.asset('assets/images/logo.png')
                : Image.network(
                    article.urlToImage!,
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            article.description!,
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Source: ${article.source!.name!}',
            style: const TextStyle(fontSize: 16.0, height: 1.5),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 16.0,
          ),
          SizedBox(
            height: 48.0,
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              color: blue,
              onPressed: () {
                launchUrl(Uri.parse(article.url!));
              },
              child: const Text(
                'Read Full Article',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
