import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:crewin_app/ui/auth_view.dart';
import 'package:crewin_app/ui/onboardview.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomContainer(text: 'TEST PRO', context: context, textSize: 36, height: 135, width: 260, c1: Theme.of(context).colorScheme.secondary),
          Text(
            'A test app for CreWin',
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(
            height: 80,
          ),
          InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthView())),
              child: CustomContainer(text: 'Continue with e-mail', context: context, textSize: 14, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary)),
          InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardView())),
              child: CustomContainer(text: 'Cont without signing up', context: context, textSize: 14, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary)),
        ]),
      ),
    );
  }
}
