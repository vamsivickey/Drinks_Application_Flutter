import 'package:flutter/material.dart';

void main() {
  runApp(DrinkListApp());
}

class DrinkListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrinkList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _DrinkListState extends State<DrinkList> {
  int teaCount = 0;
  int coffeeCount = 0;
  bool _isExpanded = false;

  void _incrementTeaCount() {
    setState(() {
      teaCount++;
    });
  }

  void _decrementTeaCount() {
    setState(() {
      if (teaCount > 0) {
        teaCount--;
      }
    });
  }

  void _incrementCoffeeCount() {
    setState(() {
      coffeeCount++;
    });
  }

  void _decrementCoffeeCount() {
    setState(() {
      if (coffeeCount > 0) {
        coffeeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: SafeArea(
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            flexibleSpace: Stack(
              children: [
                Image.asset(
                  "assets/header.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 70,
                ),
                Positioned(
                  top: 15,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset(
            "assets/line.png",
            fit: BoxFit.contain,
            width: 600,
            height: 70,
          ),
          Text(
            "Add drinks",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Lorem ipsum dolor sit amet, Lorem ipsum sit door",
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 24.0),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      teaCount = 1;
                      coffeeCount = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Tea",
                        style: TextStyle(
                          fontWeight: teaCount > 0 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      _buildDrinkCard(
                        imageAsset: "assets/tea.png",
                        count: teaCount,
                        increment: _incrementTeaCount,
                        decrement: _decrementTeaCount,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      teaCount = 0;
                      coffeeCount = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Coffee",
                        style: TextStyle(
                          fontWeight: coffeeCount > 0 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      _buildDrinkCard(
                        imageAsset: "assets/coffee.png",
                        count: coffeeCount,
                        increment: _incrementCoffeeCount,
                        decrement: _decrementCoffeeCount,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Set the counts accordingly for Juice
                    setState(() {
                      teaCount = 0;
                      coffeeCount = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Juice",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      _buildDrinkCard(
                        imageAsset: "assets/juice.jpg",
                        count: 0, // You can set the initial count as needed
                        increment: () {},
                        decrement: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Set the counts accordingly for Milk
                    setState(() {
                      teaCount = 0;
                      coffeeCount = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Milk",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      _buildDrinkCard(
                        imageAsset: "assets/milk.jpg",
                        count: 0,
                        increment: () {},
                        decrement: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          _buildAddDrinksSection(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(

            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            style: ElevatedButton.styleFrom(

              primary: Colors.cyan[900], // Set the color to dark green
              onPrimary: Colors.white,

            ),
            child: Text(_isExpanded ? "Hide Drinks" : "Next"),

          ),
        ),
      ),

    );
  }

  Widget _buildDrinkCard({
    required String imageAsset,
    required int count,
    required VoidCallback increment,
    required VoidCallback decrement,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: decrement,
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18.0),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: increment,
              ),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _buildAddDrinksSection() {
    return Visibility(
      visible: _isExpanded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          Image.asset(
            "assets/line.png",
            fit: BoxFit.contain,
            width: 600,
            height: 70,
          ),
          SizedBox(height: 16.0),
          Text(
            "Add Drinks",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Lorem ipsum dolor sit amet, Lorem ipsum sit door",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          _buildDrinkCard(
            imageAsset: "assets/tea.png",
            count: teaCount,
            increment: _incrementTeaCount,
            decrement: _decrementTeaCount,
          ),
          SizedBox(height: 16.0),
          _buildDrinkCard(
            imageAsset: "assets/coffee.png",
            count: coffeeCount,
            increment: _incrementCoffeeCount,
            decrement: _decrementCoffeeCount,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class DrinkList extends StatefulWidget {
  const DrinkList();

  @override
  _DrinkListState createState() => _DrinkListState();
}
