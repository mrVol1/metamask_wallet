import 'package:flutter/material.dart';
import 'package:metamask_app/consts/colors.dart';
import 'package:metamask_app/pages/register/services/register_form_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AurhServices _authServices = AurhServices();
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
              height: 30.0,
            ),
            _emailAndPassword(),
            const SizedBox(
              height: 114.0,
            ),
            _registerButton(),
            const SizedBox(
              height: 14.0,
            ),
            _skipButton(),
          ],
        ),
      ),
    );
  }

  Widget _textForm() {
    return Text(
      'Enter Email and Password',
      style: TextStyle(
        color: ColorsConst.colorTextBold,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'SF_Bold',
      ),
    );
  }

  Widget _emailAndPassword() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                label: Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'SF_Medium',
                      color: ColorsConst.colorTextMedium),
                ),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'SF_Medium',
                      color: ColorsConst.colorTextMedium),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
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
          _authServices.signUp(
              context, _emailController.text, _passwordController.text);
        },
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

  Widget _skipButton() {
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
          'Skip',
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
