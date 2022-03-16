import 'package:flutter/material.dart';
import 'package:metamask_app/consts/colors.dart';
import 'package:metamask_app/pages/function_app/home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.colorTheme,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageMetamask(),
            const SizedBox(
              height: 57.0,
            ),
            _loginText(),
            const SizedBox(
              height: 114.0,
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _imageMetamask() {
    return Image.asset(
      'assets/images/MM_Roundel.png',
      height: 128.0,
      width: 128.0,
    );
  }

  Widget _loginText() {
    return Text(
      'MetaMask prototypes',
      style: TextStyle(
        color: ColorsConst.colorTextBold,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'SF_Bold',
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: 164.0,
      height: 40.0,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(color: ColorsConst.colorTextMedium),
            ),
          ),
        ),
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => const HomeScreen());
          Navigator.push(context, route);
        },
        child: Text(
          'Accounts & Connect',
          style: TextStyle(
            fontFamily: 'SF_Medium',
            color: ColorsConst.colorTextMedium,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
