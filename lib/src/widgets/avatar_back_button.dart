import 'package:flutter/material.dart';

/// {@template avatarBackButton}
/// A back button with a user Avatar built into it (like WhatsApp).
///
/// Given that user avatar's generally are retrieved via network calls, this
/// widget takes a String URL as the avatar and passes it to a NetworkImage widget.
/// {@endtemplate}
class AvatarBackButton extends StatelessWidget {
  /// {@macro avatarBackButton}
  const AvatarBackButton({
    super.key,
    required this.backButton,
    required this.avatar,
    this.onPressed,
  });

  /// The widget to serve as the back button.
  ///
  /// Typically an [Icon] widget.
  final Widget backButton;

  /// The string version of the URL for the user's avatar
  final String avatar;

  /// This function is called when the button is pressed.
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          backButton,
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
        ],
      ),
    );
  }
}
