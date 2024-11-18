import 'package:flutter/material.dart';
import '../model/mahasiswa.dart';
import '../model/catatan_kehadiran.dart';

class KehadiranProvider with ChangeNotifier {
  List<Mahasiswa> _mahasiswa = [
    Mahasiswa(nama: 'Ali'),
    Mahasiswa(nama: 'Budi'),
    Mahasiswa(nama: 'Citra'),
    Mahasiswa(nama: 'Fakhri'),
  ];

  List<CatatanKehadiran> _records = [];

  List<Mahasiswa> get students => _mahasiswa;

  List<CatatanKehadiran> get records => _records;

  void toggleAttendance(int index) {
    _mahasiswa[index].isHadir = !_mahasiswa[index].isHadir;
    notifyListeners();
  }

  void saveAttendance() {
    int presentCount =
        _mahasiswa.where((student) => student.isHadir).length;
    int absentCount = _mahasiswa.length - presentCount;

    _records.insert(
      0,
      CatatanKehadiran(
        date: DateTime.now(),
        presentCount: presentCount,
        absentCount: absentCount,
      ),
    );

    for (var student in _mahasiswa) {
      student.isHadir = false;
    }

    notifyListeners();
  }
}
