abstract class To_State {}

class Inisional_state extends To_State {}

class Change_state extends To_State {}

class CreatDataBase_state extends To_State {}

class GetDataBase_state extends To_State {}

class InsertDataBase_state extends To_State {}

class UpdateDataBase_state extends To_State {}

class DeletDataBase_state extends To_State {}

class LoginInitialState extends To_State {}

class LoginLoadingState extends To_State {}

class LoginSuccessState extends To_State {
  final String uId;
  LoginSuccessState(
    this.uId,
  );
}

class LoginErrorState extends To_State {
  final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends To_State {}

class RegisterSuccessState extends To_State {}

class RegisterErrorState extends To_State {
  final String error;

  RegisterErrorState(this.error);
}

class LoginChangeState extends To_State {}

class CreatUserLoadingState extends To_State {}

class CreatUserSuccessState extends To_State {}

class CreatUserErrorState extends To_State {
  final String error;

  CreatUserErrorState(this.error);
}
