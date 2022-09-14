import 'package:bmi/controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';
import 'reusable_components.dart';
import 'constants.dart';



enum Gender {
  male,
  female,
}



class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 55;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: card(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: cardChild(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      )),
                ),
                Expanded(
                  child: card(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: cardChild(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: card(
              color: kActiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'height',
                    style: kLabelTextStyle,
                  ),
                  kHeightSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    // this property must be active to make the baseline active
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      // of(context) is to focus on the place of the widget
                      // here we make a copy of the main slider and increase the property
                      activeTrackColor: Colors.white,
                      thumbColor: kSliderThumbColor,
                      inactiveTickMarkColor: kSliderInActiveColor,
                      overlayColor: kSliderOverlayColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: kSliderInActiveColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round(); // round() is to return the integer value of the number.
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: card(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        kHeightSizedBox,
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        kHeightSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: card(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        kHeightSizedBox,
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        kHeightSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if ( age <= 100 && age>1) {
                                      age--;
                                    }
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    if (age>= 1 && age<100  ) {
                                      age++;
                                    }
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
           BottomButton(
             label: 'CALCULATE',
             onPressed:  (){
               Calculator calc = Calculator(weight: weight, height: height);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>  ResultsPage(bmiCalculator: calc.calculateBMI(), bmiResult: calc.getResult(), bmiInterpretation: calc.getInterpretation(),)));
          },),
        ],
      ),
    );
  }
}




