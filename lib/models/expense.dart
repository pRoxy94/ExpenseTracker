
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {food, travel, leisure, work}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

/// : id = uuid.v4() ---> Initializer list feature: generate unique ID whenever the Expense class is istantiated
/// this feature can be used to initialize class properties (like 'id') with values that are NOT received as
/// constructor function args