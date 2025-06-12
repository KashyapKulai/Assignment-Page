import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
void main(){
  runApp(const MaterialApp(
      home: HomeScreen(),
    )
  );
} 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      bottomNavigationBar: MotionTabBar(
        labels: ["Home", "Category", "Wishlist", "Cart", "Account"],
        icons: [
          Icons.home,
          Icons.grid_view,
          Icons.favorite,
          Icons.shopping_cart,
          Icons.person,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(fontSize: 0),
        tabIconColor: Colors.grey,
        tabIconSelectedColor:Colors.white,
        tabSelectedColor: const Color.fromARGB(255, 235, 62, 160),
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController.index = value;
          });
        },
        initialSelectedTab: "Home",
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          _buildHomeContent(),
          Center(child: Text("Category")),
          Center(child: Text("Wishlist")),
          Center(child: Text("Cart")),
          Center(child: Text("Account")),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildBanner(),
            const SizedBox(height: 20),
            _buildCategoryTabs(context),
            const SizedBox(height: 20),
            _buildPopularSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.grid_view, color: Colors.black),
        ),
        const Text('Home', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        CircleAvatar(
          backgroundColor: Colors.orange,
          child: const Icon(Icons.person, color: Colors.white),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Search...'))),
          Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [Color(0xFFB226B2), Color(0xFF6821D1)]),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Get Special Discount', style: TextStyle(fontSize: 16, color: Colors.white)),
                  SizedBox(height: 6),
                  Text('50% OFF', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.network(
              'https://img.freepik.com/free-photo/pair-trainers_144627-3799.jpg',
              height: 100,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryTabs(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 204, 78, 126),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('All'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Footwear'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Watch'),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 204, 78, 126),
          ),
          child: const Text('View All'),
        ),
      ],
    );
  }

  Widget _buildPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Popular', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 190,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ProductCard(name: 'Nike Shoes', price: '\$12.00', imageUrl: 'https://img.freepik.com/free-photo/green-running-shoes_144627-3798.jpg'),
              ProductCard(name: 'Chair', price: '\$10.00', imageUrl: 'https://img.freepik.com/free-photo/pink-chair_53876-96804.jpg'),
            ],
          ),
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const ProductCard({super.key, required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.green, fontSize: 13)),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<bool> favoriteStatus = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.grid_view, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchAndSortBar(),
            const SizedBox(height: 20),
            const Text('Sports Shoes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndSortBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Sports shoes'))),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
          ),
          child: const Icon(Icons.sort, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildProductGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.75,
      children: List.generate(6, (index) => _buildProductCard(index)),
    );
  }

  Widget _buildProductCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: Image.network(
                  'https://img.freepik.com/free-photo/pair-trainers_144627-3799.jpg',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(
                    favoriteStatus[index] ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      favoriteStatus[index] = !favoriteStatus[index];
                    });
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Shoes', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                const Text('\$100.00', style: TextStyle(color: Colors.black, fontSize: 13)),
                const SizedBox(height: 1),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.yellow, size: 13),
                    Icon(Icons.star, color: Colors.yellow, size: 13),
                    Icon(Icons.star, color: Colors.yellow, size: 13),
                    Icon(Icons.star_half, color: Colors.yellow, size: 13),
                    Icon(Icons.star_border, color: Colors.yellow, size: 13),
                  ],
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 232, 87, 142),
                    radius: 14,
                    child: Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
