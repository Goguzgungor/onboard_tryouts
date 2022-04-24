import 'package:crewin_app/components/auth_comp/authconst.dart';
import 'package:crewin_app/components/onboard_comp/enum/onboard_const.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'authview_model.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase with Store {
  @observable
  int ageVal = 18;
  @observable
  int lenghtVal = 100;
  @observable
  int weightVal = 40;
  @observable
  String t1 = 'evet';
  @observable
  Color sexColor1 = Color(0xFFBDBCBC);
  @observable
  Color nameColor = Color(0xFFBDBCBC);
  @observable
  Color sexColor2 = Color(0xFFBDBCBC);
  @observable
  Map userData = {
    OnBoard.AGE: '',
    OnBoard.NAME: '',
    OnBoard.LENGHT: '',
    OnBoard.SEX: '',
    OnBoard.WEIGHT: '',
  };

  @observable
  String temp = '';
  @observable
  bool isVisible = false;
  @observable
  String signState = AuthConstants.SIGNIN;
  @observable
  Color passiveColor = Color(0xFFBDBCBC);
  @observable
  Color activeColor = Color(0xFFF1EBEB);
  @action
  addDataToMap(String newData, String controllerData) {
    userData[newData] = controllerData;
    print(userData[newData]);
  }

  @action
  void setageVal(int newValue) {
    ageVal = newValue;
  }

  @action
  void setLenghtValue(int newValue) {
    lenghtVal = newValue;
  }

  @action
  void setWeightValue(int newValue) {
    weightVal = newValue;
  }

  @action
  void changeSexColor1() {
    if (sexColor1 == Color(0xFFBDBCBC) && sexColor2 == Color(0xFFBDBCBC)) {
      sexColor1 = Color.fromARGB(255, 224, 128, 128);
      print('evet');
    } else if (sexColor1 == Color.fromARGB(255, 224, 128, 128) && sexColor2 == Color(0xFFBDBCBC)) {
      sexColor1 = Color.fromARGB(255, 224, 128, 128);
    } else if (sexColor2 == Color.fromARGB(255, 224, 128, 128) && sexColor1 == Color(0xFFBDBCBC)) {
      sexColor1 = Color.fromARGB(255, 224, 128, 128);
      sexColor2 = Color(0xFFBDBCBC);
    }
    print(userData['sex']);
  }

  @action
  void changeSexColor2() {
    if (sexColor2 == Color(0xFFBDBCBC) && sexColor1 == Color(0xFFBDBCBC)) {
      sexColor2 = Color.fromARGB(255, 224, 128, 128);
    } else if (sexColor2 == Color.fromARGB(255, 224, 128, 128) && sexColor1 == Color(0xFFBDBCBC)) {
      sexColor2 = Color.fromARGB(255, 224, 128, 128);
    } else if (sexColor1 == Color.fromARGB(255, 224, 128, 128) && sexColor2 == Color(0xFFBDBCBC)) {
      sexColor2 = Color.fromARGB(255, 224, 128, 128);
      sexColor1 = Color(0xFFBDBCBC);
    }
  }

  @action
  void changeNameColor() {
    nameColor == Color.fromARGB(255, 224, 128, 128);
  }

  @action
  void changeColor() {
    if (passiveColor == Color(0xFFBDBCBC)) {
      passiveColor = Color(0xFFF1EBEB);
      activeColor = Color(0xFFBDBCBC);
      signState = AuthConstants.SIGNUP;
      isVisible = true;

      print(signState);
    } else if (passiveColor == Color(0xFFF1EBEB)) {
      passiveColor = Color(0xFFBDBCBC);
      activeColor = Color(0xFFF1EBEB);
      signState = AuthConstants.SIGNIN;
      isVisible = false;
    }
  }
}
