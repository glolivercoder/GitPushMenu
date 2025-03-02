import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF00FF00),
        scaffoldBackgroundColor: Color(0xFF0A0A0A),
      ),
      home: Scaffold(
        body: Center(
          child: ActionWorkflow(),
        ),
      ),
    );
  }
}

class ActionWorkflow extends StatefulWidget {
  @override
  _ActionWorkflowState createState() => _ActionWorkflowState();
}

class _ActionWorkflowState extends State<ActionWorkflow> {
  bool isRepoDropdownOpen = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          isRepoDropdownOpen = false; // Fecha o dropdown quando o campo perde o foco
        });
      }
    });
  }

  void _toggleDropdown() {
    setState(() {
      isRepoDropdownOpen = !isRepoDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isRepoDropdownOpen) {
          setState(() {
            isRepoDropdownOpen = false; // Fecha o dropdown se o usuário tocar fora
          });
        }
      },
      child: Card(
        elevation: 8,
        color: Color(0xFF111111),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 320,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Color(0xFF00FF00),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'in sync',
                              style: TextStyle(color: Color(0xFF00FF00), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings, color: Color(0xFF00FF00)),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Color(0xFF00FF00)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Content
              Text(
                'Comand Smart Repo Tools',
                style: TextStyle(
                  color: Color(0xFF00FF00),
                  fontSize: 18,
                  fontFamily: 'monospace',
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 4),
              Container(
                height: 2,
                color: Colors.yellowAccent,
              ),
              SizedBox(height: 2),
              Container(
                height: 2,
                color: Colors.yellowAccent,
              ),
              SizedBox(height: 16),

              // Repository Search
              Stack(
                children: [
                  TextField(
                    focusNode: _focusNode, // Adicionando o FocusNode
                    onTap: () {
                      // Evitar alternar rapidamente o estado
                      Future.delayed(Duration(milliseconds: 100), () {
                        _toggleDropdown();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search repository...',
                      filled: true,
                      fillColor: Color(0xFF1A1A1A),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF00FF00)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: Icon(Icons.search, color: Color(0xFF00FF00)),
                    ),
                  ),
                  if (isRepoDropdownOpen)
                    Positioned(
                      top: 60,
                      child: Container(
                        width: 320, // Ajuste a largura para não ocupar toda a tela
                        decoration: BoxDecoration(
                          color: Color(0xFF1A1A1A),
                          border: Border.all(color: Color(0xFF00FF00)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            for (var repo in ['user/repo-1', 'user/repo-2', 'user/repo-3'])
                              ListTile(
                                title: Text(repo, style: TextStyle(color: Color(0xFF00FF00))),
                                onTap: () {
                                  setState(() {
                                    isRepoDropdownOpen = false; // Fecha o dropdown após a seleção
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),

              // Dropdown for Repository Selection
              DropdownButton<String>(
                hint: Text('Select repository', style: TextStyle(color: Color(0xFF00FF00))),
                dropdownColor: Color(0xFF1A1A1A),
                items: [
                  DropdownMenuItem(value: 'user/repo-1', child: Text('user/repo-1')),
                  DropdownMenuItem(value: 'user/repo-2', child: Text('user/repo-2')),
                  DropdownMenuItem(value: 'user/repo-3', child: Text('user/repo-3')),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 16),

              // Branch Selection
              DropdownButton<String>(
                hint: Text('Select branch', style: TextStyle(color: Color(0xFF00FF00))),
                dropdownColor: Color(0xFF1A1A1A),
                items: [
                  DropdownMenuItem(value: 'main', child: Text('main')),
                  DropdownMenuItem(value: 'develop', child: Text('develop')),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 16),

              // Commit Search
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search commit...',
                  filled: true,
                  fillColor: Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00FF00)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: Icon(Icons.search, color: Color(0xFF00FF00)),
                ),
              ),
              SizedBox(height: 8),
              // Dropdown for Commit Selection
              DropdownButton<String>(
                hint: Text('Select commit', style: TextStyle(color: Color(0xFF00FF00))),
                dropdownColor: Color(0xFF1A1A1A),
                items: [
                  DropdownMenuItem(value: 'latest', child: Text('Latest commit')),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 16),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A1A1A),
                      foregroundColor: Color(0xFF00FF00),
                      elevation: 5, // Adicionando elevação
                    ),
                    onPressed: () {},
                    child: Text('Push'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A1A1A),
                      foregroundColor: Color(0xFF00FF00),
                      elevation: 5, // Adicionando elevação
                    ),
                    onPressed: () {},
                    child: Text('Pull'),
                  ),
                  DropdownButton<String>(
                    hint: Text('Deploy to...', style: TextStyle(color: Color(0xFF00FF00))),
                    dropdownColor: Color(0xFF1A1A1A),
                    items: [
                      DropdownMenuItem(value: 'netlify', child: Text('Netlify')),
                      DropdownMenuItem(value: 'vercel', child: Text('Vercel')),
                      DropdownMenuItem(value: 'heroku', child: Text('Heroku')),
                      DropdownMenuItem(value: 'digitalocean', child: Text('DigitalOcean')),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}