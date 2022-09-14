import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
import 'results_page.dart';

Widget card({Color? color,Widget? cardChild,void Function()? onPressed}){
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.all(4),
       child: cardChild,  // just a column for gender cards.
      margin: const EdgeInsets.all(10.0),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget cardChild({String? label,IconData? icon}){
  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:  [
      Icon(
        icon,
        size: 80,
        color: Colors.white,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        label!,
        style: kLabelTextStyle,
      )
    ],
  );
}
class BottomButton extends StatelessWidget {
    final void Function() onPressed;
    final String label;

   BottomButton({ required this.onPressed,required this.label});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(

        child:   Center(child:  Text(label,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),),
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        height: 70.0,
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 6.0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        height: 46.0,
        width: 46.0,
      ),
    );
  }
}