import 'package:authentication/services/auth_service_email_password_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.yellowAccent, // Yellow at the top
            Colors.orangeAccent, // Orange at the bottom
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make the Scaffold background transparent
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello👋',
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  FirebaseAuth.instance.currentUser!.email!.toString(),
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )
                  ),
                ),
                const SizedBox(height: 30,),
                _logout(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(double.infinity, 60),
        elevation: 0,
      ),
      onPressed: () async {
        await AuthService().signout(context: context);
      },
      child: const Text("Sign Out", style: TextStyle(color: Colors.white),),
    );
  }
}