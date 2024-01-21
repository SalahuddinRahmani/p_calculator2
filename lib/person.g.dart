import 'package:p_calculator2/main.dart';
import 'package:p_calculator2/list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************
class Person {
  String name;
  String fatherName;
  int kilo;
  int meghdar;

  Person({
    required this.name,
    required this.fatherName,
    required this.kilo,
    required this.meghdar,
  });
}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 0;

  @override
  Person read(BinaryReader reader) {
    return Person(
      name: reader.read(),
      fatherName: reader.read(),
      kilo: reader.read(),
      meghdar: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Person person) {
    writer.write(person.name);
    writer.write(person.fatherName);
    writer.write(person.kilo);
    writer.write(person.meghdar);
  }
}

class HiveBoxes {
  static const String personBox = 'personBox';
}

void savePerson(Person person) {
  final Box<Person> personBox = Hive.box<Person>(HiveBoxes.personBox);
  personBox.add(person);
}
