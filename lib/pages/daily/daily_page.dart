import 'package:flutter/material.dart';
import 'package:mood_diary/app_constants/app_colors.dart';
import 'package:mood_diary/pages/daily/feeling_widget.dart';
import 'package:mood_diary/pages/daily/note_block.dart';
import 'package:mood_diary/pages/daily/self_esteem_block.dart';
import 'package:mood_diary/pages/daily/stress_level_block.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double feelingValue = 0;
  double selfEsteemValue = 0;
  String note = '';

  List<String> choosedFillings = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        FeelingBlock(
            choosedFillings: choosedFillings,
            onTap: (value) {
              setState(() {
                choosedFillings.contains(value)
                    ? choosedFillings.remove(value)
                    : choosedFillings.add(value);
              });
            }),
        StressLevelBlock(
          value: feelingValue,
          onChanged: (val) => setState(() {
            feelingValue = val;
            print('Уровень стресса: $feelingValue');
          }),
        ),
        const SizedBox(
          height: 40,
        ),
        SelfEsteemBlock(
          value: selfEsteemValue,
          onChanged: (val) => setState(() {
            selfEsteemValue = val;
            print('Самооценка: $selfEsteemValue');
          }),
        ),
        const SizedBox(
          height: 40,
        ),
        NotesBlock(
          onChanged: (val) => setState(() {
            note = val;
            print('Note: $note');
          }),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: choosedFillings.isEmpty ||
                  feelingValue == 0 ||
                  selfEsteemValue == 0 ||
                  note == ''
              ? null
              : () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Ваше состояние'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Ваши чувства: '),
                              Row(
                                children: choosedFillings
                                    .map((e) => Text('$e, '))
                                    .toList(),
                              ),
                              Text('Уровень стресса: $feelingValue/100'),
                              Text('Самооценка: $selfEsteemValue/100'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Approve'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

                  print("Everything is ok!");
                },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.orange,
            disabledBackgroundColor: AppColors.lightGrey,
            disabledForegroundColor: AppColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(69),
            ),
          ),
          child: const SizedBox(
            height: 44,
            child: Center(
              child: Text(
                'Сохранить',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        )
      ],
    );
  }
}
