import 'package:flutter/material.dart';
import 'package:sithira_newsapp/common/constants.dart';
import 'package:sithira_newsapp/common/styles.dart';
import 'package:sithira_newsapp/models/article.dart';
import 'package:sithira_newsapp/pages/single_category_page.dart';
import 'package:sithira_newsapp/services/news_service.dart';
import 'package:sithira_newsapp/widgets/heading.dart';
import 'package:sithira_newsapp/widgets/news_headline_card.dart';
import 'package:sithira_newsapp/widgets/news_latest_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLASH NEWS'),
        elevation: 0.0,
      ),
      drawer: Drawer(
        backgroundColor: drawerBackgroundWhite,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 0.0),
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 98.0,
                height: 70.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Categories',
                style: styleDrawerHeadingText,
              ),
            ),
            ListTile(
              title: const Text('SPORTS'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleCategoryPage(category: 'sports');
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('HEALTH'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleCategoryPage(category: 'health');
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('BUSINESS'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleCategoryPage(category: 'business');
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('ENTERTAINMENT'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleCategoryPage(category: 'entertainment');
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('TECHNOLOGY'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleCategoryPage(category: 'technology');
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('GENERAL'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleCategoryPage(category: 'general');
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading(text: 'Hot News'),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 270.0,
                child: FutureBuilder<List<Article>>(
                  future: getHeadlines(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    List<Article> articles = snapshot.data!;
                    return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Article article = articles[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewsHeadlineCard(article: article),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10.0,
                          );
                        },
                        itemCount: articles.length);
                  },
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Heading(text: 'Latest News'),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: FutureBuilder<List<Article>>(
                  future: latest(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      print(snapshot.data);
                    }

                    List<Article> articles = snapshot.data!;

                    return ListView.separated(
                        itemBuilder: (context, index) {
                          Article article = articles[index];

                          return NewsLatestCard(
                            article: article,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10.0,
                          );
                        },
                        itemCount: articles.length);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
