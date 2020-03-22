import 'package:flutter/material.dart';

/// This widget creates a back button with a user Avatar next to it, like WhatsApp does.
/// Given that user avatar's generally are retrieved via network calls this widget takes a String URL as the avatar and
/// passes it to a NetworkImage widget.
class AvatarBackButton extends StatelessWidget {
  /// The string version of the URL for the user's avatar
  final String avatar;

  /// This function is called when the button is pressed.
  final GestureTapCallback onPressed;

  const AvatarBackButton({
    Key key,
    this.avatar,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.arrow_back, color: Colors.white),
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
        ],
      ),
    );
  }
}
