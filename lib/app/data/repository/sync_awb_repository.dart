import '../model/response/sync_awb_response.dart';

abstract class SyncAwbRepository {

  Future<SyncAwbResponse> getSyncAwb();

  Future postSyncAwb({required Map<String, dynamic> payload});


}
