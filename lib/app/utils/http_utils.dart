// ignore_for_file: empty_catches

import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';

import 'package:clashmi/app/runtime/return_result.dart';
//import 'package:http/http.dart' as http;
import 'package:clashmi/app/utils/app_utils.dart';
import 'package:clashmi/app/utils/log.dart';
import 'package:punycode_converter/punycode_converter.dart';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;

typedef DecodeCallback = String Function(String);

abstract final class HttpUtils {
  static const String _proxy = "PROXY 127.0.0.1:8888";

  static Future<String> getUserAgent() async {
    String version = AppUtils.getBuildinVersion();
    final coreVersion = AppUtils.getCoreVersion();
    return "ClashMi/$version platform/${Platform.operatingSystem} ClashMeta/$coreVersion; mihomo/$coreVersion";
  }

  static Future<ReturnResult<Tuple2<int, HttpHeaders>>> httpHeadRequest(
      Uri uri, int? proxyPort, Duration? timeout) async {
    timeout ??= const Duration(seconds: 20);
    var client = HttpClient();
    client.userAgent = await getUserAgent();
    client.connectionTimeout = timeout;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    try {
      HttpClientRequest request = await client.headUrl(uri).timeout(timeout);
      request.headers.set(HttpHeaders.acceptHeader, "*/*");
      HttpClientResponse? response = await Future.any([
        waitResponseDone(request, null),
        waitResponseTimeout(request, timeout)
      ]);

      if (response == null) {
        return ReturnResult(
            error: ReturnResultError(
                "http response timeout after ${timeout.inSeconds} seconds"));
      }

      return ReturnResult(data: Tuple2(response.statusCode, response.headers));
    } catch (err, _) {
      Log.i('http HeadRequest ${uri.toString()} exception: ${err.toString()}');
      return ReturnResult(
          error: ReturnResultError("http exception: ${err.toString()}"));
    } finally {
      client.close(force: true);
    }
  }

  static Future<List<ReturnResult<HttpHeaders>>> httpDownloadList(
      List<Tuple2<Uri, String>> uris,
      int? proxyPort,
      String? userAgent,
      Duration? timeout) async {
    if (uris.isEmpty) {
      return [ReturnResult(error: ReturnResultError("uris is empty"))];
    }
    if (uris.length == 1) {
      return [
        await httpDownload(
            uris[0].item1, uris[0].item2, proxyPort, userAgent, timeout)
      ];
    }
    return Future.wait(uris.map((item) =>
        httpDownload(item.item1, item.item2, proxyPort, userAgent, timeout)));
  }

  static Future<ReturnResult<HttpHeaders>> httpDownload(Uri uri, String path,
      int? proxyPort, String? userAgent, Duration? timeout) async {
    timeout ??= const Duration(seconds: 60);
    var client = HttpClient();
    client.badCertificateCallback = _certificateCheck;
    client.userAgent = userAgent == null || userAgent.isEmpty
        ? await getUserAgent()
        : userAgent;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    try {
      HttpClientRequest request = await client.getUrl(uri).timeout(timeout);
      request.headers.set(HttpHeaders.acceptHeader, "*/*");
      //request.cookies.add(Cookie("expire_in", "1689576560"));
      HttpClientResponse? response = await Future.any([
        waitResponseDone(request, path),
        waitResponseTimeout(request, timeout)
      ]);

      if (response == null) {
        return ReturnResult(
            error: ReturnResultError(
                "http response timeout after ${timeout.inSeconds} seconds"));
      }
      if (response.statusCode != 200) {
        return ReturnResult(
            error:
                ReturnResultError("http statusCode: ${response.statusCode}"));
      }
      return ReturnResult(data: response.headers);
    } catch (err, _) {
      Log.i('http Download ${uri.toString()} exception: ${err.toString()}');
      return ReturnResult(
          error: ReturnResultError("http exception: ${err.toString()}"));
    } finally {
      client.close(force: true);
    }
  }

