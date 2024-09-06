import 'package:vncss/app/data/model/response/list_awb_response.dart';


abstract class ListBoxesTrackingRepository {

  @override
  Future<ListAWBDetailResponse> getAwbBoxesTracking({required int id, int? exploitStatus, String? code});

}