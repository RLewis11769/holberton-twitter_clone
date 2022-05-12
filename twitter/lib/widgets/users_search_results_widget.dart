import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  // Define property types
  final String name;
  final String username;
  String imgUrl = '../assets/username.png';

  UsersSearchResultsWidget(
      {Key? key,
      required this.name,
      required this.username,
      required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        // Only takes up 100% of its container - used for centering vertically and horizontally
        heightFactor: 1,
        child: Row(
            // Minimum width of the container - allows for centering
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.clipartmax.com/png/full/5-55403_blank-avatar-profile-pic-icon-female.png'),
                radius: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  // Works with height factor to center within container
                  mainAxisSize: MainAxisSize.min,
                  // Overrides default center for text align left
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text('@$username',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).primaryColorLight))
                  ],
                ),
              )
            ]));
  }
}
