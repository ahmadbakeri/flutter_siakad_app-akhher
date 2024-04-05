import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/variables.dart';
import '../models/response/toplist_response_model.dart';
import 'auth_local_datasource.dart';

class ToplistRemoteDatasource {
  Future<Either<String, ToplistResponseModel>> getToplist() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Beaerer ${await AuthLocalDatasource().getToken()}',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/toplists'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(ToplistResponseModel.fromJson(response.body));
    }else{
      return const Left('server error');
    }
  }
}
