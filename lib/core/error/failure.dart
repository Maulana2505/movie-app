// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  final massage;
  Failure({
    required this.massage,
  });
}

class ServerFailure extends Failure{
  ServerFailure({required super.massage});
}
