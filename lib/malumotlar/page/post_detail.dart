import 'package:flutter/material.dart';
import 'package:loggy/malumotlar/provider.dart';
import 'package:provider/provider.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Post')),
      body: FutureBuilder(
        future: postProvider.fetchPosts(),
        builder: (context, snapshot) {
          return Consumer<PostProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: provider.posts.length,
                itemBuilder: (context, index) {
                  final post = provider.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
