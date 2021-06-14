import 'package:flutter/material.dart';
import '../view/json_placeholder_view.dart';
import 'customer_stepper_viewmodel.dart';

class CustomerStepperView extends CustomerStepperViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              //type: StepperType.horizontal,
              steps: stepList() ?? [],
              currentStep: currentStep,
              onStepTapped: onStepChange,
            ),
          ),
          Expanded(
            child: JsonPlaceHolderView(),
          )
        ],
      ),
    );
  }
}
