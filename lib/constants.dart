import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'controllers/auth_controller.dart';
import 'views/screens/add_video_screen.dart';
import 'views/screens/profile_screen.dart';
import 'views/screens/search_screen.dart';
import 'views/screens/video_screen.dart';
import 'views/screens/details_screen.dart';

//BOTTOM MENU ELEMENTS
List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  const DetailsScreen(),
  ProfileScreen(uid: authController.user.uid),
];

//COLORS
const backgroundColor = Colors.blueGrey;
const textColor = Colors.white;
const buttonColor = Colors.deepOrange;

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//CONTROLLER
var authController = AuthController.instance;
