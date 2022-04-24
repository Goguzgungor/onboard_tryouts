import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DataView extends StatefulWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  AuthViewModel viewModel = AuthViewModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Observer(builder: (_) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomContainer(text: viewModel.userData[OnBoard.NAME], context: context, textSize: 20, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary),
            CustomContainer(text: viewModel.userData[OnBoard.AGE], context: context, textSize: 20, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary),
            CustomContainer(text: viewModel.userData[OnBoard.LENGHT], context: context, textSize: 20, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary),
            CustomContainer(text: viewModel.userData[OnBoard.WEIGHT], context: context, textSize: 20, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary),
          ]);
        }),
      ),
    );
  }
}
