import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flutter/bloc/bloc/pendaftaran_bloc.dart';
import 'package:login_flutter/bloc/login_bloc.dart';
import 'package:login_flutter/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => PendaftaranBloc(),
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
