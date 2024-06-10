import 'package:bloc/bloc.dart';
import 'package:hello_world/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository userRepository;
  LoginBloc({
    required this.userRepository
  }) : super(LoginInitial()) {
    on<RunLoginEvent>((event, emit) async {
      var email = event.email;
      var password = event.password;

      if (email.isEmpty) {
        emit(LoginError(message: "Email tidak boleh kosong!"));
        return;
      }
      if (password.isEmpty) {
        emit(LoginError(message: "Email tidak boleh kosong!"));
        return;
      }

      emit(LoginLoading());

      var result = await userRepository.login(email, password);
      if (result.isSuccess) {
        emit(LoginSuccessful());
      } else {
        emit(LoginError(message: result.message));
      }
    });
    on<CheckLoginStatusEvent>((event, emit) async {
      var tokenExist = await userRepository.tokenExist();
      if (tokenExist) {
        emit(AlreadyLogin());
      }
    });
    on<ClearLoginDataEvent>((event, emit) async {
      await userRepository.clearToken();
      emit(LoginCleared());
    });
  }
}
