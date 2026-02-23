import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Logic Tests', () {
    test('Initial values should be zero', () {
      int entered = 0;
      int inside = 0;
      expect(entered, 0);
      expect(inside, 0);
    });

    test('Increment logic should increase both values', () {
      int entered = 0;
      int inside = 0;
      
      // Simulating entry
      entered += 1;
      inside += 1;
      
      expect(entered, 1);
      expect(inside, 1);
    });

    test('Decrement logic should only decrease inside count', () {
      int entered = 10;
      int inside = 10;
      
      // Simulating exit
      inside -= 1;
      
      expect(entered, 10);
      expect(inside, 9);
    });

    test('Beeper condition: should only trigger if inside > capacity', () {
      int capacity = 100;
      
      bool shouldBeep(int currentInside, bool isIncrement) {
        if (currentInside <= capacity) return false;
        if (!isIncrement) return false;
        return true;
      }

      expect(shouldBeep(100, true), false);
      expect(shouldBeep(101, true), true);
      expect(shouldBeep(101, false), false); // No beep on countdown even if over capacity
    });
  });
}
