class DataState {}

final class Datainital extends DataState {}

final class GetCatgoriesLoading extends DataState {}

final class GetCatgoriesSucess extends DataState {}

final class GetCatgoriesFailure extends DataState {
  final String errMessage;

  GetCatgoriesFailure({required this.errMessage});
}


final class DataLoaded extends DataState {}

final class UploadPostLoading extends DataState {}

final class UploadPostSucess extends DataState {}

final class UploadPostFailed extends DataState {
  final String errMessage;

  UploadPostFailed({required this.errMessage});
}


final class GetWorkersLoading extends DataState {}

final class GetWorkersSucess extends DataState {}

final class GetWorkersFailed extends DataState {
  final String errMessage;

  GetWorkersFailed({required this.errMessage});
}

class SendMessageSuccessState extends DataState{}

class SendMessageLoadingState extends DataState{}

class GetMessageSuccessState extends DataState{}

class GetMessageLoadingState extends DataState{}
class GetUsersDataSuccessState extends DataState{}


class GetUsersLoadingState extends DataState{}
class FailedToGetUsersDataState extends DataState{}
class GetMessagesSuccessState extends DataState{}
class GetMessagesFailureState extends DataState{}
class GetMessagesLoadingState extends DataState{}