import 'package:flutter/material.dart';
import 'package:metamask_app/consts/colors.dart';
import 'package:metamask_app/pages/register/register_form.dart';

class WelcomeRegisterOrLoginScreen extends StatefulWidget {
  const WelcomeRegisterOrLoginScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeRegisterOrLoginScreen> createState() =>
      _WelcomeRegisterOrLoginScreenState();
}

class _WelcomeRegisterOrLoginScreenState
    extends State<WelcomeRegisterOrLoginScreen> {
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
            _createNewWalletButton(),
            const SizedBox(
              height: 14.0,
            ),
            _recoveryWalletButton(),
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

  Widget _createNewWalletButton() {
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
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => const RegisterForm());
          Navigator.push(context, route);
        },
        child: const Text(
          'Create a new wallet',
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

  Widget _recoveryWalletButton() {
    return SizedBox(
      width: 248.0,
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
        onPressed: () {},
        child: Text(
          'Recovery Wallet',
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
