import 'package:flutter/material.dart';

class CardCurrency extends StatelessWidget {
  CardCurrency({
    @required this.from,
    @required this.to,
    @required this.rate,
  });

  final String from;
  final String to;
  final String rate;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        mediaQuery * .03,
        mediaQuery * .03,
        mediaQuery * .03,
        0,
      ),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: mediaQuery * .025,
            horizontal: mediaQuery * .05,
          ),
          child: Text(
            '1 $from = ${rate == null ? '?' : rate} $to',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
