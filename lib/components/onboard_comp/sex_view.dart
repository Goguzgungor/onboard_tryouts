import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:crewin_app/components/onboard_comp/age_view.dart';
import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SexView extends StatefulWidget {
  final String name;
  const SexView({Key? key, required this.name}) : super(key: key);

  @override
  State<SexView> createState() => _SexViewState();
}

class _SexViewState extends State<SexView> {
  AuthViewModel viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = AuthViewModel();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What's your sex? ",
              textScaleFactor: 3,
            ),
            SizedBox(
              height: 40,
            ),
            Observer(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          viewModel.addDataToMap(OnBoard.SEX, 'Male');
                          viewModel.changeSexColor1();
                        },
                        child: CustomContainer(text: 'Male', context: context, textSize: 30, height: 60, width: 120, c1: viewModel.sexColor1)),
                    InkWell(
                        onTap: () {
                          viewModel.addDataToMap(OnBoard.SEX, 'Female');
                          viewModel.changeSexColor2();
                        },
                        child: CustomContainer(text: 'Female', context: context, textSize: 30, height: 60, width: 120, c1: viewModel.sexColor2)),
                  ],
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AgeView(
                            name: widget.name,
                            sex: viewModel.userData[OnBoard.SEX],
                          )));
                },
                child: CustomContainer(text: 'Next', context: context, textSize: 25, height: 50, width: 150, c1: Theme.of(context).colorScheme.secondary))
          ],
        ),
      ),
    );
  }
}
