import 'package:flutter/material.dart';
import '../screens/edit_profile_screen.dart';

class EditProfileButton extends StatefulWidget {
  final String userID;
  const EditProfileButton({Key? key, required this.userID}) : super(key: key);

  @override
  State<EditProfileButton> createState() => _EditProfileButtonState();
}

class _EditProfileButtonState extends State<EditProfileButton> {
  @override
  Widget build(BuildContext context) {
    String userID = widget.userID;

    return Align(
      // Puts button to right of screen by 80%
      alignment: const Alignment(0.8, 0),
      child: OutlinedButton(
        // Outlined button with rounded corners
        style: OutlinedButton.styleFrom(
          primary: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          side:
              BorderSide(color: Theme.of(context).primaryColorLight, width: 1),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfileScreen(
                        userID: userID,
                      )));
        },
        // Text of outlined button
        child: Text(
          'Edit Profile',
          style: Theme.of(context)
                      .textTheme
                      .bodyText2!
        ),
      ),
    );
  }
}
