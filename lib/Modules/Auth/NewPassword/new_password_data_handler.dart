import 'package:dartz/dartz.dart';
import '../../../Models/user_model.dart';
import '../../../Utilities/api_end_point.dart';
import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';


class NewPasswordDataHandler{
  static Future<Either<Failure,UserModel>> confirm({required String newPassword,required String confirmPassword})async{
    try {
      UserModel response = await GenericRequest<UserModel>(
        method: RequestApi.post(url: APIEndPoint.newPassword, body: {
          "new_password":newPassword,
          "confirm_password":confirmPassword
        }),
        fromMap: UserModel.fromJson,
      ).getObject();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}