import 'dart:io';

List<String> todoList = [];
List<bool> isCompleted = [];

//getting user input to add a task to "todoList" which is a list of String
void addTodo() {
  stdout.write('Enter a task to add: ');
  String task = stdin.readLineSync()!.trim();
  todoList.add(task);
  isCompleted.add(false);
  print('"${task}" added to your to-do list.');
}

//displaying the user's to do list

void displayTodos() {
  print('Your To-Do List:');
  for (int i = 0; i < todoList.length; i++) {
    String status = isCompleted[i] ? '(Completed)' : '(Pending)';
    print('${i + 1}. ${todoList[i]} $status');
  }
}

//getting from user what tasks has been done
void completeTodo() {
  stdout.write('Enter the number of the task to complete: ');
  int taskNumber = int.parse(stdin.readLineSync()!.trim());
  if (taskNumber >= 1 && taskNumber <= todoList.length) {
    isCompleted[taskNumber - 1] = true;
    print('Task marked as complete!');
  } else {
    print('Invalid task number. Please try again.');
  }
}

//deleting a task
void deleteTodo() {
  stdout.write('Enter the number of the task to delete: ');
  int taskNumber = int.parse(stdin.readLineSync()!.trim());
  if (taskNumber >= 1 && taskNumber <= todoList.length) {
    todoList.removeAt(taskNumber - 1);
    isCompleted.removeAt(taskNumber - 1);
    print('Task deleted.');
  } else {
    print('Invalid task number. Please try again.');
  }
}

//displaying completed tasks
void showCompletedTodos() {
  print('Completed Tasks:');
  for (int i = 0; i < todoList.length; i++) {
    if (isCompleted[i]) {
      print('- ${todoList[i]}');
    }
  }
}

void main() {
  while (true) {
    print('\nTo-Do List App');
    print('1. Add a task');
    print('2. View all tasks');
    print('3. Mark a task as complete');
    print('4. Delete a task');
    print('5. View completed tasks');
    print('6. Exit');

    stdout.write('What would you like to do? ');
    int choice = int.parse(stdin.readLineSync()!.trim());

    switch (choice) {
      case 1:
        addTodo();
        break;
      case 2:
        displayTodos();
        break;
      case 3:
        completeTodo();
        break;
      case 4:
        deleteTodo();
        break;
      case 5:
        showCompletedTodos();
        break;
      case 6:
        print('Goodbye!');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}