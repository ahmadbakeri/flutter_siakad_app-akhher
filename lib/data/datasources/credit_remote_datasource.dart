import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/variables.dart';
import '../models/response/credit_response_model.dart';
import 'auth_local_datasource.dart';

class CreditRemoteDatasource {
  Future<Either<String, CreditResponseModel>> getCredits() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDatasource().getToken()}'
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/credits'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(CreditResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
