import 'package:flutter/material.dart';
import 'package:veiled_frames/features/auth/data/auth_service.dart';
import 'package:veiled_frames/features/auth/views/login.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();

  void _scroll1(double amount) {
    _scrollController1.animateTo(
      _scrollController1.position.pixels + amount,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void _scroll2(double amount) {
    _scrollController2.animateTo(
      _scrollController2.position.pixels + amount,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void _scroll3(double amount) {
    _scrollController3.animateTo(
      _scrollController3.position.pixels + amount,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  final authService = AuthService();

  void handleLogout() async {
    final response = await authService.logout();
    if (response.success) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        title: Row(
          children: <Widget>[
            Image.asset('assets/images/logo_main.png', height: 45.0),
            SizedBox(width: 10),
            Text(
              'VEILED\nFRAMES',
              style: TextStyle(
                fontFamily: 'Lisu Bosa',
                color: Color(0xFFFFFFE4),
                fontSize: 25.0,
                height: 0.90,
                fontWeight: FontWeight.w200,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Color(0xFFFFFFE4), size: 40.0),
            onPressed: () async {
              //temp logout
              handleLogout();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildSearchBarRow(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Color(0xFFFFFFE4),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 78.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFEE4540),
                  ),
                  onPressed: () => _scroll1(-100.0),
                ),
                Expanded(
                  child: ClipRect(
                    child: SizedBox(
                      height: double.infinity,
                      child: _buildCategoryRow(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFEE4540),
                  ),
                  onPressed: () => _scroll1(100.0),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Recommended',
              style: TextStyle(
                color: Color(0xFFFFFFE4),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 148.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _buildRecommendedRow(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'New Works',
              style: TextStyle(
                color: Color(0xFFFFFFE4),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 78.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFEE4540),
                  ),
                  onPressed: () => _scroll2(-100.0),
                ),
                Expanded(
                  child: ClipRect(
                    child: SizedBox(
                      height: double.infinity,
                      child: _buildNewWorksRow(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFEE4540),
                  ),
                  onPressed: () => _scroll2(100.0),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Top Artists',
              style: TextStyle(
                color: Color(0xFFFFFFE4),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 78.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFEE4540),
                  ),
                  onPressed: () => _scroll3(-100.0),
                ),
                Expanded(
                  child: ClipRect(
                    child: SizedBox(
                      height: double.infinity,
                      child: _buildTopArtistsRow(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFEE4540),
                  ),
                  onPressed: () => _scroll3(100.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //"Seach Bar, Favorites, Cart" Row
  Widget _buildSearchBarRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Color(0xFFEE4540)),
                  border: InputBorder.none,
                  hintText: 'Search an item',
                  hintStyle: TextStyle(
                    color: Color(0xFFBDBDBD),
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Color(0xFFEE4540),
              size: 30.0,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 5.0),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFEE4540),
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  //"Categories" Row
  Widget _buildCategoryRow() {
    return ListView.builder(
      controller: _scrollController1,
      scrollDirection: Axis.horizontal,
      itemCount: 9,
      itemBuilder: (context, index) {
        return _buildCategoryCard(
          _getCategoryImagePath(index),
          _getCategoryText(index),
        );
      },
    );
  }

  Widget _buildCategoryCard(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 78.0,
        width: 62.0,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFE4),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, height: 41.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 10.0,
                color: Color(0xFFC72C41),
                fontWeight: FontWeight.w600,
                height: 0.90,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryImagePath(int index) {
    List<String> imagePaths = [
      'assets/images/categories_images/oilpaint.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
      'assets/images/categories_images/acrylicpaint.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
    ];
    return imagePaths[index];
  }

  String _getCategoryText(int index) {
    List<String> categoryTexts = [
      'Oil Paint',
      'Water\ncolor',
      'Acrylic Paint',
      'Pastels',
      'Gouache',
      'Ink',
      'Graphite',
      'Charcoal',
      'Mixed Media',
    ];
    return categoryTexts[index];
  }

  //"Recommended" Row
  Widget _buildRecommendedRow() {
    return Center(
      child: SizedBox(
        height: 148.0,
        width: 354.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE54A12), Color(0xFF651B00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15.0),
              Image.asset(
                "assets/images/recommended/recommended.png",
                height: 100.0,
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    "Fresh from \nthe studio!",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32.0,
                      color: Color(0xFFFAFAF0),
                      fontWeight: FontWeight.w800,
                      height: 0.90,
                    ),
                  ),
                  Text(
                    "@artistname's latest mixed media piece. \nDon't miss it!",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0,
                      color: Color(0xFFFAFAF0),
                      fontWeight: FontWeight.w300,
                      height: 1.50,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF2672E8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 1.0,
                      ),
                      side: const BorderSide(
                        color: Color(0xFF2D142C),
                        width: 1.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Text(
                      "VISIT PROFILE",
                      style: TextStyle(
                        color: Color(0xFFFAFAF0),
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //"New Works" Row
  Widget _buildNewWorksRow() {
    return ListView.builder(
      controller: _scrollController2,
      scrollDirection: Axis.horizontal,
      itemCount: 9,
      itemBuilder: (context, index) {
        return _buildNewWorksCard(
          _getNewWorksImagePath(index),
          _getNewWorksText(index),
        );
      },
    );
  }

  Widget _buildNewWorksCard(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 78.0,
        width: 62.0,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFE4),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, height: 41.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 10.0,
                color: Color(0xFFC72C41),
                fontWeight: FontWeight.w600,
                height: 0.90,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getNewWorksImagePath(int index) {
    List<String> imagePaths = [
      'assets/images/categories_images/oilpaint.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
      'assets/images/categories_images/acrylicpaint.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
    ];
    return imagePaths[index];
  }

  String _getNewWorksText(int index) {
    List<String> categoryTexts = [
      'Oil Paint',
      'Water\ncolor',
      'Acrylic Paint',
      'Pastels',
      'Gouache',
      'Ink',
      'Graphite',
      'Charcoal',
      'Mixed Media',
    ];
    return categoryTexts[index];
  }

  //"Top Artists" Row
  Widget _buildTopArtistsRow() {
    return ListView.builder(
      controller: _scrollController3,
      scrollDirection: Axis.horizontal,
      itemCount: 9,
      itemBuilder: (context, index) {
        return _buildTopArtistCard(
          _getTopArtistImagePath(index),
          _getTopArtistText(index),
        );
      },
    );
  }

  Widget _buildTopArtistCard(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 78.0,
        width: 62.0,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFE4),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, height: 41.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 10.0,
                color: Color(0xFFC72C41),
                fontWeight: FontWeight.w600,
                height: 0.90,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTopArtistImagePath(int index) {
    List<String> imagePaths = [
      'assets/images/categories_images/oilpaint.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
      'assets/images/categories_images/acrylicpaint.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
    ];
    return imagePaths[index];
  }

  String _getTopArtistText(int index) {
    List<String> categoryTexts = [
      'Oil Paint',
      'Water\ncolor',
      'Acrylic Paint',
      'Pastels',
      'Gouache',
      'Ink',
      'Graphite',
      'Charcoal',
      'Mixed Media',
    ];
    return categoryTexts[index];
  }
}
