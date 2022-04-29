import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/components/onboard_comp/weight_view.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

import '../landing_comp/custom_cont.dart';

class LenghtView extends StatefulWidget {
  final String name;
  final String sex;
  final String age;
  const LenghtView({Key? key, required this.name, required this.sex, required this.age}) : super(key: key);

  @override
  State<LenghtView> createState() => _LenghtViewState();
}

class _LenghtViewState extends State<LenghtView> {
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
            "How much is your lenght? ",
            textScaleFactor: 2,
          ),
          SizedBox(
            height: 40,
          ),
          Observer(builder: (_) {
            return NumberPicker(
              textStyle: TextStyle(fontSize: 20),
              value: viewModel.lenghtVal,
              minValue: 100,
              maxValue: 250,
              onChanged: (value) {
                viewModel.setLenghtValue(value);
                viewModel.addDataToMap(OnBoard.LENGHT, viewModel.lenghtVal.toString());
              },
            );
          }),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WeightView(
                          name: widget.name,
                          age: widget.age,
                          lenght: viewModel.userData[OnBoard.LENGHT].toString(),
                          sex: widget.sex,
                        )));
              },
              child: CustomContainer(text: 'Next', context: context, textSize: 25, height: 50, width: 150, c1: Theme.of(context).colorScheme.secondary))
        ]),
      ),
    );
  }
}
