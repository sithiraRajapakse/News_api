import 'package:flutter/material.dart';
import 'package:sithira_newsapp/common/constants.dart';
import 'package:sithira_newsapp/common/styles.dart';
import 'package:sithira_newsapp/models/article.dart';
import 'package:sithira_newsapp/pages/single_article_page.dart';

class NewsLatestCard extends StatelessWidget {
  final Article article;

  const NewsLatestCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return SingleArticlePage(article: article);
            },
          ),
        );
      },
      child: Container(
        height: 100.0,
        width: 390.0,
        decoration: BoxDecoration(
          color: backgroundGrey,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 0.0),
              blurRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(10.0),
                  bottomStart: Radius.circular(10.0),
                ),
                child: article.urlToImage == null
                    ? Image.asset('assets/images/logo.png')
                    : Image.network(
                        article.urlToImage!,
                        height: 91.0,
                        width: 103.0,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                width: 255.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(article.title ?? 'Title not found',
                      style: styleTileHeadingText),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
