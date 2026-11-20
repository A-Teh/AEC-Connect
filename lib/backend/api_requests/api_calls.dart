import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Color, DateTimeRange;
// Redundant when the data-type schema export already re-exports it.
// ignore: unnecessary_import
import 'package:from_css_color/from_css_color.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class QueryURICourseCall {
  static Future<ApiCallResponse> call({
    String? courseCode = 'CSC305',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Query URI Course',
      apiUrl:
          'https://uri.kuali.co/api/v1/catalog/courses/67d1d5f37a3472af016158a7',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': courseCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? courseCode(dynamic response) => (getJsonField(
        response,
        r'''$[:].__catalogCourseId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? courseTitle(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
  if (item is DateTime) {
    return item.toIso8601String();
  }
  if (item is Color) {
    return item.toCssString();
  }
  if (item is LatLng) {
    return item.serialize();
  }
  if (item is DateTimeRange) {
    String millis(DateTime d) =>
        '${d.isUtc ? 'u' : 'l'}${d.millisecondsSinceEpoch}';
    return '${millis(item.start)}|${millis(item.end)}';
  }
  if (item is FFPlace) {
    return jsonEncode({
      'latLng': item.latLng.serialize(),
      'name': item.name,
      'address': item.address,
      'city': item.city,
      'state': item.state,
      'country': item.country,
      'zipCode': item.zipCode,
    });
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
