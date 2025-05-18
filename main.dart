
import 'package:flutter/material.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق الأفلام',
      theme: ThemeData.dark(),
      home: MovieHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MovieHomePage extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      "title": "فيلم الأكشن",
      "image": "https://via.placeholder.com/300x150.png?text=Movie+1",
      "videoUrl": "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
    },
    {
      "title": "فيلم رومانسي",
      "image": "https://via.placeholder.com/300x150.png?text=Movie+2",
      "videoUrl": "https://samplelib.com/lib/preview/mp4/sample-10s.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🎬 تطبيق الأفلام')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var movie = movies[index];
          return Card(
            child: ListTile(
              leading: Image.network(movie['image']!),
              title: Text(movie['title']!),
              trailing: Icon(Icons.play_circle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetailPage(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final Map<String, String> movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['title']!)),
      body: Column(
        children: [
          Image.network(movie['image']!),
          SizedBox(height: 20),
          Text(
            "وصف الفيلم هنا...",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("▶️ مشاهدة الفيلم"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MoviePlayerPage(videoUrl: movie['videoUrl']!),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class MoviePlayerPage extends StatelessWidget {
  final String videoUrl;

  MoviePlayerPage({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("📺 تشغيل الفيلم")),
      body: Center(
        child: Text(
          "هنا راح نضيف مشغل الفيديو لاحقًا 🎥",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
