import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

abstract final class CryptoUtils {
  static Future<String?> getFileSha256(String path) async {
    final file = File(path);
    bool exists = await file.exists();
    if (!exists) {
      return null;
    }
    final reader = ChunkedStreamReader(file.openRead());
    const chunkSize = 1024 * 1024 * 1;
    AccumulatorSink<Digest> output = AccumulatorSink<Digest>();
    ByteConversionSink input = sha256.startChunkedConversion(output);
    try {
      while (true) {
        List<int> chunk = await reader.readChunk(chunkSize);
        if (chunk.isEmpty) {
          break;
        }
        input.add(chunk);
      }
    } finally {
      reader.cancel();
    }
    input.close();
    return output.events.single.toString();
  }
}