  static Future<ReturnResultError?> httpUpload(
      Uri uri, String path, int? proxyPort, String? userAgent) async {
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    var client = HttpClient();
    client.badCertificateCallback = _certificateCheck;
    client.userAgent = userAgent == null || userAgent.isEmpty
        ? await getUserAgent()
        : userAgent;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }

    try {
      var request = http.MultipartRequest("POST", uri);
      request.files.add(await http.MultipartFile.fromPath(
        'files',
        path,
      ));

      IOClient ioclient = IOClient(client);
      var response = await ioclient.send(request);

      if (response.statusCode != 200) {
        return ReturnResultError("http statusCode:${response.statusCode}");
      }
    } catch (err, _) {
      Log.i('http Upload ${uri.toString()} exception: ${err.toString()}');
      return ReturnResultError("http exception: ${err.toString()}");
    } finally {
      client.close(force: true);
    }
    return null;
  }

  static Future<ReturnResult<String>> httpGetRequest(
      String url,
      int? proxyPort,
      Map<String, String>? headers,
      Duration? timeout,
      String? userAgent,
      List<Cookie>? cookies,
      {bool? noResponseBody}) async {
    timeout ??= const Duration(seconds: 30);
    var client = HttpClient();
    client.badCertificateCallback = _certificateCheck;
    client.userAgent = userAgent == null || userAgent.isEmpty
        ? await getUserAgent()
        : userAgent;
    client.connectionTimeout = timeout;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }
    var uri = Uri.parse(url);
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    try {
      HttpClientRequest request = await client.getUrl(uri).timeout(timeout);
      request.headers.set(HttpHeaders.acceptHeader, "*/*");
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.set(key, value);
        });
      }
      HttpClientResponse? response = await Future.any([
        waitResponseDone(request, null),
        waitResponseTimeout(request, timeout)
      ]);

      if (response == null) {
        return ReturnResult(
            error: ReturnResultError(
                "http response timeout after ${timeout.inSeconds} seconds"));
      }
      if (response.statusCode != 200) {
        return ReturnResult(
            error:
                ReturnResultError("http statusCode: ${response.statusCode}"));
      }
      if (noResponseBody == true) {
        return ReturnResult(data: "");
      }
      var stringData = await response.transform(utf8.decoder).join();
      return ReturnResult(data: stringData);
    } catch (err, _) {
      Log.i('http GetRequest $url exception: ${err.toString()}');
      return ReturnResult(
          error: ReturnResultError("http exception: ${err.toString()}"));
    } finally {
      client.close(force: true);
    }
  }

  static Future<ReturnResult<String>> httpPostRequest(
      String url,
      int? proxyPort,
      Map<String, String>? headers,
      String body,
      Duration? timeout,
      String? userAgent,
      List<Cookie>? cookies,
      List<Cookie>? responseCookies) async {
    timeout ??= const Duration(seconds: 30);
    var client = HttpClient();
    client.userAgent = userAgent == null || userAgent.isEmpty
        ? await getUserAgent()
        : userAgent;
    client.connectionTimeout = timeout;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }
    var uri = Uri.parse(url);
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    try {
      HttpClientRequest request = await client.postUrl(uri).timeout(timeout);
      request.headers.set(HttpHeaders.acceptHeader, "*/*");
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.set(key, value);
        });
      }
      if (cookies != null) {
        request.cookies.addAll(cookies);
      }

      if (body.isNotEmpty) {
        var bytes = request.encoding.encode(body);
        request.headers
            .set(HttpHeaders.contentLengthHeader, bytes.length.toString());

        request.add(bytes);
      }
      HttpClientResponse? response = await Future.any([
        waitResponseDone(request, null),
        waitResponseTimeout(request, timeout)
      ]);

      if (response == null) {
        return ReturnResult(
            error: ReturnResultError(
                "http response timeout after ${timeout.inSeconds} seconds"));
      }
      if (response.statusCode != 200) {
        return ReturnResult(
            error:
                ReturnResultError("http statusCode: ${response.statusCode}"));
      }
      var stringData = await response.transform(utf8.decoder).join();
      if (responseCookies != null) {
        for (var cookie in response.cookies) {
          responseCookies.add(Cookie(cookie.name, cookie.value));
        }
      }

      return ReturnResult(data: stringData);
    } catch (err) {
      Log.i('http PostRequest $url exception: ${err.toString()}');
      return ReturnResult(
          error: ReturnResultError("http exception: ${err.toString()}"));
    } finally {
      client.close(force: true);
    }
  }

  static Future<ReturnResult<String>> httpPutRequest(
      String url,
      int? proxyPort,
      Map<String, String>? headers,
      String body,
      Duration? timeout,
      String? userAgent,
      List<Cookie>? cookies,
      List<Cookie>? responseCookies) async {
    timeout ??= const Duration(seconds: 20);
    var client = HttpClient();
    client.userAgent = userAgent == null || userAgent.isEmpty
        ? await getUserAgent()
        : userAgent;
    client.connectionTimeout = timeout;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }
    var uri = Uri.parse(url);
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    try {
      HttpClientRequest request = await client.putUrl(uri).timeout(timeout);
      request.headers.set(HttpHeaders.acceptHeader, "*/*");
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.set(key, value);
        });
      }
      if (cookies != null) {
        request.cookies.addAll(cookies);
      }

      if (body.isNotEmpty) {
        var bytes = request.encoding.encode(body);
        request.headers
            .set(HttpHeaders.contentLengthHeader, bytes.length.toString());

        request.add(bytes);
      }
      HttpClientResponse? response = await Future.any([
        waitResponseDone(request, null),
        waitResponseTimeout(request, timeout)
      ]);

      if (response == null) {
        return ReturnResult(
            error: ReturnResultError(
                "http response timeout after ${timeout.inSeconds} seconds"));
      }
      if (response.statusCode != 200 && response.statusCode != 204) {
        return ReturnResult(
            error: ReturnResultError("http statusCode:${response.statusCode}"));
      }
      var stringData = await response.transform(utf8.decoder).join();
      if (responseCookies != null) {
        for (var cookie in response.cookies) {
          responseCookies.add(Cookie(cookie.name, cookie.value));
        }
      }

      return ReturnResult(data: stringData);
    } catch (err) {
      Log.i('http PutRequest $url exception: ${err.toString()}');
      return ReturnResult(
          error: ReturnResultError("http exception: ${err.toString()}"));
    } finally {
      client.close(force: true);
    }
  }

  static Future<ReturnResult<String>> httpPatchRequest(
      String url,
      int? proxyPort,
      Map<String, String>? headers,
      String body,
      Duration? timeout,
      String? userAgent,
      List<Cookie>? cookies) async {
    timeout ??= const Duration(seconds: 20);
    var client = HttpClient();
    client.userAgent = userAgent == null || userAgent.isEmpty
        ? await getUserAgent()
        : userAgent;
    client.connectionTimeout = timeout;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }
    var uri = Uri.parse(url);
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    try {
      HttpClientRequest request = await client.patchUrl(uri).timeout(timeout);
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.set(key, value);
        });
      } else {
        request.headers.set(
            HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
        request.headers.set(HttpHeaders.acceptHeader, "*/*");
      }
      if (cookies != null) {
        request.cookies.addAll(cookies);
      }

      if (body.isNotEmpty) {
        var bytes = request.encoding.encode(body);
        request.headers
            .set(HttpHeaders.contentLengthHeader, bytes.length.toString());

        request.add(bytes);
      }
      HttpClientResponse? response = await Future.any([
        waitResponseDone(request, null),
        waitResponseTimeout(request, timeout)
      ]);

      if (response == null) {
        return ReturnResult(
            error: ReturnResultError(
                "http response timeout after ${timeout.inSeconds} seconds"));
      }
      if (response.statusCode != 200 && response.statusCode != 204) {
        return ReturnResult(
            error: ReturnResultError("http statusCode:${response.statusCode}"));
      }
      var stringData = await response.transform(utf8.decoder).join();
      return ReturnResult(data: stringData);
    } catch (err) {
      Log.i('http PatchRequest $url exception: ${err.toString()}');
      return ReturnResult(
          error: ReturnResultError("http exception: ${err.toString()}"));
    } finally {
      client.close(force: true);
    }
  }

  static Future<ReturnResult<String>> httpDeleteRequest(
      String url,
      int? proxyPort,
      Map<String, String>? headers,
      String body,
      Duration? timeout,
      String? userAgent,
      List<Cookie>? cookies) async {
    timeout ??= const Duration(seconds: 20);
    var client = HttpClient();
    client.userAgent = userAgent == null || userAgent.isEmpty
        ? await getUserAgent()
        : userAgent;
    client.connectionTimeout = timeout;
    if ((proxyPort != null) && (proxyPort != 0)) {
      client.findProxy = (Uri uri) => "PROXY 127.0.0.1:$proxyPort";
    }
    var uri = Uri.parse(url);
    try {
      uri = uri.punyEncoded;
    } catch (err) {}
    try {
      HttpClientRequest request = await client.deleteUrl(uri).timeout(timeout);
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.set(key, value);
        });
      } else {
        request.headers.set(
            HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
        request.headers.set(HttpHeaders.acceptHeader, "*/*");
      }
      if (cookies != null) {
        request.cookies.addAll(cookies);
      }
      if (body.isNotEmpty) {
        var bytes = request.encoding.encode(body);
        request.headers
            .set(HttpHeaders.contentLengthHeader, bytes.length.toString());

        request.add(bytes);
      }
      HttpClientResponse? response = await Future.any([
        waitResponseDone(request, null),
        waitResponseTimeout(request, timeout)
      ]);

      if (response == null) {
        return ReturnResult(
            error: ReturnResultError(
                "http response timeout after ${timeout.inSeconds} seconds"));
      }
      if (response.statusCode != 200 && response.statusCode != 204) {
        return ReturnResult(
            error:
                ReturnResultError("http statusCode: ${response.statusCode}"));
      }
      var stringData = await response.transform(utf8.decoder).join();
      return ReturnResult(data: stringData);
    } catch (err) {
      Log.i('http DeletetRequest $url exception: ${err.toString()}');
      return ReturnResult(
          error: ReturnResultError("http exception: ${err.toString()}"));
    } finally {
      client.close(force: true);
    }
  }

  static Future<ReturnResult<String>> httpGetTitle(
      String url, String? userAgent) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return ReturnResult(data: "");
    }
    Uri site = Uri(
        scheme: uri.scheme,
        userInfo: uri.userInfo,
        host: uri.host,
        port: uri.port);
    final result = await HttpUtils.httpGetRequest(site.toString(), null, null,
        const Duration(seconds: 5), userAgent, null);

    if (result.error != null) {
      return result;
    }
    String body = result.data!;
    int start = body.indexOf("<title>");
    int end = body.indexOf("</title>");
    String siteName = "";
    if (start < end) {
      siteName = body.substring(start + "<title>".length, end).trim();
    }
    return ReturnResult(data: siteName);
  }

  static Future<HttpClientRequest?> waitRequestDone(
      Future<HttpClientRequest?> Function() fun) async {
    return await fun();
  }

  static Future<HttpClientRequest?> waitRequestTimeout(
      Duration duration) async {
    await Future.delayed(duration);
    return null;
  }

  static Future<HttpClientResponse?> waitResponseDone(
      HttpClientRequest request, String? path) async {
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      if (path != null && path.isNotEmpty) {
        await response.pipe(File(path).openWrite());
      }
    }
    return response;
  }

  static Future<HttpClientResponse?> waitResponseTimeout(
      HttpClientRequest request, Duration duration) async {
    await Future.delayed(duration);
    //request.abort();
    return null;
  }

  static bool _certificateCheck(X509Certificate cert, String host, int port) =>
      true;
}
