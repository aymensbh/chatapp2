import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


FirebaseAuth firebaseAuth=FirebaseAuth.instance;
DatabaseReference databaseReference=FirebaseDatabase.instance.reference();
FirebaseUser firebaseUser;
FirebaseStorage storage=FirebaseStorage.instance;
StorageReference storageReference=FirebaseStorage.instance.ref();