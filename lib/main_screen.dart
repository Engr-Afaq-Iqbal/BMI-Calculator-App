import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Color(
          0xFFffffff,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ContainerBox(
                boxColor: Colors.blue,
                childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Male',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 20.0,
                        ),
                      ),
                    ]),
              )),
              Expanded(
                  child: ContainerBox(
                boxColor: Color(0xFFffffff),
                childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Female',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 20.0,
                        ),
                      ),
                    ]),
              )),
            ],
          )),
          Expanded(
              child: ContainerBox(
            boxColor: Color(0xFFffffff),
            childWidget: Column(children: [Text('Height')]),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ContainerBox(
                boxColor: Color(0xFFffffff),
                childWidget: Column(children: [Text('Weight')]),
              )),
              Expanded(
                  child: ContainerBox(
                boxColor: Color(0xFFffffff),
                childWidget: Column(children: [Text('Age')]),
              )),
            ],
          )),
        ],
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  ContainerBox({required this.boxColor, required this.childWidget});
  final Color boxColor;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: boxColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7.0,
              spreadRadius: 5.0,
              offset: Offset(0, 3),
            )
          ]),
    );
  }
}
