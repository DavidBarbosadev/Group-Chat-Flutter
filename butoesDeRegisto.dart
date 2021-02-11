import 'package:flutter/material.dart';
class butoesDeRegisto extends StatelessWidget {
  butoesDeRegisto(
      {@required this.cor, @required this.onPress, @required this.title});

  final Color cor;
  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: cor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          //Go to login screen
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}