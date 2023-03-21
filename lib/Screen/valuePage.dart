import 'package:flutter/material.dart';
import '../components/constants.dart';

class CalPage extends StatelessWidget {
  const CalPage({super.key, required this.bmiResult,required this.wordResult,required this.desResult,required this.getSub});
  final String wordResult;
  final String desResult;
  final String bmiResult;
  final String getSub;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
                child: Text(
                  'YOUR RESULT',
                  style: kTitleStyle,
                )),
            Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: kActiveColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        wordResult,
                        style: kResultStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMIStyle,
                      ),
                      Column(
                        children: [
                          Text(
                            '$wordResult BMI Range:',
                            style: kWordStyle,

                          ),
                          Text(getSub,style: kDecStyle,textAlign: TextAlign.center,),
                        ],
                      ),

                      Text(
                        desResult,
                        style: kDecStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: kBottomColor,
                height: kBottomHeight,
                padding: const EdgeInsets.only(bottom: 10.0),
                width: double.infinity,
                child: const Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: kButtonStyle,
                    )),
              ),
            )
          ],
        ));
  }
}
