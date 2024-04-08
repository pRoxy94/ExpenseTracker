import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  
  @override
  Widget build(BuildContext context) {
    /// This constructor is appropriate for list views with a large (or infinite) number of children 
    /// because the builder is called only for those children that are actually visible.
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: ((ctx, index) => 
        Dismissible(
          /// key => to uniquely identify a widget
          key: ValueKey(expenses[index]), 
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index])
        )
      )
    );
  }
}