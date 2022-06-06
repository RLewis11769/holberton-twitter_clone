import 'package:flutter/material.dart';
import 'package:twitter/widgets/post_widget.dart';
import '../models/post.dart';
import '../utils/search_stream.dart';

class ShowPosts extends StatefulWidget {
  const ShowPosts({Key? key}) : super(key: key);

  @override
  State<ShowPosts> createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
        stream: getAllPosts(),
        builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final posts = snapshot.data!;
              return ListView(
                shrinkWrap: true,
                children: posts.map(
                  (post) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/Profile');
                      },
                      child: PostWidget(
                        post: post,
                      ),
                    );
                  },
                ).toList(),
              );
            } else {
              return Container();
          }
        });
  }
}
