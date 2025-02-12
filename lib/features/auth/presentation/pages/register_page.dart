import 'package:flutter/material.dart';
import 'package:social_media_clone/features/auth/presentation/components/my_button.dart';
import 'package:social_media_clone/features/auth/presentation/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;

  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
          
                // create account message
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16
                  ),
                ),
          
                const SizedBox(height: 25,),

                 //name textfield
                MyTextField(
                  controller: nameController, 
                  hintText: "Name", 
                  obscureText: false
                ),

                const SizedBox(height: 10,),
          
                //email textfield
                MyTextField(
                  controller: emailController, 
                  hintText: "Email", 
                  obscureText: false
                ),

                const SizedBox(height: 10,),
          
                //password textfield
                MyTextField(
                  controller: passwordController, 
                  hintText: "Password", 
                  obscureText: true
                ),

                const SizedBox(height: 10,),

                 //confirm password textfield
                MyTextField(
                  controller: confirmPasswordController, 
                  hintText: "Confirm Password", 
                  obscureText: true
                ),

                const SizedBox(height: 25,),
          
                // register button
                MyButton(
                  onTap: () {}, 
                  text: "Register"
                ),

                const SizedBox(height: 50,),

                // already a member? login now
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Login now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}