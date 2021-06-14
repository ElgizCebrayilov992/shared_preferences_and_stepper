import 'package:flutter/material.dart';
import 'customer_stepper.dart';

abstract class CustomerStepperViewModel extends State<CustomerStepper> {
  int stepLenght = 5;

  
  List<Step>? stepList() {
    List<Step> steps = [];
    for (var i = 0; i < stepLenght; i++) {
      steps.add(
        Step(
          title: Text('Hello'),
          content: TextField(),
          isActive: currentStep==i,
          state: currentStep==i?StepState.complete:StepState.editing,
        ),
      );
     
    }
     return steps;
  }
int currentStep = 0;
  void onStepChange(int index) {
    setState(() {
      currentStep = index;
    });
  }
}
