import 'package:flutter/material.dart';
import 'package:foodonline/pages/login/login_page_buyer.dart';
import 'package:provider/provider.dart';

import 'components/signup_auth_provider.dart';

class SignUpPageBuyer extends StatefulWidget {
  const SignUpPageBuyer({Key? key}) : super(key: key);

  @override
  State<SignUpPageBuyer> createState() => _SignUpPageBuyerState();
}

class _SignUpPageBuyerState extends State<SignUpPageBuyer> {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignupAuthProvider signupAuthProvider =
        Provider.of<SignupAuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Buyer Signup',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 59, 128, 232),
                    )),
                Image.asset('images/login.jpg', height: 200, width: 200),
                SizedBox(height: 10),
                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      gapPadding: 10,
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                (signupAuthProvider!.loading == false)
                    ? MaterialButton(
                        onPressed: () {
                          signupAuthProvider.signupValidation(
                              fullName: fullName,
                              emailAddress: emailAddress,
                              password: password,
                              context: context);
                        },
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(04)),
                        color: Colors.red,
                        child: Text('Sign Up'))
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPageBuyer()));
                    },
                    child: Text('LOGIN'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
