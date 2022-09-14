import 'package:bmi/constants.dart';
import 'package:bmi/input_page.dart';
import 'package:bmi/reusable_components.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
 final String bmiCalculator;
 final String bmiResult;                    // These are properties to be sent here to be calculated ... they are sent while creating the object from this class and they are sent again to the result page to be shown after being calculated
 final String bmiInterpretation;

 ResultsPage({required this.bmiCalculator, required this.bmiResult, required this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Results',
          style: kLabelTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
              child: Text(
            'Your Result ',
            style: kNumberTextStyle,
          )),
          Expanded(
            child: card(
              color: kActiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Center(
                      child: Text(
                    bmiResult.toUpperCase(),
                    style:const  TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                  Center(
                    child: Text(
                     bmiCalculator,
                      style: const TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                   bmiInterpretation,
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
            flex: 5,
          ),
          BottomButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  InputPage()));
              },
              label: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
