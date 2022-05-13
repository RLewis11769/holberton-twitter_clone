import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  // Define property types
  final String name;
  final String username;
  final String imgUrl;
  final bool isVerified;
  final String postText;
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
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Center(
                // Only takes up 100% of its container rather than entire space available
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
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // Works with height factor to center within container
                          mainAxisSize: MainAxisSize.min,
                          // Overrides default center for text align left
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(name,
                                    // softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                if (isVerified)
                                  Icon(
                                    Icons.check_circle,
                                    color: Theme.of(context).primaryColor,
                                    size: 15,
                                  ),
                                Text('  @$username  ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColorLight)),
                                Text('2m',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColorLight)),
                              ],
                            ),
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
              // Forgot to make sure tweet info bar under tweet iself rather than pic included, so need to add padding
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
                  Icon(Icons.share, color: Theme.of(context).primaryColorLight),
                ],
              ))
        ]);
  }
}
