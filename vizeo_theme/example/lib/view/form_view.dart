import 'package:example/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:get/get.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  var _nameTest = "";
  late final TextEditingController textEditingControllerBase;
  late final TextEditingController textEditingControllerMail;
  late final TextEditingController textEditingControllerPwd;
  late final TextEditingController textEditingControllerPhone;
  late final TextEditingController textEditingControllerOver;
  late final TextEditingController textEditingControllerOver2;
  final focudNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingControllerBase = TextEditingController();
    textEditingControllerMail = TextEditingController();
    textEditingControllerPwd = TextEditingController();
    textEditingControllerPhone = TextEditingController();
    textEditingControllerOver = TextEditingController(text: "Disable");
    textEditingControllerOver2 = TextEditingController(text: "Not Enable");
  }

  @override
  void dispose() {
    textEditingControllerBase.dispose();
    textEditingControllerMail.dispose();
    textEditingControllerPwd.dispose();
    textEditingControllerPhone.dispose();
    textEditingControllerOver.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VzTextForm(
              isReadOnly: true,
              width: 200.0,
              controller: textEditingControllerOver,
              textInputAction: TextInputAction.next,
              style: vzThemeDark()
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.amber),
            ),
            VzTextForm(
              isEnable: false,
              width: 200.0,
              controller: textEditingControllerOver2,
              onFieldSubmitted: (txt) {
                _nameTest = textEditingControllerOver2.text;
                setState(() {});
              },
            ),
            VzTextForm.typePassword(
              width: 200.0,
              controller: textEditingControllerPwd,
              textInputAction: TextInputAction.done,
              hint: "*************",
              onFieldSubmitted: (txt) {
                _nameTest = textEditingControllerPwd.text;
                debugPrint("name test => $_nameTest");
                if (_nameTest.isNotEmpty) {
                  Get.to(() => const SecondScreen());
                } else {
                  debugPrint("HEU");
                }
              },
            ),
            VzTextForm(
              width: 200.0,
              controller: textEditingControllerBase,
              onChanged: (txt) {
                _nameTest = textEditingControllerBase.text;
                setState(() {});
              },
              focus: focudNode,
              hint: "hint",
            ),
            VzTextForm.typeMail(
              width: 200.0,
              controller: textEditingControllerMail,
              onFieldSubmitted: (txt) {
                _nameTest = textEditingControllerMail.text;
                setState(() {});
              },
            ),
            VzTextForm.typeTelNumber(
              width: 200.0,
              controller: textEditingControllerPhone,
              onFieldSubmitted: (txt) {
                _nameTest = textEditingControllerPhone.text;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        VzText.typeTertiary(
          data: "Valeur Text Field Base => $_nameTest",
        ),
        VzTextForm(
          width: MediaQuery.of(context).size.width * 0.8,
          controller: textEditingControllerBase,
          onFieldSubmitted: (txt) => debugPrint(""),
        ),
      ],
    );
  }
}
