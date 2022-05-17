

abstract class HyahStates{}


class HyahInitialStates extends HyahStates {}

class HyahGetUserSuccessStates extends HyahStates {}
class HyahGetUserLoadingStates extends HyahStates {}
class HyahGetUserErrorStates extends HyahStates {

  final String error;

  HyahGetUserErrorStates(this.error);
}

class HyahUserUpdateDateState extends HyahStates {}




//======== to get all users data from firebase===================

class HyahGetGetAllUsersSuccessStates extends HyahStates {}
class HyahGetGetAllUsersLoadingStates extends HyahStates {}
class HyahGetGetAllUsersErrorStates extends HyahStates {

  final String error;

  HyahGetGetAllUsersErrorStates(this.error);
}

//======================================
class HyahGetPostsSuccessStates extends HyahStates {}
class HyahGetPostsLoadingStates extends HyahStates {}
class HyahGetPostsErrorStates extends HyahStates {

  final String error;

  HyahGetPostsErrorStates(this.error);
}


class HyahLikePostsSuccessStates extends HyahStates {}
class HyahLikePostsLoadingStates extends HyahStates {}
class HyahLikePostsErrorStates extends HyahStates {

  final String error;

  HyahLikePostsErrorStates(this.error);
}


class HyahChangeBottomNavState extends HyahStates {}


class HyahNewPostNavState extends HyahStates {}




class HyahProfileImagePickedSuccessState extends HyahStates {}
class HyahProfileImagePickedErrorState extends HyahStates {}




class HyahCoverImagePickedSuccessState extends HyahStates {}
class HyahCoverImagePickedErrorState extends HyahStates {}

class HyahUploadProfileImageSuccessState extends HyahStates {}
class HyahUploadProfileImageErrorState extends HyahStates {}



class HyahUploadCoverImageSuccessState extends HyahStates {}
class HyahUploadCoverImageErrorState extends HyahStates {}

class HyahUserUpdateSuccessState extends HyahStates {}
class HyahUserUpdateErrorState extends HyahStates {}

class HyahUserUpdateLoadingState extends HyahStates {}

//  ================== create post ======================================
class HyahCreatePostSuccessState extends HyahStates {}
class HyahCreatePostErrorState extends HyahStates {}
class HyahCreatePostLoadingState extends HyahStates {}
class HyahPostImagePickedSuccessState extends HyahStates {}
class HyahPostImagePickedErrorState extends HyahStates {}
class HyahRemovePostImageState extends HyahStates {}

//==================================================

class HyahSendMessageSuccessState extends HyahStates {}
class HyahSendMessageErrorState extends HyahStates {}

class HyahGetMessageSuccessState extends HyahStates {}
class HyahGetMessageErrorState extends HyahStates {}

//================== mode ======

class NewsChangeModeState extends HyahStates {}


//===================================