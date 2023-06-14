import 'package:flutter/material.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // for extra spacing
                    Flexible(
                      child: Container(),
                      flex: 2,
                    ),
                    Image.asset(
                      'assets/insta_logo.png',
                      height: 84,
                      color: primaryColor,
                    ),
                    const SizedBox(height: 64),
                    //circular widget to accept and show our selected file
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage('assets/insta_logo.png'),
                        ),
                        Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_a_photo,
                                ))),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // text field input for username
                    TextFieldInput(
                        textEditingController: _usernameController,
                        hintText: 'Enter your username',
                        textInputType: TextInputType.text),
                    const SizedBox(height: 24),
                    // text field input for email
                    TextFieldInput(
                        textEditingController: _emailController,
                        hintText: 'Enter your email',
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(height: 24),
                    TextFieldInput(
                        textEditingController: _passwordController,
                        hintText: 'Enter your password',
                        textInputType: TextInputType.text,
                        isPass: true),
                    const SizedBox(height: 24),
                    TextFieldInput(
                        textEditingController: _bioController,
                        hintText: 'Enter your bio',
                        textInputType: TextInputType.text),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                        child: const Text('Log in'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: Container(),
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Already have an account? "),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        GestureDetector(
                          onTap: (() {}),
                          child: Container(
                            child: Text(
                              "Log in",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}
