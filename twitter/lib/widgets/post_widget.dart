import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  // Define property types
  final String name;
  final String username;
  final String imgUrl;
  final bool isVerified;
  final String postText;

// Constructor - all properties must be passed
  const PostWidget(
      {Key? key,
      required this.name,
      required this.username,
      required this.imgUrl,
      required this.isVerified,
      required this.postText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        // Looks really similar to users_search_results_widget for first part
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Center(
                // Center centers horizontally and vertically by default
                // Not centered vertically with heightFactor - Only takes up 100% of container height
                heightFactor: 1,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(imgUrl),
                        radius: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          // mainAxisSize works with height factor to center within container
                          mainAxisSize: MainAxisSize.min,
                          // Overrides default center for text align left
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // 3 Text widgets all in row
                              children: [
                                SizedBox(
                                  // Flexible or Expanded would be better than SizedBox!
                                  // But implementing either causes entire Row to disappear?
                                  // If name does not fade, width makes checkmark too far away
                                  width: 100,
                                  child: Text(name,
                                      // Ellipsis would probably be best - but fades out name instead
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                ),
                                // If verified, add checkmark - else do nothing
                                if (isVerified)
                                  Icon(
                                    Icons.check_circle,
                                    color: Theme.of(context).primaryColor,
                                    size: 15,
                                  ),
                                SizedBox(
                                  // Fades name if too long based on specified width
                                  width: 125,
                                  child: Text('   @$username',
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColorLight)),
                                ),
                                Text('   2m',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColorLight)),
                              ],
                            ),
                            // Separates in appearance from users_search_results_widget starting here
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: SizedBox(
                                  width: 250,
                                  child: Text(postText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2)),
                            )
                          ],
                        ),
                      ),
                    ]),
              )),
          Container(
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
                              .copyWith(
                                  color: Theme.of(context).primaryColorLight))
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
                              .copyWith(
                                  color: Theme.of(context).primaryColorLight))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite, size: 20, color: Colors.pink[600]),
                      Text('  2',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.pink[600]))
                    ],
                  ),
                  // Share icon is by itself so no need to wrap in row
                  Icon(Icons.share, color: Theme.of(context).primaryColorLight),
                ],
              ))
        ]);
  }
}
