import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:prolific/lib/utils/network_utils/custom_http_client.dart';
import 'package:prolific/lib/utils/network_utils/endpoints.dart';

class OrganizationService {
  final CustomHttpClient _customHttpClient = GetIt.I.get<CustomHttpClient>();
  final Logger _logger = Logger();

  Future<Response> getOrganizationRequest({int? organizationID}) async {
    return await _customHttpClient
        .getRequest('$organizationPath/$organizationID');
  }

  Future<Response> createOrganizationRequest(
      {String? imageUrl, String? name, List<String>? teams}) async {
    Map<String, dynamic> body = {
      "name": name,
      "logo": imageUrl,
      "teams": teams
    };
    _logger.d(body);
    return await _customHttpClient.postRequest(
        path: createOrganizationPath, body: body);
  }

  Future<Response> getMemberListRequest({int? organizationId}) async {
    return await _customHttpClient.getRequest(
      listMembersPath(organizationId),
    );
  }
}
