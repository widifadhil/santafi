import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']), // Use the map to access title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(article['imageUrl']),
            SizedBox(height: 16),
            Text(
              article['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              article['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Category: ${article['category']}",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "Published on: ${article['publishDate']}",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.visibility),
                SizedBox(width: 8),
                Text('${article['readCount']} reads'),
              ],
            ),
            // Add more details or styles as needed
          ],
        ),
      ),
    );
  }
}
