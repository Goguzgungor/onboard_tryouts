import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/ui/summary_view.dart';

import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightView extends StatefulWidget {
  final String name;
  final String sex;
  final String age;
  final String lenght;
  const WeightView({Key? key, required this.name, required this.sex, required this.age, required this.lenght}) : super(key: key);

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  AuthViewModel viewModel = AuthViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "How much is your weight? ",
            textScaleFactor: 2,
          ),
          SizedBox(
            height: 40,
          ),
          Observer(builder: (_) {
            return NumberPicker(
              textStyle: TextStyle(fontSize: 20),
              value: viewModel.weightVal,
              minValue: 40,
              maxValue: 250,
              onChanged: (value) {
                viewModel.setWeightValue(value);
                viewModel.addDataToMap(OnBoard.WEIGHT, viewModel.weightVal.toString());
              },
            );
          }),
          InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SummaryView(name: widget.name, age: widget.age, lenght: widget.lenght, weight: viewModel.userData[OnBoard.WEIGHT].toString(), sex: widget.sex))),
              child: CustomContainer(text: 'Next', context: context, textSize: 20, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary))
        ]),
      ),
    );
  }
}
