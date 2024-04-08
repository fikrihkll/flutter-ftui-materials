import 'package:flutter/material.dart';
import 'package:hello_world/number_counter/number_counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _textInputController = TextEditingController();
  final NumberCounterBloc numberCounterBloc = NumberCounterBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NumberCounterBloc>(create: (_) => numberCounterBloc)
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textInputController,
              ),
              const SizedBox(height: 16,),
              MaterialButton(
                  color: Colors.blue,
                  child: Text("Tambahkan Angka"),
                  onPressed: () {
                    numberCounterBloc.add(AddNumberEvent(inputNumber: _textInputController.text));
                  }
              ),
              const SizedBox(height: 16,),
              BlocBuilder<NumberCounterBloc, NumberCounterState>(
                  builder: (context, state) {
                    if (state is AddNumberInitialState) {
                      return Text("Selamat Datang");
                    } else if (state is AddNumberSuccessState) {
                      return Text("Hasil Penjumlahan: ${state.result}");
                    } else if (state is AddNumberLoadingState) {
                      return CircularProgressIndicator();
                    } else if (state is AddNumberFailedState) {
                      return Text("Penjumlahan gagal: ${state.message}");
                    } else {
                      throw Exception("Unhandled state");
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
