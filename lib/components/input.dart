import 'package:bmi/components/bmicalculation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_Card.dart';
import 'constants.dart';
import '../Screen/valuePage.dart';
import 'round_icon.dart';

enum GenderType {
  male,
  female,
}

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  GenderType? selectGender;
  int height = 150;
  int weight = 70;
  int age = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = GenderType.male;
                      });
                    },
                    child: ReUsableCard(
                      iconChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 60.0,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Male',
                            style: kWordStyle,
                          )
                        ],
                      ),
                      colour: selectGender == GenderType.male
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = GenderType.female;
                      });
                    },
                    child: ReUsableCard(
                      iconChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 60.0,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Female',
                            style: kWordStyle,
                          )
                        ],
                      ),
                      colour: selectGender == GenderType.female
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUsableCard(
              iconChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kWordStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      const Text(
                        'cm',
                        style: kWordStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29BE1555),
                      thumbColor: Color(0xFFBE1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: kInactiveColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUsableCard(
                    iconChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kWordStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              tap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              tap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kInactiveColor,
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    iconChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kWordStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              tap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              tap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiCalculation calc =
              BmiCalculation(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalPage(
                        bmiResult: calc.bmiCal(),
                        wordResult: calc.getWordResult(),
                        desResult: calc.getDescription(),
                        getSub: calc.getSub(),
                      )));
            },
            child: Container(
              color: kBottomColor,
              height: kBottomHeight,
              padding: const EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: kButtonStyle,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
