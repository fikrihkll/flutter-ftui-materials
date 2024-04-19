import 'package:flutter/material.dart';
import 'package:hello_world/data/services/user_service.dart';
import 'package:hello_world/models/remote/user_response.dart';
import 'package:hello_world/repositories/user_repository.dart';
import 'package:hello_world/screens/home/widgets/user_card_widget.dart';
import 'package:hello_world/screens/user_detail/user_detail_page.dart';
import 'package:hello_world/utils/remote_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final UserRepository _userRepository = RemoteHelper.getUserRepository();

  final List<UserResponse> _users = [];

  @override
  void initState() {
    _getUsersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text("User List", style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: 16,),
              Expanded(
                child: ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, position) {
                      return UserCardWidget(
                          entity: _users[position],
                          onCardClicked: _onCardClicked,
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCardClicked(UserResponse entity) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailPage(entity: entity)));
  }

  void _getUsersData() async {
    var result = await _userRepository.getAllUsers();

    if (result.isSuccess && result.data != null) {
      _users.clear();
      _users.addAll(result.data!);
      setState(() {
      });
    } else {
      _showMessage("Gagal: ${result.message}");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

}
