import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late ScrollController _scrollController;

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            _isVisible = false; // Hide the header when scrolling down
          });
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isVisible == false) {
          setState(() {
            _isVisible = true; // Show the header when scrolling up
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 900;

        return Scaffold(
          appBar: _isVisible
              ? AppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 100,
                  automaticallyImplyLeading:
                      false, // Disable leading for custom button
                  title: Center(
                    child: isMobile
                        ? _buildMobileHeader(context)
                        : _buildWebHeader(),
                  ),
                )
              : null, // Hide the AppBar when _isVisible is false
          endDrawer: isMobile
              ? Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child:
                            Text('Menu', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        title: const Text('Beranda'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Destinasi'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Tentang Kami'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Artikel'),
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              : null, // No drawer on web view
        );
      },
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'images/Santafi_logo.png',
          height: 50, // Smaller logo size for mobile
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildWebHeader() {
    return SizedBox(
      width: 1283,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/Santafi_logo.png',
            height: 60,
            fit: BoxFit.contain,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text(
                  'Beranda',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Destinasi');
                },
                child: const Text(
                  'Destinasi',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/TentangKami');
                },
                child: const Text(
                  'Tentang Kami',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Artikel');
                },
                child: const Text(
                  'Artikel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.blue[900],
                ),
                child: const Text(
                  'Daftar',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
