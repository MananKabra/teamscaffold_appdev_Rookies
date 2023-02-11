import 'package:flutter/material.dart';
import 'package:foodonline/pages/sign_up/components/login_auth_provider.dart';
import 'package:foodonline/pages/sign_up/signup_page_buyer.dart';
import 'package:foodonline/pages/sign_up/signup_page_seller.dart';
import 'package:provider/provider.dart';

class LoginPageBuyer extends StatelessWidget {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Buyer Login'),
              TextFormField(
                controller: emailAddress,
                decoration: InputDecoration(hintText: 'Email Address'),
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 20),
              (loginAuthProvider.loading == false)
                  ? MaterialButton(
                      onPressed: () {
                        loginAuthProvider.loginValidation(
                            emailAddress: emailAddress,
                            password: password,
                            context: context);
                      },
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(04)),
                      color: Colors.red,
                      child: Text('Login'))
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpPageBuyer()));
                  },
                  child: Text('SIGNUP'))
            ],
          ),
        ),
      ),
    );
  }
}
