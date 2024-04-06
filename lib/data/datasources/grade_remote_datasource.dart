import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/variables.dart';
import '../models/response/grade_response_model.dart';
import 'auth_local_datasource.dart';

class GradeRemoteDatasource {
  Future<Either<String, GradeResponseModel>> getGrades() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDatasource().getToken()}'
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/grades'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(GradeResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
