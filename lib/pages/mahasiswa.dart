import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Mahasiswa());
}

class Mahasiswa extends StatefulWidget {
  const Mahasiswa({Key? key}) : super(key: key);

  @override
  State<Mahasiswa> createState() => _MahasiswaState();
}

class _MahasiswaState extends State<Mahasiswa> {
  TextEditingController nbiController = TextEditingController();
  TextEditingController mkController = TextEditingController();
  TextEditingController dosenController = TextEditingController();
  TextEditingController presensiController = TextEditingController();
  TextEditingController easController = TextEditingController();
  TextEditingController etsController = TextEditingController();
  TextEditingController predikatController = TextEditingController();

  final CollectionReference _mahasiswa =
      FirebaseFirestore.instance.collection('mahasiswa');

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'Tambah Nilai';
    if (documentSnapshot != null) {
      action = 'Update Nilai';
      mkController.text = documentSnapshot['nama_mk'];

      dosenController.text = documentSnapshot['dosen'];
      nbiController.text = documentSnapshot['nbi'];
      presensiController.text = documentSnapshot['presensi'].toString();
      easController.text = documentSnapshot['eas'].toString();
      etsController.text = documentSnapshot['ets'].toString();
      predikatController.text = documentSnapshot['predikat'].toString();

      double eas = 0;
      double ets = 0;
      double presensi;
      double akhirets = 0;
      double akhireas = 0;
      double akhirpresensi = 0;
      String predikat = 'E';

      await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx) {
            SingleChildScrollView:
            true;
            return Padding(
              padding:
                  EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: nbiController,
                    decoration: const InputDecoration(labelText: 'NBI'),
                  ),
                  TextField(
                    controller: mkController,
                    decoration: const InputDecoration(labelText: 'Mata Kuliah'),
                  ),
                  TextField(
                    controller: dosenController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Dosen',
                    ),
                    onChanged: (value) => {},
                  ),
                  TextField(
                    controller: presensiController,
                    decoration: const InputDecoration(
                      labelText: 'Presensi',
                    ),
                    onChanged: (value) {
                      presensi = double.parse(value);
                      setState(() {
                        akhirpresensi = presensi / 16 * 10;

                        double NA = akhirets + akhireas + akhirpresensi;
                        if (NA <= 45) {
                          predikatController.text = 'D';
                        } else if (NA <= 50) {
                          predikatController.text = 'D+';
                        } else if (NA <= 55) {
                          predikatController.text = 'C-';
                        } else if (NA <= 60) {
                          predikatController.text = 'C';
                        } else if (NA <= 65) {
                          predikatController.text = 'C+';
                        } else if (NA <= 70) {
                          predikatController.text = 'B-';
                        } else if (NA <= 75) {
                          predikatController.text = 'B';
                        } else if (NA <= 80) {
                          predikatController.text = 'B+';
                        } else if (NA <= 85) {
                          predikatController.text = 'A-';
                        } else if (NA <= 100) {
                          predikatController.text = 'A';
                        }
                      });
                    },
                  ),
                  TextField(
                    controller: etsController,
                    decoration: const InputDecoration(
                      labelText: 'ETS',
                    ),
                    onChanged: (value) {
                      ets = double.parse(value);
                      setState(() {
                        akhirets = ets / 100 * 40;
                      });
                    },
                  ),
                  TextField(
                    controller: easController,
                    decoration: const InputDecoration(
                      labelText: 'EAS',
                    ),
                    onChanged: (value) {
                      eas = double.parse(value);
                      setState(() {
                        akhireas = eas / 100 * 50;
                        double NA = akhirets + akhireas + akhirpresensi;

                        if (NA <= 45) {
                          predikatController.text = 'D';
                        } else if (NA <= 50) {
                          predikatController.text = 'D+';
                        } else if (NA <= 55) {
                          predikatController.text = 'C-';
                        } else if (NA <= 60) {
                          predikatController.text = 'C';
                        } else if (NA <= 65) {
                          predikatController.text = 'C+';
                        } else if (NA <= 70) {
                          predikatController.text = 'B-';
                        } else if (NA <= 75) {
                          predikatController.text = 'B';
                        } else if (NA <= 80) {
                          predikatController.text = 'B+';
                        } else if (NA <= 85) {
                          predikatController.text = 'A-';
                        } else if (NA <= 100) {
                          predikatController.text = 'A';
                        }
                      });
                    },
                  ),
                  TextField(
                    controller: predikatController,
                    decoration: const InputDecoration(
                      labelText: 'Predikat',
                    ),
                    onChanged: (value) {
                      predikat = value;
                      setState(() {
                        double NA = akhirets + akhireas + akhirpresensi;
                        if (NA <= 45) {
                          predikatController.text = 'D';
                        } else if (NA <= 50) {
                          predikatController.text = 'D+';
                        } else if (NA <= 55) {
                          predikatController.text = 'C-';
                        } else if (NA <= 60) {
                          predikatController.text = 'C';
                        } else if (NA <= 65) {
                          predikatController.text = 'C+';
                        } else if (NA <= 70) {
                          predikatController.text = 'B-';
                        } else if (NA <= 75) {
                          predikatController.text = 'B';
                        } else if (NA <= 80) {
                          predikatController.text = 'B+';
                        } else if (NA <= 85) {
                          predikatController.text = 'A-';
                        } else if (NA <= 100) {
                          predikatController.text = 'A';
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text('Update Nilai'),
                    onPressed: () async {
                      final String? nama_mk = mkController.text;
                      final String? dosen = dosenController.text;
                      final int? eas = int.tryParse(easController.text);
                      final int? ets = int.tryParse(etsController.text);
                      final String? predikat = predikatController.text;

                      final String? nbi = nbiController.text;

                      final int? presensi = int.parse(presensiController.text);
                      final DateTime timestamp = DateTime.now();

                      await _mahasiswa.doc(documentSnapshot.id).update({
                        "nama_mk": nama_mk,
                        "dosen": dosen,
                        "eas": eas,
                        "ets": ets,
                        "nbi": nbi,
                        "presensi": presensi,
                        "predikat": predikat,
                        "timestamp": timestamp,
                      });

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mahasiswa(),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          });
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: mkController,
                  decoration: const InputDecoration(labelText: 'Mata Kuliah'),
                ),
                TextField(
                  controller: dosenController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Dosen',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text('Tambah Nilai'),
                    onPressed: () async {
                      final String? nama_mk = mkController.text;
                      final String? dosen = dosenController.text;
                      final int eas = 0;
                      final int ets = 0;
                      final String nbi = 'nbi';
                      final int presensi = 0;
                      final String predikat = 'E';
                      final DateTime timestamp = DateTime.now();

                      mkController.text = '';
                      dosenController.text = '';

                      await _mahasiswa.add({
                        "nama_mk": nama_mk,
                        "dosen": dosen,
                        "eas": eas,
                        "ets": ets,
                        "nbi": nbi,
                        "presensi": presensi,
                        "predikat": predikat,
                        "timestamp": timestamp,
                      });

                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }

  Future<void> _deleteProduct(String mahasiswaId) async {
    await _mahasiswa.doc(mahasiswaId).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Delete!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
        title: const Text('1462000101'),
      ),
      body: StreamBuilder(
        stream: _mahasiswa.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['nama_mk']),
                    subtitle: Text(documentSnapshot['dosen']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProduct(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
