import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/functions/material_color.dart';

// i can remove this cubit and use getWeatherCubit only but i use it for learning purpose

class ChangeThemeColorCubit extends Cubit<MaterialColor> {
  ChangeThemeColorCubit() : super(Colors.blue);

  void changeThemeColor({required String weatherCondition}){
    MaterialColor materialColor = weatherConditionColors[weatherCondition] ?? Colors.blue;
  
  emit(materialColor) ;
  }
    
  }
