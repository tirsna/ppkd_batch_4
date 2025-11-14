import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day32/models/rickmorty_model.dart';
import 'package:ppkd_batch_4/day32/service/api.dart';

class RickMortyPage extends StatefulWidget {
  const RickMortyPage({super.key});

  @override
  State<RickMortyPage> createState() => _RickMortyPageState();
}

class _RickMortyPageState extends State<RickMortyPage> {
  List<Result> _allCharacters = [];
  List<Result> _filteredCharacters = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = "All";

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(_filterCharacters);
  }

  Future<void> _loadData() async {
    try {
      final data = await fetchRickMorty();
      setState(() {
        _allCharacters = data;
        _filteredCharacters = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterCharacters() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCharacters = _allCharacters.where((char) {
        final matchesQuery = (char.name ?? '').toLowerCase().contains(query);
        final matchesStatus = _selectedStatus == "All"
            ? true
            : (char.status?.name.toLowerCase() ==
                      _selectedStatus.toLowerCase() ||
                  char.species?.name.toLowerCase() ==
                      _selectedStatus.toLowerCase());
        return matchesQuery && matchesStatus;
      }).toList();
    });
  }

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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            floating: true,
            backgroundColor: const Color(0xFF1F2833),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("assets/images/sirick.jpg", fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.5)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 10),
                      child: Text(
                        "Rick & Morty",
                        style: const TextStyle(
                          color: Color(0xFF66FCF1),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔍 Search + Filter
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F2833),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF66FCF1)),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xFF66FCF1)),
                      hintText: 'Search characters...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      _buildFilterButton("All", Icons.group, Colors.blueAccent),
                      _buildFilterButton(
                        "Alive",
                        Icons.favorite,
                        Colors.greenAccent,
                      ),
                      _buildFilterButton(
                        "Dead",
                        Icons.bloodtype,
                        Colors.redAccent,
                      ),
                      _buildFilterButton("Unknown", Icons.help, Colors.grey),
                      _buildFilterButton(
                        "Alien",
                        Icons.public,
                        Colors.purpleAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🧬 Animated List
          _isLoading
              ? const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(color: Color(0xFF66FCF1)),
                  ),
                )
              : SliverList.builder(
                  itemCount: _filteredCharacters.length,
                  itemBuilder: (context, index) {
                    final char = _filteredCharacters[index];
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.8, end: 1),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: scale,
                            child: _buildCharacterCard(char),
                          ),
                        );
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String status, IconData icon, Color color) {
    final bool isSelected = _selectedStatus == status;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? color.withOpacity(0.9)
              : const Color(0xFF1F2833),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(color: color, width: 1),
        ),
        onPressed: () {
          setState(() {
            _selectedStatus = status;
          });
          _filterCharacters();
        },
        icon: Icon(icon, size: 18),
        label: Text(
          status,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildCharacterCard(Result char) {
    return GestureDetector(
      onTap: () => _showCharacterDialog(char),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1F2833), Color(0xFF2B2D42)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF66FCF1), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                char.image ?? '',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      char.name ?? "Unknown",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: getStatusColor(char.status),
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          char.status?.name ?? 'Unknown',
                          style: TextStyle(
                            color: getStatusColor(char.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          char.gender?.name ?? 'Unknown',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white70,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            char.location?.name ?? 'Unknown',
                            style: const TextStyle(color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCharacterDialog(Result char) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1F2833),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                char.image ?? '',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
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
            _infoBox(
              Icons.favorite,
              "Status",
              char.status?.name ?? "Unknown",
              getStatusColor(char.status),
            ),
            _infoBox(
              Icons.person,
              "Gender",
              char.gender?.name ?? "Unknown",
              Colors.white70,
            ),
            _infoBox(
              Icons.biotech,
              "Species",
              char.species?.name ?? "Unknown",
              Colors.white70,
            ),
            _infoBox(
              Icons.public,
              "Origin",
              char.origin?.name ?? "Unknown",
              Colors.white70,
            ),
            _infoBox(
              Icons.map,
              "Location",
              char.location?.name ?? "Unknown",
              Colors.white70,
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
    );
  }

  Widget _infoBox(IconData icon, String label, String value, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0C10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            "$label: ",
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white70),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
