import 'package:flutter/material.dart';
import 'package:hello_world/models/remote/user_response.dart';
import 'package:hello_world/models/request_result.dart';
import 'package:hello_world/repositories/user_repository.dart';
import 'package:hello_world/screens/home/widgets/user_card_widget.dart';
import 'package:hello_world/screens/user_detail/widgets/user_detail_widget.dart';
import 'package:hello_world/utils/remote_helper.dart';

class UserDetailPage extends StatefulWidget {

  final UserResponse entity;
  const UserDetailPage({super.key, required this.entity});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {

  final UserRepository _userRepository = RemoteHelper.getUserRepository();

  RequestResult<UserResponse>? _requestResult;
  bool _isLoading = true;

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
    if (_requestResult == null) {
      return const Text("Gagal memuat data");
    }

    if (_requestResult!.isSuccess) {
      return UserDetailWidget(entity: _requestResult!.data!);
    } else {
      return Text("Error: ${_requestResult!.message}");
    }
  }

  void _getUserData() async {
    var result = await _userRepository.getUserById(widget.entity.id.toString());
    _isLoading = false;
    _requestResult = result;
    setState(() {
    });
  }

}
