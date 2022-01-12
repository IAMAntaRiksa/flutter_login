import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flutter/bloc/bloc/pendaftaran_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PendaftaranBloc>().add(FetchPendaftaran());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: BlocBuilder<PendaftaranBloc, PendaftaranState>(
        builder: (context, state) {
          if (state is PendaftaranLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PendaftaranError) {
            return Column(
              children: const [
                Text('refresh data'),
              ],
            );
          } else if (state is PendaftaranSuccess) {
            return ListView.builder(
              itemCount: state.materi.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [Text(state.materi[index].judul)],
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
