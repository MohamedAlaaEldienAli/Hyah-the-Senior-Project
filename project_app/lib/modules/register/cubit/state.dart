abstract class HyahRegisterStates {}



//========================= sign out and reset pas================

class HyahSignOutSuccessState extends HyahRegisterStates {}
class HyahSignOutLoadingState extends HyahRegisterStates {}
class HyahSignOutErrorState extends HyahRegisterStates {}


class HyahResetPasswordLoadingStates extends HyahRegisterStates {}
class HyahResetPasswordSuccessState extends HyahRegisterStates {}
class HyahResetPasswordErrorState extends HyahRegisterStates {}



//================================================

class HyahRegisterInitialState extends HyahRegisterStates{}

class HyahRegisterLoadingState extends HyahRegisterStates{}

class HyahRegisterSuccessState extends HyahRegisterStates{}

class HyahRegisterErrorState extends HyahRegisterStates{

  final String error ;

  HyahRegisterErrorState(this.error);

}
class HyahCreateUserSuccessState extends HyahRegisterStates{}

class HyahCreateUserErrorState extends HyahRegisterStates{

  final String error ;

  HyahCreateUserErrorState(this.error);

}


class HyahRegisterChangePasswordVisibilityStates extends HyahRegisterStates {}
class onPasswordChangedState extends HyahRegisterStates {}

class HyahLoadingState extends HyahRegisterStates {}

class HyahUploadIdCardImageSuccessState extends HyahRegisterStates {}
class HyahUploadIdCardImageErrorState extends HyahRegisterStates {}
class HyahIdCardImagePickedSuccessState extends HyahRegisterStates {}
class HyahIdCardImagePickedErrorState extends HyahRegisterStates {}

class HyahUploadDrivingLicenseImageSuccessState extends HyahRegisterStates {}
class HyahUploadDrivingLicenseImageErrorState extends HyahRegisterStates {}
class HyahDrivingLicenseImagePickedSuccessState extends HyahRegisterStates {}
class HyahDrivingLicenseImagePickedErrorState extends HyahRegisterStates {}

class HyahVaccineImageLoadingState extends HyahRegisterStates {}
class HyahUploadVaccineImageSuccessState extends HyahRegisterStates {}
class HyahUploadVaccineImageErrorState extends HyahRegisterStates {}
class HyahVaccineImagePickedSuccessState extends HyahRegisterStates {}
class HyahVaccineImagePickedErrorState extends HyahRegisterStates {}

