import 'package:database/student_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  final Student studentDetails;

  const DetailsPage({
    required this.studentDetails,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            child: ListTile(
              leading: const Icon(Icons.numbers),
              title: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('ID Number'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(': ${studentDetails.idNum}'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            child: ListTile(
              leading: const Icon(Icons.account_circle),
              title: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('Name'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(': ${studentDetails.name}'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('Birth Date'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(': ${studentDetails.birthdate}'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            child: ListTile(
              leading: const Icon(Icons.question_mark),
              title: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('Gender'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(': ${studentDetails.gender}'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            child: ListTile(
              leading: const Icon(Icons.schedule),
              title: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('Year & Section'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(': ${studentDetails.section}'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            child: ListTile(
              leading: const Icon(Icons.school),
              title: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('Course'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(': ${studentDetails.course}'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}