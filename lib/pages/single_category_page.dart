import 'package:flutter/material.dart';
import 'package:sithira_newsapp/models/article.dart';
import 'package:sithira_newsapp/services/news_service.dart';
import 'package:sithira_newsapp/widgets/news_headline_card.dart';

class SingleCategoryPage extends StatelessWidget {
  final String category;
  const SingleCategoryPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Article>>(
          future: byCategory(category),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Article> articles = snapshot.data!;
            return ListView.separated(
                itemBuilder: (context, index) {
                  Article article = articles[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsHeadlineCard(article: article),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16.0,
                  );
                },
                itemCount: articles.length);
          },
        ),
      ),
    );
  }
}
