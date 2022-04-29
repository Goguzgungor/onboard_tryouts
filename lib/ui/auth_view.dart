import 'package:crewin_app/components/auth_comp/authconst.dart';
import 'package:crewin_app/components/auth_comp/customtextfield.dart';
import 'package:crewin_app/components/landing_comp/custom_cont.dart';
import 'package:crewin_app/components/onboard_comp/name_view.dart';
import 'package:crewin_app/firebase/email_auth.dart';
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
  final mailCont = TextEditingController();
  final passCont = TextEditingController();
  final rePassCont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: _key,
        child: Container(
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
                validator: validateEmail,
              ),
              CustomTextField(
                hintText: 'Password',
                type: TextInputType.text,
                controller: passCont,
                obsecureText: true,
                validator: validatePassword,
              ),
              Observer(builder: (_) {
                return Visibility(
                  visible: viewModel.isVisible,
                  child: CustomTextField(
                    hintText: 'Re-write Password',
                    type: TextInputType.text,
                    controller: rePassCont,
                    obsecureText: true,
                    validator: validatePassword,
                  ),
                );
              }),
              Observer(
                builder: (_) {
                  return InkWell(onTap: () async {
                    if (viewModel.signState == AuthConstants.SIGNUP) {
                      if (_key.currentState!.validate()) {
                        AuthMenager.instance.register(mailCont.text, passCont.text, rePassCont.text, context);
                        setState(() {});
                      }
                    } else if (viewModel.signState == AuthConstants.SIGNIN) {
                      UserCredential? user = await AuthMenager.instance.login(mailCont.text, passCont.text);
                      if (user != null) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NameView()));
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
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null) {
    'E-mail address is required.';
  } else {
    return null;
  }
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) 'Password is required.';

  return null;
}
