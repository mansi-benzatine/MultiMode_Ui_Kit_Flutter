import 'package:flutter_test/flutter_test.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/run_tracker_step_counter_water_reminder_app.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
