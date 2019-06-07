import 'package:meta/meta.dart';

import 'bit_buffer.dart';
import 'byte.dart';
import 'input_too_long_exception.dart';
import 'rs_block.dart';
import 'util.dart' as qr_util;

/// Allows for calculation of the optimal QR Code 'version' number based on
/// the intended content and an error correction level.
class QrCalculator {
  static int versionForString({
    @required int errorCorrectLevel,
    @required String input,
  }) =>
      versionForDataList(
          errorCorrectLevel: errorCorrectLevel, dataList: [QrByte(input)]);
  static int versionForDataList({
    @required int errorCorrectLevel,
    @required List<QrByte> dataList,
  }) {
    int typeNumber;
    int lastBufferLength;
    int lastDataCount;
    for (var checkType = 1; checkType < 40; checkType++) {
      var rsBlocks = QrRsBlock.getRSBlocks(checkType, errorCorrectLevel);

      var buffer = QrBitBuffer();
      var totalDataCount = 0;
      for (var i = 0; i < rsBlocks.length; i++) {
        totalDataCount += rsBlocks[i].dataCount;
      }

      for (var i = 0; i < dataList.length; i++) {
        var data = dataList[i];
        buffer
          ..put(data.mode, 4)
          ..put(data.length, qr_util.getLengthInBits(data.mode, checkType));
        data.write(buffer);
      }
      if (buffer.length <= totalDataCount * 8) {
        typeNumber = checkType;
        break;
      }
      lastBufferLength = buffer.length;
      lastDataCount = totalDataCount;
    }
    if (typeNumber == null) {
      throw InputTooLongException(lastBufferLength, lastDataCount);
    }
    return typeNumber;
  }
}

class QrCalcResult {
  QrCalcResult({this.version, this.error});
  int version;
  InputTooLongException error;

  bool hasError() => error != null;
}
