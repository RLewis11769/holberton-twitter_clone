import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  // Define property types
  final String name;
  final String username;
  final String imgUrl;
  final bool isVerified;

  const UsersSearchResultsWidget(
      {Key? key,
      required this.name,
      required this.username,
      required this.imgUrl,
      required this.isVerified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Center(
            // Only takes up 100% of its container - used for centering vertically and horizontally
            heightFactor: 1,
            child: Row(children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
                radius: 25,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  // Works with height factor to center within container
                  mainAxisSize: MainAxisSize.min,
                  // Overrides default center for text align left
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text('$name ',
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
                    ]),
                    Text('@$username',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).primaryColorLight))
                  ],
                ),
              )
            ])));
  }
}
