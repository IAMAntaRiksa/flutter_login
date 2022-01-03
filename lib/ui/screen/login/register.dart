// import 'package:flutter/material.dart';
// import 'package:login_flutter/bloc/login_bloc.dart';
// import 'package:login_flutter/values/style.dart';
// import 'package:provider/src/provider.dart';

// class RegisterUser extends StatefulWidget {
//   const RegisterUser({Key? key}) : super(key: key);
//   static const String routeName = '/registrasi';

//   @override
//   State<RegisterUser> createState() => _RegisterUserState();
// }

// class _RegisterUserState extends State<RegisterUser> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   late TextEditingController usernameController;
//   late TextEditingController passwordController;
//   late TextEditingController confrimPassController;
//   late TextEditingController emailController;

//   @override
//   void initState() {
//     usernameController = TextEditingController();
//     passwordController = TextEditingController();
//     confrimPassController = TextEditingController();
//     emailController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register User'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               child: TextFormField(
//                 validator: (e) {
//                   if (e!.isEmpty) {
//                     return 'Masukan Username';
//                   }
//                 },
//                 controller: usernameController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: const Color(0xFFe7edeb),
//                   hintText: "Username",
//                   prefixIcon:
//                       Icon(Icons.account_circle, color: Colors.grey.shade500),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               child: TextFormField(
//                 validator: (e) {
//                   if (e!.isEmpty) {
//                     return 'Masukan Password';
//                   }
//                 },
//                 controller: passwordController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: const Color(0xFFe7edeb),
//                   hintText: "Password",
//                   prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               child: TextFormField(
//                 validator: (e) {
//                   if (e!.isEmpty) {
//                     return 'Masukan password';
//                   }
//                 },
//                 controller: confrimPassController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: const Color(0xFFe7edeb),
//                   hintText: "Confrim_password",
//                   prefixIcon:
//                       Icon(Icons.verified_user, color: Colors.grey.shade500),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               child: TextFormField(
//                 validator: (e) {
//                   if (e!.isEmpty) {
//                     return 'Masukan Email';
//                   }
//                 },
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: const Color(0xFFe7edeb),
//                   hintText: "Email",
//                   prefixIcon: Icon(Icons.email, color: Colors.grey.shade500),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Container(
//                 width: double.maxFinite,
//                 color: Colors.blue,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     context.read<LoginBloc>().add(
//                           GetRegestrasiUserEvent(
//                             username: usernameController.text,
//                             password: passwordController.text,
//                             confrimPassword: confrimPassController.text,
//                             email: emailController.text,
//                           ),
//                         );
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     child: Text('Daftarkan Account ', style: textFontses),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
