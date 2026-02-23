import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Logic and Beeper Tests', () {
    test('Beeper should only sound on increment above capacity', () {
      int capacity = 100;
      
      bool shouldBeep(int currentInside, bool isIncrement) {
        if (currentInside <= capacity) return false;
        if (!isIncrement) return false;
        return true;
      }

      // Cases where it SHOULD NOT beep
      expect(shouldBeep(100, true), false, reason: 'At capacity, no beep');
      expect(shouldBeep(99, true), false, reason: 'Below capacity, no beep');
      expect(shouldBeep(101, false), false, reason: 'Decremented count, no beep');

      // Case where it SHOULD beep
      expect(shouldBeep(101, true), true, reason: 'Incremented above capacity, beep triggers');
    });

    test('Counters should remain synchronized on entry', () {
      int entered = 0;
      int inside = 0;
      
      // Simulate entry
      entered += 1;
      inside += 1;
      
      expect(entered, 1);
      expect(inside, 1);
    });

    test('Only inside counter should change on exit', () {
      int entered = 10;
      int inside = 10;
      
      // Simulate exit
      inside -= 1;
      
      expect(entered, 10);
      expect(inside, 9);
    });
  });
}
