/* 
LOGIN PAGE

On this page, an existing user can login with their:

- email
- password

--------------------------------------------------

Once the user successfully logs in, they will be redirected to home page

If user doesn't have an account yet, they can go to register page from here to create one

*/

import 'package:flutter/material.dart';
import 'package:social_media_clone/features/auth/presentation/components/my_button.dart';
import 'package:social_media_clone/features/auth/presentation/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // BUILD UI
  @override
  Widget build(BuildContext context) {

    //SCAFFOLD
    return Scaffold(

      //BODY
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
          
                const SizedBox(height: 50,),
          
                // welcome back message
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16
                  ),
                ),
          
                const SizedBox(height: 25,),
          
                //email textfield
                MyTextField(
                  controller: emailController, 
                  hintText: "Email", 
                  obscureText: false
                ),

                const SizedBox(height: 25,),
          
                //password textfield
                MyTextField(
                  controller: passwordController, 
                  hintText: "Password", 
                  obscureText: true
                ),

                const SizedBox(height: 25,),
          
                // login button
                MyButton(
                  onTap: () {}, 
                  text: "Login"
                ),

                const SizedBox(height: 50,),

                // not a member? register now
                Text(
                  "Not a member? Register now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}