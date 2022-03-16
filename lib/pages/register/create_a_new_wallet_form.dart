import 'package:flutter/material.dart';
import 'package:metamask_app/consts/colors.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.colorTheme,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textForm(),
            const SizedBox(
              height: 12.0,
            ),
            _textMeduimForm(),
            const SizedBox(
              height: 114.0,
            ),
            _radioButton(),
            const SizedBox(
              height: 14.0,
            ),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  Widget _textForm() {
    return Text(
      'Create a new wallet',
      style: TextStyle(
        color: ColorsConst.colorTextBold,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'SF_Bold',
      ),
    );
  }

  Widget _textMeduimForm() {
    return Text(
      'In the next step you will see 12\nwords that allow you to restore\nyour wallet',
      style: TextStyle(
        color: ColorsConst.colorTextMedium,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'SF_Medium',
      ),
    );
  }

  Widget _radioButton() {
    int val = -1;
    bool value = false;
    return ListTile(
      title: Text(
        'I understand that if I lose my secret phrase,\nI will lose access to my wallet',
        style: TextStyle(
          fontFamily: 'SF_Medium',
          color: ColorsConst.colorTextMedium,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      leading: Radio(
        value: 1,
        groupValue: val,
        onChanged: (value) {
          setState(() {});
        },
        activeColor: ColorsConst.colorIndicator,
      ),
    );
  }

  Widget _nextButton() {
    return SizedBox(
      width: 248.0,
      height: 40.0,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            ColorsConst.colorTextBold,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Register',
          style: TextStyle(
            fontFamily: 'SF_Medium',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
