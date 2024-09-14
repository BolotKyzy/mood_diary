import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mood_diary/app_constants/app_colors.dart';
import 'package:mood_diary/calendar/calendar_block.dart';
import 'package:mood_diary/dairt_statistics_toggle.dart';
import 'package:get/get.dart';
import 'package:mood_diary/pages/daily/calendar_screen.dart';
import 'package:mood_diary/pages/daily/daily_page.dart';
import 'package:mood_diary/pages/statistics_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ru', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _toggleValue = 0;
  bool showCalendar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: showCalendar
            ? CalendarScreen(
                exitFunc: () {
                  setState(() {
                    showCalendar = false;
                  });
                },
              )
            : Container(
                color: AppColors.bgDColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 46,
                      ),
                      CalendarBlock(onTap: () {
                        setState(() {
                          showCalendar = true;
                        });
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      AnimatedToggle(
                        values: const ['Дневник настроения', 'Статистика'],
                        icons: const ['diary_icon.svg', 'statistics_icon.svg'],
                        onToggleCallback: (value) {
                          setState(() {
                            _toggleValue = value;
                          });
                        },
                      ),
                      _toggleValue == 0
                          ? const DailyPage()
                          : const StatiscticsPage(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
