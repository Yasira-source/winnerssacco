
import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const DefaultButton({
    Key key, this.btnText,  this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        color: const Color(0xffC2151C),
        textColor: const Color(0xFFFFFFFF),
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        child: Text(btnText.toUpperCase()),
      ),
    );
  }
}