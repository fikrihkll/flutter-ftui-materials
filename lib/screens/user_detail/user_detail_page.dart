import 'package:flutter/material.dart';
import 'package:hello_world/models/remote/user_response.dart';
import 'package:hello_world/repositories/user_repository.dart';
import 'package:hello_world/screens/user_detail/widgets/user_detail_widget.dart';

class UserDetailPage extends StatefulWidget {

  final UserResponse entity;
  const UserDetailPage({super.key, required this.entity});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {

  final UserRepository _userRepository = UserRepository();

  UserResponse? _user;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _isLoading ? (
                  const CircularProgressIndicator()
                ) : (
                  _showResult()
                ),
                const SizedBox(height: 16,),
                _showErrorText(),
                const SizedBox(height: 16,),
                MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showResult() {
    if (_user == null) {
      return const Text("Gagal memuat data");
    } else {
      return UserDetailWidget(entity: _user!);
    }
  }
  
  Widget _showErrorText() {
    if (_errorMessage != null) {
      return Text(_errorMessage!, style: const TextStyle(color: Colors.red),);
    }
    return const SizedBox();
  }

  void _getUserData() async {
    var result = await _userRepository.getUserById(widget.entity.id.toString());
    _isLoading = false;

    if (result == null) {
      _errorMessage = result?.statusMessage ?? "Error";
      setState(() {
      });
      return;
    }

    if (result.statusCode == 200 && result.data != null) {
      _user = UserResponse.fromJson(result.data);
    } else {
      _errorMessage = result.statusMessage;
    }
    
    setState(() {
    });
  }

}
