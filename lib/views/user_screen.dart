import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day32/models/rickmorty_model.dart';
import 'package:ppkd_batch_4/day32/service/api.dart';

class RickMortyPage extends StatefulWidget {
  const RickMortyPage({super.key});

  @override
  State<RickMortyPage> createState() => _RickMortyPageState();
}

class _RickMortyPageState extends State<RickMortyPage>
    with SingleTickerProviderStateMixin {
  Color getStatusColor(Status? status) {
    switch (status) {
      case Status.ALIVE:
        return Colors.greenAccent;
      case Status.DEAD:
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0C10),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2833),
        elevation: 6,
        centerTitle: true,
        title: const Text(
          "Rick & Morty Characters",
          style: TextStyle(
            color: Color(0xFF66FCF1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
          ),
        ),
      ),
      body: FutureBuilder<List<Result>>(
        future: fetchRickMorty(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF66FCF1)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final characters = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final char = characters[index];
                return _buildCharacterCard(char);
              },
            );
          } else {
            return const Center(
              child: Text(
                "Tidak ada data karakter.",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCharacterCard(Result char) {
    return GestureDetector(
      onTap: () => _showCharacterDialog(char),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1F2833),
              Color(0xFF2B2D42),
              Color(0xFF3C0919), // kesan darah gelap
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF66FCF1), width: 1.3),
          boxShadow: [
            BoxShadow(
              color: Colors.redAccent.withOpacity(0.25),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: char.id ?? UniqueKey(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  char.image ?? '',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              char.name ?? "Unknown",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: getStatusColor(char.status).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: getStatusColor(char.status)),
              ),
              child: Text(
                char.status?.name ?? 'Unknown',
                style: TextStyle(
                  color: getStatusColor(char.status),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCharacterDialog(Result char) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Character Info",
      barrierDismissible: true,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: ScaleTransition(
            scale: CurvedAnimation(parent: anim1, curve: Curves.easeOutBack),
            child: AlertDialog(
              backgroundColor: const Color(0xFF121212),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                children: [
                  Hero(
                    tag: char.id ?? UniqueKey(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        char.image ?? '',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      char.name ?? "Unknown",
                      style: const TextStyle(
                        color: Color(0xFF66FCF1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Species: ${char.species?.name ?? 'Unknown'}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "Gender: ${char.gender?.name ?? 'Unknown'}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "Origin: ${char.origin?.name ?? 'Unknown'}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "Location: ${char.location?.name ?? 'Unknown'}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Episodes: ${char.episode?.length ?? 0}",
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Color(0xFF66FCF1)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
    );
  }
}
