import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeView extends StatefulWidget {
  const AgeView({Key? key}) : super(key: key);

  @override
  State<AgeView> createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = AuthViewModel();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "How old are you? ",
            textScaleFactor: 2,
          ),
          SizedBox(
            height: 40,
          ),
          Observer(builder: (_) {
            return NumberPicker(
              textStyle: TextStyle(fontSize: 20),
              value: viewModel.ageVal,
              minValue: 18,
              maxValue: 100,
              onChanged: (value) {
                viewModel.setageVal(value);
                viewModel.addDataToMap(OnBoard.AGE, viewModel.ageVal.toString());
              },
            );
          }),
        ]),
      ),
    );
  }
}
