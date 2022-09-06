import 'package:flutter/material.dart';

const textstyle1 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 20.0,
);

const textstyle2 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

const textstyle3 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);

class DataContainer extends StatelessWidget {
  DataContainer({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
            color: Colors.white,
          ),
          SizedBox(height: 15.0),
          Text(
            title,
            style: textstyle1,
          ),
        ]);
  }
}
