import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  AuthViewModel viewModel = AuthViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Observer(builder: (_) {
            return InkWell(
                onTap: () => print(viewModel.userData[OnBoard.WEIGHT]),
                child: CustomContainer(text: viewModel.userData[OnBoard.WEIGHT].toString(), context: context, textSize: 20, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary));
          })
        ]),
      ),
    );
  }
}
