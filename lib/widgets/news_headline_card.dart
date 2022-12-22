import 'package:flutter/material.dart';
import 'package:sithira_newsapp/common/constants.dart';
import 'package:sithira_newsapp/common/styles.dart';
import 'package:sithira_newsapp/models/article.dart';
import 'package:sithira_newsapp/pages/single_article_page.dart';

class NewsHeadlineCard extends StatelessWidget {
  final Article article;

  const NewsHeadlineCard({
    Key? key,
    required this.article,
  }) : super(key: key);

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
        height: 235.0,
        width: 345.0,
        decoration: BoxDecoration(
            color: newsTileBackgroundGrey,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 0.0),
                blurRadius: 2,
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: article.urlToImage == null
                  ? Image.asset('assets/images/logo.png')
                  : Image.network(
                      article.urlToImage!,
                      height: 170.0,
                      width: 345.0,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title!,
                style: styleNewsTileText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
