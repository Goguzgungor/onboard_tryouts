import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

class LenghtView extends StatefulWidget {
  const LenghtView({Key? key}) : super(key: key);

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
        ]),
      ),
    );
  }
}
