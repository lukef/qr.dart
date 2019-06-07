import 'package:qr/src/calc.dart';
import 'package:qr/src/error_correct_level.dart';
import 'package:test/test.dart';
import 'qr_calc_test_data.dart';

void main() {
  test('calcSimple', () {
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: shortString,
      ),
      7,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: shortString,
      ),
      8,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: longString,
      ),
      25,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: longString,
      ),
      29,
    );
  });
  test('calcNumeric', () {
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: shortNumeric,
      ),
      7,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: shortNumeric,
      ),
      8,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: longNumeric,
      ),
      25,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: longNumeric,
      ),
      29,
    );
  });
  test('calcMixed', () {
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: shortMixed,
      ),
      7,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: shortMixed,
      ),
      8,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: longMixed,
      ),
      25,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: longMixed,
      ),
      29,
    );
  });
  test('calcEmojis', () {
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: shortEmojis,
      ),
      8,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: shortEmojis,
      ),
      9,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: longEmojis,
      ),
      25,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: longEmojis,
      ),
      30,
    );
  });
  test('calcJustEmojis', () {
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        input: justEmojis,
      ),
      3,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.M,
        input: justEmojis,
      ),
      4,
    );
    expect(
      QrCalculator.versionForString(
        errorCorrectLevel: QrErrorCorrectLevel.Q,
        input: justEmojis,
      ),
      5,
    );
  });
  test('calcTooLong', () {
    expect(
      () => QrCalculator.versionForString(
            errorCorrectLevel: QrErrorCorrectLevel.L,
            input: exceptionString,
          ),
      throwsException,
    );
  });
}
