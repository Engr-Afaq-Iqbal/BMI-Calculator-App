import 'package:flutter/material.dart';

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
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(child: ContainerBox()),
              Expanded(child: ContainerBox()),
            ],
          )),
          Expanded(child: ContainerBox()),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(child: ContainerBox()),
              Expanded(child: ContainerBox()),
            ],
          )),
        ],
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  const ContainerBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFffffff),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7.0,
              spreadRadius: 5.0,
              offset: Offset(0, 3),
            )
          ]),
    );
  }
}
