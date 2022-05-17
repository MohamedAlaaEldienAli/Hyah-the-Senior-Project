abstract class HyahLoginStates {}

class HyahLoginInitialState extends HyahLoginStates{}

class HyahLoginLoadingState extends HyahLoginStates{}

class HyahLoginSuccessState extends HyahLoginStates{

  final String state;
  final String Uid;


  HyahLoginSuccessState(this.state ,this.Uid);
}

class HyahLoginErrorState extends HyahLoginStates{
  final String error;

  HyahLoginErrorState(this.error);

}

class HyahChangePasswordVisabilityState extends HyahLoginStates{}