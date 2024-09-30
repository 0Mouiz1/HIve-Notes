// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskeName;
  final bool taskeCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.onChanged,
      required this.taskeCompleted,
      required this.taskeName,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: taskeCompleted,
                onChanged: onChanged,
                //fillColor: WidgetStatePropertyAll(Colors.yellow),
                activeColor: Colors.black,
              ),
              Text(
                taskeName,
                style: TextStyle(
                  decoration: taskeCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
