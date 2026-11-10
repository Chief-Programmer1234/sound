// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Xylophone',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           // Fixed missing 'ColorScheme'
//           seedColor: const Color.fromARGB(255, 236, 234, 241),
//         ),
//       ),
//       home: const Xylophone(),
//     );
//   }
// }

// class Xylophone extends StatefulWidget {
//   const Xylophone({super.key}); // Fixed invalid 'const new' constructor name

//   @override
//   State<Xylophone> createState() => _XylophoneState();
// }

// class _XylophoneState extends State<Xylophone> {
//   // Moved assets list outside build method for cleaner code
//   final List<Color> colors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.green,
//     Colors.teal,
//     Colors.blue,
//     Colors.purple,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Xylophone'),
//         backgroundColor: Colors.deepPurple,
//         foregroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               // 👈 Wrap ListView in Expanded to fix the unbounded height error
//               child: ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(), // Disables scrolling so it feels like a solid instrument board
//                 itemCount: 7,
//                 itemBuilder: (context, index) {
//                   final itemColor = colors[index % colors.length];

//                   return Expanded(
//                     // Wrapping each button item inside an Expanded or using layout structures
//                     // helps stretch them to fill up the full vertical space perfectly.
//                     child: Container(
//                       height:
//                           (MediaQuery.of(context).size.height -
//                               AppBar().preferredSize.height -
//                               MediaQuery.of(context).padding.top) /
//                           7, // Dynamically fits 7 rows perfectly on any screen size
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           backgroundColor: itemColor,
//                           foregroundColor: const Color.fromARGB(
//                             255,
//                             216,
//                             195,
//                             195,
//                           ), // Changed to white for better legibility against bright backgrounds
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.zero,
//                           ),
//                         ),
//                         onPressed: () async {
//                           final player = AudioPlayer();
//                           await player.play(
//                             AssetSource('note${index + 1}.wav'),
//                           );
//                         },
//                         child: Text(
//                           'Play Sound ${index + 1}',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // Fixed missing 'ColorScheme'
          seedColor: const Color.fromARGB(255, 236, 234, 241),
        ),
      ),
      home: const Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key}); // Fixed invalid 'const new' constructor name

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  // Moved assets list outside build method for cleaner code
  Expanded buildkey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color, // Changes the background color
          foregroundColor: Colors.black, // Ensures the text is readable
        ),
        onPressed: () async {
          final player = AudioPlayer();
          await player.play(AssetSource('note$soundNumber.wav'));
        },
        child: Text('Sound $soundNumber'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xylophone'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildkey(color: Colors.red, soundNumber: 1),
            SizedBox(height: 10),
            buildkey(color: Colors.orange, soundNumber: 2),
            SizedBox(height: 10),
            buildkey(color: Colors.yellow, soundNumber: 3),
            SizedBox(height: 10),
            buildkey(color: Colors.green, soundNumber: 4),
            SizedBox(height: 10),
            buildkey(color: Colors.blue, soundNumber: 5),
            SizedBox(height: 10),
            buildkey(color: Colors.indigo, soundNumber: 6),
            SizedBox(height: 10),
            buildkey(color: Colors.purple, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
