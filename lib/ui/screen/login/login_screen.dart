import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flutter/bloc/login_bloc.dart';
import 'package:login_flutter/ui/screen/dashboard/dashboard_screen.dart';
import 'package:login_flutter/values/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passwordController.clear();
    usernameController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (_, state) {
          if (state is LoginSuccsess) {
            Navigator.pushReplacementNamed(_, DashboardScreen.routeName);
          } else if (state is LoginError) {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Material Dialog'),
                  content: Text('Hey! I am Coflutter!'),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: _formKey,
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
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                        child: Text('Login', style: textFonts),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: double.infinity,
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
                              SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: usernameController,
                                  validator: (e) {
                                    if (e?.isEmpty ?? true) {
                                      return 'masukan email';
                                    }
                                  },
                                  obscureText: false,
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
                                  validator: (e) {
                                    if (e?.isEmpty ?? false) {
                                      return 'masukan password';
                                    }
                                  },
                                  obscureText: true,
                                  controller: passwordController,
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
                                      if (_formKey.currentState?.validate() ??
                                          true) {
                                        context.read<LoginBloc>().add(
                                              GetLoginEvent(
                                                  email:
                                                      usernameController.text,
                                                  password:
                                                      passwordController.text),
                                            );
                                      }
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
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           const RegisterUser()),
                                      // );
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
