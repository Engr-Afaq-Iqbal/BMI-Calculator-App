import 'dart:math';

import 'package:flutter/material.dart';
import './container_box.dart';
import './data_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xff0073dd);
const inactiveColor = Color(0xFF212121);
int height = 180;
int weight = 70;
int age = 25;
String result = "";
String resultDetail = "Here is your BMI result";
double bmi = 0;

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inactiveColor;
  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inactiveColor) {
        femaleBoxColor = inactiveColor;
        maleBoxColor = activeColor;
      } else {
        femaleBoxColor = activeColor;
        maleBoxColor = inactiveColor;
      }
    } else {
      if (femaleBoxColor == inactiveColor) {
        maleBoxColor = inactiveColor;
        femaleBoxColor = activeColor;
      } else {
        femaleBoxColor = inactiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculate_bmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    print(bmi);
    print(bmi.toStringAsFixed(1));
    return bmi.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
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
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(1);
                      });
                    },
                    child: ContainerBox(
                      boxColor: maleBoxColor,
                      childWidget: DataContainer(
                        title: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    )),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateBoxColor(2);
                  });
                },
                child: ContainerBox(
                  boxColor: femaleBoxColor,
                  childWidget: DataContainer(
                    title: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              )),
            ],
          )),
          Expanded(
              child: ContainerBox(
            boxColor: inactiveColor,
            childWidget:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Height',
                style: textstyle1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: textstyle2,
                  ),
                  Text(
                    'cm',
                    style: textstyle1,
                  )
                ],
              ),
              Slider(
                value: height.toDouble(),
                min: 120,
                max: 220,
                inactiveColor: inactiveColor,
                activeColor: activeColor,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                },
              )
            ]),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ContainerBox(
                boxColor: inactiveColor,
                childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: textstyle1,
                      ),
                      Text(
                        weight.toString(),
                        style: textstyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.small(
                            child: Icon(FontAwesomeIcons.minus),
                            backgroundColor: activeColor,
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton.small(
                              child: Icon(FontAwesomeIcons.plus),
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              })
                        ],
                      )
                    ]),
              )),
              Expanded(
                  child: ContainerBox(
                boxColor: inactiveColor,
                childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: textstyle1,
                      ),
                      Text(
                        age.toString(),
                        style: textstyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.small(
                            child: Icon(FontAwesomeIcons.minus),
                            backgroundColor: activeColor,
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton.small(
                              child: Icon(FontAwesomeIcons.plus),
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ]),
              )),
            ],
          )),
          GestureDetector(
            onTap: () {
              setState(() {
                result = calculate_bmi(weight, height);
                double value = double.parse(result);
                if (value >= 25.0) {
                  resultDetail =
                      'You have  higher than normal body weight. Try to exercise more.';
                } else if (value >= 18.5) {
                  resultDetail = 'You have a normal body weight. Good Job!';
                } else {
                  resultDetail =
                      'You have a lower than normal body weight. You can eat a bit more.';
                }

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: inactiveColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          color: inactiveColor,
                          height: 200,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Result',
                                  style: textstyle1,
                                ),
                                Text(
                                  result.toString(),
                                  style: textstyle2,
                                ),
                                Text(
                                  resultDetail,
                                  style: textstyle1,
                                ),
                              ]),
                        ),
                      );
                    });
              });
            },
            child: Container(
              child: Center(
                  child: Text(
                'Calculate',
                style: textstyle3,
              )),
              width: double.infinity,
              height: 80.0,
              color: activeColor,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
