import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UserRegistrationCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? uid = '',
    String? name = '',
    String? providerName = 'google',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Registration',
      apiUrl: 'http://104.236.195.13/api/user/registration/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'email': email,
        'uid': uid,
        'provider_name': providerName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyOTPCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Verify OTP',
      apiUrl: 'http://104.236.195.13/api/user/verify-otp/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'otp': otp,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? profile(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.profile_created''',
      ));
  static String? refreshToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.refresh''',
      ));
  static String? accessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access''',
      ));
}

class ResendOTPCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Resend OTP',
      apiUrl: 'http://104.236.195.13/api/user/resend-otp/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogoutCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? refresh = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: 'http://104.236.195.13/api/user/logout/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'refresh': refresh,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserProfileCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? userid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Profile',
      apiUrl: 'http://104.236.195.13/api/profile/profiles/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'userid': userid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.username''',
      ));
  static String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_name''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_name''',
      ));
  static String? bio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bio''',
      ));
  static String? profilePic(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.profile_pic''',
      ));
  static int? stars(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user_ratings_count''',
      ));
  static List? favorities(dynamic response) => getJsonField(
        response,
        r'''$.favorite_parcels''',
        true,
      ) as List?;
  static List? parcels(dynamic response) => getJsonField(
        response,
        r'''$.own_parcels''',
        true,
      ) as List?;
  static String? parcelTitle(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.own_parcels[:].title''',
      ));
  static int? starRating(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.own_parcels[:].ratings_count''',
      ));
  static int? ratingCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.own_parcels[:].unique_users_count''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class CreateUserProfileCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? username = '',
    String? firstName = '',
    String? lastName = '',
    String? bio = '',
    FFUploadedFile? profilePic,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create User Profile',
      apiUrl: 'http://104.236.195.13/api/profile/profiles/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'bio': bio,
        'profile_pic': profilePic,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserProfileWithPicCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? username = '',
    String? firstName = '',
    String? lastName = '',
    String? bio = '',
    FFUploadedFile? profilePic,
    String? profileId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Profile with Pic',
      apiUrl: 'http://104.236.195.13/api/profile/profiles/$profileId/',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'bio': bio,
        'profile_pic': profilePic,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserProfileWithoutPicCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? username = '',
    String? firstName = '',
    String? lastName = '',
    String? bio = '',
    String? profileId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Profile without Pic',
      apiUrl: 'http://104.236.195.13/api/profile/profiles/$profileId/',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'bio': bio,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FavoriteParcelCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? parcel = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Favorite Parcel',
      apiUrl: 'http://104.236.195.13/api/profile/favorites/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'parcel': parcel,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FollowUserCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Follow User',
      apiUrl: 'http://104.236.195.13/api/profile/profiles/$userID/follow/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnfollowUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Unfollow User',
      apiUrl: 'http://104.236.195.13/api/profile/profiles/$userID/unfollow/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAccessTokenCall {
  static Future<ApiCallResponse> call({
    String? refresh = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get access token',
      apiUrl: 'http://104.236.195.13/api/token/refresh/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'refresh': refresh,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? access(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access''',
      ));
  static String? refresh(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.refresh''',
      ));
}

class CreateImageParcelCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? contentType = '',
    int? daysToUnlock,
    String? title = '',
    String? description = '',
    FFUploadedFile? parcelImage,
    List<FFUploadedFile>? contentFilesList,
  }) async {
    final contentFiles = contentFilesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'Create Image Parcel',
      apiUrl: 'http://104.236.195.13/api/parcels/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'content_type': contentType,
        'days_to_unlock': daysToUnlock,
        'title': title,
        'description': description,
        'parcel_image': parcelImage,
        'content_files': contentFiles,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateOtherParcelCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? contentType = '',
    int? daysToUnlock,
    String? title = '',
    String? description = '',
    FFUploadedFile? parcelImage,
    FFUploadedFile? contentFiles,
    String? contentText = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create other Parcel',
      apiUrl: 'http://104.236.195.13/api/parcels/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'content_type': contentType,
        'days_to_unlock': daysToUnlock,
        'title': title,
        'description': description,
        'parcel_image': parcelImage,
        'content_files': contentFiles,
        'content_text': contentText,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWarehouseParcelsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Warehouse parcels',
      apiUrl: 'api/warehouse/warehouse/user-parcels/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetParcelByIDCall {
  static Future<ApiCallResponse> call({
    String? parcelId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Parcel by ID',
      apiUrl: 'http://104.236.195.13/api/parcels/$parcelId/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  static List? contentFiles(dynamic response) => getJsonField(
        response,
        r'''$.content_files''',
        true,
      ) as List?;
  static int? contentFilesID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.content_files[:].id''',
      ));
  static String? contentFilesFile(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.content_files[:].file''',
      ));
  static String? contentText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.content_text''',
      ));
}

class GetExplorePageParcelsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get ExplorePage parcels',
      apiUrl: 'http://104.236.195.13/api/parcels/explore/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShipParcelToWarehouseCall {
  static Future<ApiCallResponse> call({
    int? parcel,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Ship parcel to Warehouse',
      apiUrl: 'http://104.236.195.13/api/warehouse/warehouse/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'parcel': parcel,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWarehouseCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Warehouse',
      apiUrl: 'http://104.236.195.13/api/warehouse/warehouse/user-parcels/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? spots(dynamic response) => getJsonField(
        response,
        r'''$.spots''',
        true,
      ) as List?;
}

class ClickParcelCall {
  static Future<ApiCallResponse> call({
    int? warehouseParcelId,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Click parcel',
      apiUrl:
          'http://104.236.195.13/api/warehouse/warehouse/$warehouseParcelId/click/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSortedLibraryCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? sortBy = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get sorted Library',
      apiUrl: 'http://104.236.195.13/api/library/library/sort-library/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'sort_by': sortBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddParcelToLibraryCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? parcel = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Add parcel to Library',
      apiUrl: 'http://104.236.195.13/api/library/library/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'parcel': parcel,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateLibraryFolderCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Library Folder',
      apiUrl: 'http://104.236.195.13/api/library/library-folders/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'name': name,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditLibraryFolderCall {
  static Future<ApiCallResponse> call({
    String? folderId = '',
    String? authToken = '',
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Library Folder',
      apiUrl: 'http://104.236.195.13/api/library/library-folders/$folderId/',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'name': name,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllFoldersCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get all folders',
      apiUrl: 'http://104.236.195.13/api/library/library-folders/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFolderParcelsCall {
  static Future<ApiCallResponse> call({
    String? folderId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get folder parcels',
      apiUrl: 'http://104.236.195.13/api/library/library-folders/$folderId/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFolderCall {
  static Future<ApiCallResponse> call({
    String? folderId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete folder',
      apiUrl: 'http://104.236.195.13/api/library/library-folders/$folderId/',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveParcelFromLibraryCall {
  static Future<ApiCallResponse> call({
    int? parcelId,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Remove parcel from library',
      apiUrl:
          'http://104.236.195.13/api/library/library/$parcelId/remove_parcel/',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddParcelToFolderCall {
  static Future<ApiCallResponse> call({
    String? folderId = '',
    String? authToken = '',
    String? parcelId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Add parcel to folder',
      apiUrl:
          'http://104.236.195.13/api/library/library-folders/$folderId/add_parcel_to_folder/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'parcel_id': parcelId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveParcelFromFolderCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? folderId = '',
    String? parcelId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Remove parcel from folder',
      apiUrl:
          'http://104.236.195.13/api/library/library-folders/$folderId/remove_parcel_from_folder/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'parcel_id': parcelId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
