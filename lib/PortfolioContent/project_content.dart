import 'package:flutter/material.dart';
import '../data/project_data.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';

class ProjectsContent extends StatefulWidget {
  const ProjectsContent({Key? key}) : super(key: key);

  @override
  _ProjectsContentState createState() => _ProjectsContentState();
}

class _ProjectsContentState extends State<ProjectsContent> {
  final TextEditingController _controller = TextEditingController();
  List<Project> _filteredProjects = projects;

  void _filterProjects(String query) {
    setState(() {
      _filteredProjects = projects.where((project) {
        final lowerCaseQuery = query.toLowerCase();
        return project.title.toLowerCase().contains(lowerCaseQuery) ||
            project.description1.toLowerCase().contains(lowerCaseQuery) ||
            project.description2.toLowerCase().contains(lowerCaseQuery);
      }).toList();
    });
  }

  void _applyFilter() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Options'),
        content: const Text('Filter functionality not implemented yet.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildSearchField(),
          Expanded(child: _buildProjectList()),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        onChanged: _filterProjects,
        cursorColor: const Color.fromARGB(255, 223, 85, 50),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 223, 85, 50)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: 'Search a project',
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: _buildSearchButton(),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 85, 50),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () => _filterProjects(_controller.text),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildProjectList() {
    if (_filteredProjects.isEmpty) {
      return const Center(child: Text('No projects found.'));
    }

    return ListView.builder(
      itemCount: _filteredProjects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: _filteredProjects[index]);
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      width: 110,
      height: 44,
      child: FloatingActionButton.extended(
        onPressed: _applyFilter,
        backgroundColor: const Color.fromARGB(255, 223, 85, 50),
        label: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.filter_list, color: Colors.white),
            SizedBox(width: 8),
            Text('Filter', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
