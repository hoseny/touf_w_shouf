import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/networking/api_failure.dart';
import 'package:touf_w_shouf/core/networking/api_service.dart';
import 'package:touf_w_shouf/features/program_details/data/models/program_details_model.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo.dart';

class ProgramDetailsRepoImpl extends ProgramDetailsRepo {
  final ApiService apiService;

  ProgramDetailsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ProgramDetailsModel>> getProgramDetails(
      {required String programCode,
      required String programYear,
      required String lang}) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.programDetails(
          programCode: programCode,
          programYear: programYear,
          lang: lang,
        ),
      );
      final programDetails =
          (response['items'] != null && response['items'].isNotEmpty)
              ? ProgramDetailsModel.fromJson(response['items'][0])
              : ProgramDetailsModel(
                  progCode: -1,
                  programName: 'Unknown Program',
                  language: 'Not Available',
                  programYear: 0,
                  startPrice: 0,
                  startDate: 'Not Available',
                  endDate: 'Not Available',
                  day: 0,
                  classTrip: 'Not Available',
                  city: 'Not Available',
                  overview: 'No overview available',
                  tourIncluding: 'No inclusions specified',
                  tourExcluding: 'No exclusions specified',
                );
      return Right(programDetails);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
