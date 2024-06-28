import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_cubit_state.dart';

class NotificationsCubitCubit extends Cubit<NotificationsCubitState> {
  NotificationsCubitCubit() : super(NotificationsCubitInitial());
}
