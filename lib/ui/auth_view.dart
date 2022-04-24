import 'package:crewin_app/components/auth_comp/authconst.dart';
import 'package:crewin_app/components/auth_comp/customtextfield.dart';
import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:crewin_app/firebase/email_auth.dart';
import 'package:crewin_app/ui/onboardview.dart';
import 'package:crewin_app/viewmodels/authview_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  AuthViewModel viewModel = AuthViewModel();
  TextEditingController mailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  TextEditingController rePassCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Observer(
              builder: (_) {
                return Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          viewModel.changeColor();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 5),
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: viewModel.passiveColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text('Sign in')),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          viewModel.changeColor();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 5),
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: viewModel.activeColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text('Sign up')),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            CustomTextField(
              hintText: 'E-mail',
              type: TextInputType.emailAddress,
              controller: mailCont,
              obsecureText: false,
            ),
            CustomTextField(
              hintText: 'Password',
              type: TextInputType.text,
              controller: passCont,
              obsecureText: true,
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: viewModel.isVisible,
                child: CustomTextField(
                  hintText: 'Re-write Password',
                  type: TextInputType.text,
                  controller: rePassCont,
                  obsecureText: true,
                ),
              );
            }),
            Observer(
              builder: (_) {
                return InkWell(onTap: () async {
                  if (viewModel.signState == AuthConstants.SIGNUP) {
                    AuthMenager.instance.register(mailCont.text, passCont.text, rePassCont.text, context);
                  } else if (viewModel.signState == AuthConstants.SIGNIN) {
                    UserCredential? user = await AuthMenager.instance.login(mailCont.text, passCont.text);
                    if (user != null) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardView()));
                    }
                  }
                }, child: Observer(builder: (_) {
                  return CustomContainer(text: viewModel.signState, context: context, textSize: 20, height: 50, width: 220, c1: Theme.of(context).colorScheme.secondary);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
