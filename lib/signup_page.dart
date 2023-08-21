import 'package:bloc_login/homepage.dart';
import 'package:bloc_login/sign_cubit/sign_cubit.dart';
import 'package:bloc_login/sign_state/sign_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController conpassController = TextEditingController();

    void checkSignUpState() {
      BlocProvider.of<SignInCubit>(context).Auth(
          nameController.text,
          emailController.text,
          passwordController.text,
          conpassController.text);
      final state = BlocProvider.of<SignInCubit>(context).state;
      if (state is SignInValidState) {
        final snackBar = SnackBar(
          content: const Text('Logged In Successfully!!'),
          backgroundColor: (Colors.green[300]),
          //padding: EdgeInsets.all(10.0),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }
      if (state is SignInErrorState) {
        final snackBar = SnackBar(
          content: const Text('Error!!'),
          backgroundColor: (Colors.red[500]),
          //padding: EdgeInsets.all(10.0),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      if (state is SignInInvalidState) {
        final snackBar = SnackBar(
          content: const Text('Password Not Match'),
          backgroundColor: (Colors.green[300]),
          //padding: EdgeInsets.all(10.0),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.33,
                right: 35,
                left: 35,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: conpassController,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: Center(
                          child: ElevatedButton(
                    onPressed: checkSignUpState,
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      fixedSize: const Size(
                        360,
                        50,
                      ),
                      primary: Colors.deepOrangeAccent[700],
                      textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal),
                    ),
                  ))),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Already have an Account?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                          style: ButtonStyle(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.orange.shade800,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          style: ButtonStyle(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
