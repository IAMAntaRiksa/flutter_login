import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flutter/bloc/login_bloc.dart';
import 'package:login_flutter/ui/home/home_screen.dart';
import 'package:login_flutter/ui/login/register.dart';
import 'package:login_flutter/values/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccsess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state is LoginError) {
            const LoginError(message: 'error login coba lagi');
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade800,
                        Colors.blue.shade600,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 36, horizontal: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Login', style: textFonts),
                              SizedBox(height: 20),
                              Text('Simple UI Login', style: textFontses),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: usernameController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFe7edeb),
                                    hintText: "E-mail",
                                    prefixIcon: Icon(Icons.email,
                                        color: Colors.grey.shade500),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFe7edeb),
                                    hintText: "Password",
                                    prefixIcon: Icon(Icons.lock,
                                        color: Colors.grey.shade500),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  width: double.maxFinite,
                                  color: Colors.blue,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<LoginBloc>().add(
                                          GetLoginEvent(
                                              username: usernameController.text,
                                              password:
                                                  passwordController.text));
                                      // BlocProvider.of<LoginBloc>(context).add(
                                      //     GetLoginEvent(
                                      //         username: usernameController.text,
                                      //         password:
                                      //             passwordController.text));
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: Text('Login', style: textFontses),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  // alignment: Alignment.centerRight,
                                  width: double.maxFinite,
                                  color: Colors.blue,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterUser()),
                                      );
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child:
                                          Text('Register', style: textFontses),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
