import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:flutter/material.dart';

class SummaryView extends StatefulWidget {
  final String name;
  final String age;
  final String lenght;
  final String weight;
  final String sex;
  const SummaryView({Key? key, required this.name, required this.age, required this.lenght, required this.weight, required this.sex}) : super(key: key);

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomContainer(text: widget.name, context: context, textSize: 30, height: 50, width: 180, c1: Theme.of(context).colorScheme.secondary),
          CustomContainer(text: widget.age, context: context, textSize: 30, height: 50, width: 180, c1: Theme.of(context).colorScheme.secondary),
          CustomContainer(text: widget.lenght, context: context, textSize: 30, height: 50, width: 180, c1: Theme.of(context).colorScheme.secondary),
          CustomContainer(text: widget.weight, context: context, textSize: 30, height: 50, width: 180, c1: Theme.of(context).colorScheme.secondary),
          CustomContainer(text: widget.sex, context: context, textSize: 30, height: 50, width: 180, c1: Theme.of(context).colorScheme.secondary),
        ]),
      ),
    );
  }
}
