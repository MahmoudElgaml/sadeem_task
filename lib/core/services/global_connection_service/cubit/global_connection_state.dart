part of 'global_connection_cubit.dart';

@immutable
sealed class GlobalConnectionState {}

final class Connected extends GlobalConnectionState {}
final class Disconnected extends GlobalConnectionState {}
