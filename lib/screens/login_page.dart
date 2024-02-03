import "dart:ui";
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Positioned(
              left: 50,
              right: 50,
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.orange,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Text(
                    "Login".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Please enter your email and password to sign in to your account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                        labelText: 'Email',
                        isDense: true,
                        prefixIcon: const Icon(CupertinoIcons.mail),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ValueListenableBuilder<bool>(
                      valueListenable: isPasswordVisible,
                      builder: (context, isVisible, _) {
                        return TextFormField(
                          obscureText: !isVisible,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w300),
                              labelText: 'Password',
                              isDense: true,
                              prefixIcon: const Icon(CupertinoIcons.lock),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    isPasswordVisible.value = !isVisible,
                                child: Icon(isVisible
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash_fill),
                              )),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orange[400]),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: const Row(
                              children: [
                                Text("Submit"),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ])
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account ?",
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Create Now !",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 152, 0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
