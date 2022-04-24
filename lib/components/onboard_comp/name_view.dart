import 'package:crewin_app/components/auth_comp/customtextfield.dart';
import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:flutter/material.dart';

class NameView extends StatefulWidget {
  const NameView({Key? key}) : super(key: key);

  @override
  State<NameView> createState() => _NameViewState();
}

class _NameViewState extends State<NameView> {
  TextEditingController namecont = TextEditingController();

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
            'Your Name',
            textScaleFactor: 3,
          ),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            hintText: 'Please enter your name',
            type: TextInputType.name,
            controller: namecont,
            obsecureText: false,
            func: viewModel.addDataToMap(OnBoard.NAME, namecont.text),
          ),
          SizedBox(
            height: 40,
          ),
          Text('Please Slide')
        ]),
      ),
    );
  }
}
