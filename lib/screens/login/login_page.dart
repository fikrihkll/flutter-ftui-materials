import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/blocs/login/login_bloc.dart';
import 'package:hello_world/repositories/user_repository.dart';
import 'package:hello_world/screens/home/home_page.dart';
import 'package:hello_world/utils/remote_helper.dart';
import 'package:hello_world/utils/shared_preference_helper.dart';
import 'package:hello_world/widgets/loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginBloc _loginBloc = LoginBloc(
      userRepository: UserRepository(
          RemoteHelper.getDio(), SharedPreferenceHelper.getInstance()));

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  late ThemeData _theme;

  @override
  void initState() {
    _loginBloc.add(CheckLoginStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return BlocProvider<LoginBloc>(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            _isLoading = true;
            setState(() {
            });
          } else if (state is LoginSuccessful) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
          } else if (state is AlreadyLogin) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
          } else if (state is LoginError) {
            _isLoading = false;
            _showSnackbar(state.message);
            setState(() {
            });
          }
        },
        child: Scaffold(
            body: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey.withAlpha(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: _theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text("Login", style: _theme.textTheme.headlineMedium,)
                              ),
                              Center(
                                  child: Text("Username: 'emilys' Password: 'emilyspass'", style: _theme.textTheme.bodySmall,)
                              ),
                              const SizedBox(height: 32,),
                              const Text("Username"),
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                    hintText: "Type your username"
                                ),
                              ),
                              const SizedBox(height: 16,),
                              const Text("Password"),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Type your password",
                                ),
                              ),
                              const SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(
                                    child: LoadingButton(
                                      isLoading: _isLoading,
                                      onPressed: () {
                                        _loginBloc.add(
                                            RunLoginEvent(
                                                email: _emailController.text,
                                                password: _passwordController.text
                                            )
                                        );
                                      },
                                      text: "Login",
                                    )
                                  ),
                                ],
                              ),

                            ]
                        ),
                      ),
                    ],
                  ),
                )
            )
        ),
      ),
    );
  }

  void _login() async {
   _loginBloc.add(RunLoginEvent(email: _emailController.text, password: _passwordController.text));
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }

}
