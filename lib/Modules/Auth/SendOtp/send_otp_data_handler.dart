import 'package:dartz/dartz.dart';
import '../../../Models/otp_model.dart';
import '../../../Utilities/api_end_point.dart';
import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';


class SendOtpDataHandler{
  static Future<Either<Failure,OtpModel>> sendOtp({required String otp})async{
    try {
      OtpModel response = await GenericRequest<OtpModel>(
        method: RequestApi.post(url: APIEndPoint.sendOtp, body: {
          "otp":otp,
        }),
        fromMap: OtpModel.fromJson,
      ).getObject();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}