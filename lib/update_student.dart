import 'package:database/db_helper.dart';
import 'package:database/student_model.dart';
import 'package:flutter/material.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({Key? key, this.student}) : super(key: key);
  final Student? student;

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {

  final formKey = GlobalKey<FormState>();

  TextEditingController idNumController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  String? genderValue;

  @override
  void initState() {
    if (widget.student != null) {
      idNumController.text = widget.student!.idNum;
      nameController.text = widget.student!.name;
      birthdateController.text = widget.student!.birthdate;
      courseController.text = widget.student!.course;
      sectionController.text = widget.student!.section;
      genderValue = widget.student!.gender;
    }
    super.initState();
  }

  @override
  void dispose() {
    idNumController.dispose();
    nameController.dispose();
    birthdateController.dispose();
    courseController.dispose();
    sectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Student Form'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop(false);
              }
          ),
        ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            TextFormField(
                controller: idNumController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    icon: Icon(Icons.numbers),
                    hintText: 'ID Number',
                    labelText: 'ID Number'
                ),
                validator: (id) {
                  if(id!.isEmpty || !RegExp(r'[0-9]+$').hasMatch(id)) {
                    return 'Please enter your ID Number.';
                  } else {
                    return null;
                  }
                }
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: 'Name',
                    labelText: 'Name'
                ),
                validator: (name) {
                  if(name!.isEmpty || !RegExp(r'[a-z A-Z]+$').hasMatch(name)) {
                    return 'Please enter your Name.';
                  } else {
                    return null;
                  }
                }
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: birthdateController,
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    hintText: 'DD/MM/YYYY',
                    labelText: 'Date of Birth'
                ),
                validator: (birthdate) {
                  if(birthdate!.isEmpty || !RegExp(r'[0-9 /]+$').hasMatch(birthdate)) {
                    return 'Please enter your Date of Birth';
                  } else {
                    return null;
                  }
                }
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: courseController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    icon: Icon(Icons.school),
                    hintText: 'Type your Course...',
                    labelText: 'Course'
                ),
                validator: (course) {
                  if(course!.isEmpty || !RegExp(r'[a-z A-Z]+$').hasMatch(course)) {
                    return 'Please enter your Course.';
                  } else {
                    return null;
                  }
                }
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: sectionController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    icon: Icon(Icons.schedule_outlined),
                    hintText: 'Type your Section...',
                    labelText: 'Section'
                ),
                validator: (section) {
                  if(section!.isEmpty || !RegExp(r'[a-z A-Z,0-9]+$').hasMatch(section)) {
                    return 'Please enter your Section.';
                  } else {
                    return null;
                  }
                }
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
                isExpanded: true,
                hint: const Text(
                  'Select Your Gender',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Text('Female'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Other'),
                  )
                ],
                validator: (gender) {
                  if(gender == null) {
                    return 'Please select your gender.';
                  } else {
                    return null;
                  }
                },
                onChanged: (newValue) {
                  setState(() {
                    genderValue = newValue;
                  });
                },
                onSaved: (yourGender) {
                  setState(() {
                    genderValue = yourGender;
                  });
                }
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await DBHelper.updateStudent(
                          Student(
                            id: widget.student!.id,
                            idNum: idNumController.text,
                            name: nameController.text,
                            birthdate: birthdateController.text,
                            course: courseController.text,
                            section: sectionController.text,
                            gender: genderValue.toString(),
                          )
                      );
                      Navigator.of(context).pop(true);
                    } else {
                      return;
                    }
                  },
                  child: const Text('UPDATE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}