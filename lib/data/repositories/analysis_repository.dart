import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/sources/analysis/get_analysis_source.dart';
import 'package:trashtrack_user/models/analysis/analysis.dart';

typedef FESLT = Future<Either<String, List<Analysis>>>;

class AnalysisRepository {
  GetAnalysisSource getAnalysisSource;

  AnalysisRepository({
    required this.getAnalysisSource,
  });

  FESLT getAnalysis() async {
    return await getAnalysisSource.getAnalysis();
  }
}
