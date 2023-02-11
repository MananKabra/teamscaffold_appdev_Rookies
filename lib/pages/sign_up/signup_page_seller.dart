import 'package:flutter/material.dart';
import 'package:foodonline/pages/login/login_page_buyer.dart';
import 'package:provider/provider.dart';

import '../start/starting_page.dart';
import 'components/signup_auth_provider.dart';


class SignUpPageSeller extends StatefulWidget {
  const SignUpPageSeller({Key? key}) : super(key: key);

  @override
  State<SignUpPageSeller> createState() => _SignUpPageSellerState();
}

class _SignUpPageSellerState extends State<SignUpPageSeller> {

  TextEditingController fullName = TextEditingController();
  TextEditingController  emailAddress = TextEditingController();
  TextEditingController  password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SignupAuthProvider signupAuthProvider = Provider.of<SignupAuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Seller Signup'),
              TextFormField(
                controller: fullName,
                decoration: InputDecoration(
                    hintText: 'Full name'
                ),
              ),
              TextFormField(
                controller: emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email Address'
                ),
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              (signupAuthProvider!.loading==false)? MaterialButton(
                  onPressed: (){
                    signupAuthProvider.signupValidation(fullName: fullName, emailAddress: emailAddress, password: password,context: context);
                  },
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(04)
                  ),
                  color: Colors.red,
                  child: Text(
                      'Sign Up'
                  )
              ): Center(
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)=>LoginPageBuyer())
                  );
                },
                  child: Text('LOGIN')
              ),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => StartingPage())
                    );
                  },
                  child: Text('STARTING')
              )
            ],
          ),
        ),
      ),
    );
  }
}







