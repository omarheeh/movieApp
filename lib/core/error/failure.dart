class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class FireBaseFailure extends Failure {
  FireBaseFailure(super.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
}

class PickImageFailure extends Failure {
  PickImageFailure(super.errMessage);
}
