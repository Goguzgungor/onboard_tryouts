import 'package:crewin_app/components/onboard_comp/age_view.dart';
import 'package:crewin_app/components/onboard_comp/length_view.dart';
import 'package:crewin_app/components/onboard_comp/sex_view.dart';
import 'package:crewin_app/components/onboard_comp/name_view.dart';
import 'package:crewin_app/components/onboard_comp/weight_view.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: controller,
          children: [NameView(), SexView(), AgeView(), LenghtView(), WeightView()],
        ),
      ),
    );
  }
}
