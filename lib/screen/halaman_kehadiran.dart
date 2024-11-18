import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/kehadiran_provider.dart';

class HalamanKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (ctx, index) {
                final student = provider.students[index];
                return ListTile(
                  title: Text(student.nama),
                  trailing: Checkbox(
                    value: student.isHadir,
                    onChanged: (_) => provider.toggleAttendance(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: provider.students.isEmpty
                    ? null
                    : provider.saveAttendance,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Simpan Kehadiran',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
