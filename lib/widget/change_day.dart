import 'package:flutter/material.dart';
import 'package:weather_app/cubits/change_day/change_day.dart';
import 'package:weather_app/widget/medium_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeDay extends StatelessWidget {
  const ChangeDay({
    required this.totalDays,
  });
  final int totalDays;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeDayCubit, int>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
          child: Row(
            children: [
              state != 0
                  ? GestureDetector(
                      onTap: () {
                        BlocProvider.of<ChangeDayCubit>(context).previousDay() ;
                      },
                      child: MediumText(
                        text: '<<prev',
                      ),
                    )
                  : Container(),
              Spacer(),
              state < totalDays - 1 ?
              GestureDetector(
                onTap: () {
                  BlocProvider.of<ChangeDayCubit>(context).nextDay() ;
                },
                child: MediumText(
                  text: 'next>>',
                ),
              ) : Container(),
            ],
          ),
        );
      },
    );
  }
}
