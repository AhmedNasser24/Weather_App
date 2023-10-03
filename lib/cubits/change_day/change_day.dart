import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeDayCubit extends Cubit<int> {
  ChangeDayCubit() : super(0);
  int dayIndex = 0 ;
  nextDay(){
    dayIndex++ ;
    emit(dayIndex) ;
  }
  previousDay(){
    dayIndex-- ;
    emit(dayIndex) ;
  }
  initializeDay(){
    dayIndex = 0 ;
    emit(dayIndex) ;
  }
}