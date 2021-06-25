import 'package:flutter/services.dart';

Future<void> mockChannels(
  /// List of channels to mock
  /// NOTE: all method calls under this channel will be mocked
  List<String> channelNames,

  /// The function to call for the duration of the mocking.
  /// The callback will be passed the [MockChannelLogs] which
  /// contains helper functions to obtain the first/second/third
  /// channels.
  /// E.G: [MockChannelLogs().secondChannel\[0\]] in order to get
  /// the first method call on the second channel
  MockChannelLogsFunction callback, {

  /// Any custom results to return as opposed to the default
  /// which is void. The string is the method call to mock.
  /// E.G: { canLaunch: false }
  Map<String, dynamic> results = const <String, dynamic>{},
}) async {
  final MockChannelLogs logs = MockChannelLogs();
  final List<MethodChannel> channels = <MethodChannel>[];
  for (String channelName in channelNames) {
    final List<MethodCall> log = <MethodCall>[];
    final MethodChannel methodChannel = MethodChannel(channelName);
    methodChannel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      dynamic resultOverride;
      final bool resultContainsMethod = results.containsKey(methodCall.method);
      if (resultContainsMethod != null) {
        if (resultContainsMethod &&
            results[methodCall.method] is Map &&
            methodCall.arguments != null) {
          for (String key in methodCall.arguments.keys) {
            final String methodOverride =
                results[methodCall.method][methodCall.arguments[key]];
            if (methodOverride != null) {
              resultOverride = methodOverride;
            }
          }
        } else {
          resultOverride = results[methodCall.method];
        }
      }
      if (resultOverride != null) {
        return resultOverride;
      }
    });
    channels.add(methodChannel);
    logs.add(log);
  }
  try {
    await callback(logs);
  } catch (e) {
    rethrow;
  } finally {
    for (MethodChannel channel in channels) {
      channel.setMockMethodCallHandler(null);
    }
  }
}

typedef MockChannelLogFunction = Future<void> Function(List<MethodCall> log);
typedef MockChannelLogsFunction = Future<void> Function(MockChannelLogs logs);

class MockChannelLogs {
  MockChannelLogs([this.channelLogs]) {
    channelLogs ??= <List<MethodCall>>[];
  }

  List<List<MethodCall>>? channelLogs;

  List<MethodCall> get firstChannel => channelLogs![0];

  List<MethodCall> get secondChannel => channelLogs![1];

  List<MethodCall> get thirdChannel => channelLogs![2];

  List<MethodCall> get fourthChannel => channelLogs![3];

  void add(List<MethodCall> log) {
    channelLogs!.add(log);
  }
}
