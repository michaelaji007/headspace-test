import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';



class MockDataConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  test('should check if the device has an internet connection', () async {
    final tHasConnectionFuture = Future.value(true);
    when(() => mockDataConnectionChecker.hasConnection)
        .thenAnswer((_) => tHasConnectionFuture);
    final result = networkInfo.isConnected;
    verify(() => mockDataConnectionChecker.hasConnection).called(1);
    expect(await result, true);
  });
}
