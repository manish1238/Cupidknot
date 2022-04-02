import 'package:flutter/material.dart';

class PSButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Icon? icon;
  const PSButton(
      {Key? key, required this.text, required this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: size.height * 0.065,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? SizedBox(),
                SizedBox(
                  width: icon == null ? 0 : 10,
                ),
                Text(
                  text,
                  style:TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
