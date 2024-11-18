import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/kehadiran_provider.dart';

class HalamanRiwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.records.length,
        itemBuilder: (ctx, index) {
          final record = provider.records[index];
          return ListTile(
            title: Text(
              '${record.date.day}/${record.date.month}/${record.date.year}',
            ),
            subtitle: Text(
              'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
            ),
          );
        },
      ),
    );
  }
}
