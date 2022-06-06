import 'package:flutter/material.dart';
import '../models/post.dart';

class CommentRetweetLikeBar extends StatefulWidget {
  final Post post;
  const CommentRetweetLikeBar({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentRetweetLikeBar> createState() => _CommentRetweetLikeBarState();
}

class _CommentRetweetLikeBarState extends State<CommentRetweetLikeBar> {
  @override
  Widget build(BuildContext context) {
    int likeCount = widget.post.likeCount;

    return Container(
        // Tweet info bar under tweet iself rather than pic included, so need to add padding
        // When put into Row with tweet info above, mainAxisAlignment remained at start - idk why
        padding: const EdgeInsets.fromLTRB(75, 0, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              // Each icon is associated with number of comments etc so wrap together in row
              children: [
                Icon(Icons.chat_bubble_outline,
                    size: 20, color: Theme.of(context).primaryColorLight),
                Text('  0',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).primaryColorLight))
              ],
            ),
            Row(
              children: [
                Icon(Icons.replay,
                    size: 20, color: Theme.of(context).primaryColorLight),
                Text('  0',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).primaryColorLight))
              ],
            ),Row(
                children: [
                  // If user has not liked this post, heart should be gray and unfilled
                  // When user likes, heart should be filled and pink
                  likeCount == 0
                      ? Icon(Icons.favorite_outline,
                          size: 20, color: Theme.of(context).primaryColorLight)
                      : const Icon(Icons.favorite,
                          size: 20, color: Colors.pink),
                  likeCount == 0
                      ? Text('  ${widget.post.likeCount}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Theme.of(context).primaryColorLight))
                      : Text('  ${widget.post.likeCount}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.pink)),
                ]),
            // Share icon is by itself so no need to wrap in row
            Icon(Icons.share, color: Theme.of(context).primaryColorLight),
          ],
        ));
  }
}
