import 'package:flutter/material.dart';

const Map<String, List<String>> feelingsMap = {
  'Радость': [
    'Восторг',
    'Наслаждение',
    'Удовольствие',
    'Смелость',
    'Очарование',
    'Осознанность',
    'Чувственность',
    'Экстравагантность'
  ],
  'Страх': [
    'Боязнь',
    'Тревога',
    'Ужас',
    'Опасение',
    'Паника',
    'Испуг',
    'Волнение',
    'Робость',
    'Трепет',
    'Стеснение'
  ],
  'Бешенство': ['Ярость', 'Злость', 'Зверство', 'Агрессия', 'Ожесточение'],
  'Грусть': [],
  'Спокойствие': [],
  'Сила': ['Мощь', 'Энергия', 'Здоровье', 'Крепость', 'Мускулатура']
};
const feelings = [
  'Радость',
  'Страх',
  'Бешенство',
  'Грусть',
  'Спокойствие',
  'Сила'
];
const feelingsIcon = [
  'radost',
  'strah',
  'beshenstvo',
  'grust',
  'spokoystvie',
  'sila'
];

class AppConstants {
  static List<BoxShadow> shadow = [
    const BoxShadow(
      color: Color.fromRGBO(182, 161, 192, 0.11),
      offset: Offset(2, 4),
      blurRadius: 10.8,
      spreadRadius: 0,
    )
  ];
}
