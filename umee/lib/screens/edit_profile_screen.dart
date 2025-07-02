import 'dart:io';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final UserProfile initialProfile;
  const EditProfileScreen({required this.initialProfile, Key? key})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _bioCtrl;
  String? _imagePath;
  final List<String> _allCommunities = [
    'Anytime Fitness',
    'Goldie\'s Gym',
    'Sam\'s Book Club',
  ];
  late Set<String> _selectedComms;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialProfile.name);
    _bioCtrl = TextEditingController(text: widget.initialProfile.bio);
    _imagePath = widget.initialProfile.imageUrl;
    _selectedComms = Set.of(widget.initialProfile.communities ?? []);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => _imagePath = file.path);
    }
  }

  void _save() {
    final updated = UserProfile(
      name: _nameCtrl.text,
      bio: _bioCtrl.text,
      imageUrl: _imagePath!,
      communities: _selectedComms.toList(),
    );
    Navigator.pop(context, updated);
  }

  @override
  Widget build(BuildContext context) {
    late ImageProvider avatarImage;
    if (_imagePath!.startsWith('assets/')) {
      avatarImage = AssetImage(_imagePath!);
    } else if (_imagePath!.startsWith('http')) {
      avatarImage = NetworkImage(_imagePath!);
    } else {
      avatarImage = FileImage(File(_imagePath!));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(
        color: Colors.white,),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('SAVE', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: avatarImage,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _nameCtrl,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.yellow),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purpleAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _bioCtrl,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Bio',
                  labelStyle: const TextStyle(color: Colors.yellow),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purpleAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Communities',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _allCommunities.map((comm) {
                  final selected = _selectedComms.contains(comm);
                  return ChoiceChip(
                    label: Text(
                      comm,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.deepPurple,
                      ),
                    ),
                    selected: selected,
                    selectedColor: Colors.deepPurple,
                    backgroundColor: Colors.grey.shade200,
                    onSelected: (on) {
                      setState(() {
                        if (on) {
                          _selectedComms.add(comm);
                        } else {
                          _selectedComms.remove(comm);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black12,
    );
  }
}