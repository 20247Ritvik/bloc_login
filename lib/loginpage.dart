import 'package:bloc_login/home_cubit/home_cubit.dart';
import 'package:bloc_login/homerepository/repository.dart';
import 'package:bloc_login/login_state/login_state.dart';
import 'package:bloc_login/sign_cubit/sign_cubit.dart';
import 'package:bloc_login/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'homepage.dart';
import 'login_cubit/cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

   void checkLoginState() {
      BlocProvider.of<LoginCubit>(context).Auth(
          emailController.text.toString(), passwordController.text.toString());
      final state = BlocProvider.of<LoginCubit>(context).state;

      if (state is LoginValidState) {
        //nav to next page
        final snackBar = SnackBar(
          content: const Text('Logged In Successfully!!'),
          backgroundColor: (Colors.green[300]),
          //padding: EdgeInsets.all(10.0),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider(create: (BuildContext context) =>HomeCubit(HomeRepository()),
          child: HomePage());
        }));
      }
      if (state is LoginErrorState) {
        //error
        final snackBar = SnackBar(
          content: const Text('Error!!'),
          backgroundColor: (Colors.red[500]),
          //padding: EdgeInsets.all(10.0),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      if (state is LoginInvalidState) {
        Center(
            child: Container(
          child: Text("Invalid State Error"),
        ));
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
                right: 35,
                left: 35,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'email',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'password',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                      child: Center(
                          child: ElevatedButton(
                    onPressed: checkLoginState,
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      fixedSize: const Size(
                        360,
                        50,
                      ),
                      primary: Colors.lightBlueAccent,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 22,
                          fontStyle: FontStyle.normal),
                    ),
                  ))),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BlocProvider(
                                  create: (BuildContext context) =>
                                      SignInCubit(),
                                  child: SignUpPage());
                            }));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
