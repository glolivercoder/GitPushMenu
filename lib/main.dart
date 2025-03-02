import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF0A0A0A),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF00FF00)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F00FF00),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          // Title Bar
          Container(
            padding: EdgeInsets.all(8),
            color: Color(0xFF111111),
            child: Row(
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
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ACTIONWORKFLOW',
                  style: TextStyle(
                    color: Color(0xFF00FF00),
                    fontSize: 24,
                    fontFamily: 'monospace',
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 16),

                // Repository Search
                Stack(
                  children: [
                    TextField(
                      onTap: () {
                        setState(() {
                          isRepoDropdownOpen = !isRepoDropdownOpen;
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
                      Container(
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
                                  // Handle repo selection
                                },
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 16),

                // Branch and Commit Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      hint: Text('Select branch', style: TextStyle(color: Color(0xFF00FF00))),
                      dropdownColor: Color(0xFF1A1A1A),
                      items: [
                        DropdownMenuItem(value: 'main', child: Text('main')),
                        DropdownMenuItem(value: 'develop', child: Text('develop')),
                      ],
                      onChanged: (value) {},
                    ),
                    DropdownButton<String>(
                      hint: Text('Select commit', style: TextStyle(color: Color(0xFF00FF00))),
                      dropdownColor: Color(0xFF1A1A1A),
                      items: [
                        DropdownMenuItem(value: 'latest', child: Text('Latest commit')),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
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
                      ),
                      onPressed: () {},
                      child: Text('Push'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1A1A1A),
                        foregroundColor: Color(0xFF00FF00),
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
        ],
      ),
    );
  }
}