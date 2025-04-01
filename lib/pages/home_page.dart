import 'package:flutter/material.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';
import 'package:flutter_travel_app/pages/trip_details_page.dart';
import 'package:flutter_travel_app/widgets/home_trip_card.dart';
import 'package:flutter_travel_app/widgets/home_trip_card_lg.dart';
import 'package:flutter_travel_app/widgets/stacked_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundImage: AssetImage(Assets.images.ellipse36.path),
            ),
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.only(left: 0),
              child: Text(
                'Your trips',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "Current trip".toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildMainTripCard(context),
            const SizedBox(height: 32),
            _buildTripSmallards(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Stack _buildMainTripCard(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () => _openTripDetails(context),
          child: const HomeTripCardLg(),
        ),
        Positioned(
          bottom: -20,
          left: 20,
          child: StackedRow(
            items:
                [
                      Assets.images.ellipse36.path,
                      Assets.images.ellipse39.path,
                      Assets.images.ellipse37.path,
                    ]
                    .map(
                      (e) => Hero(
                        tag: e,
                        child: CircleAvatar(backgroundImage: AssetImage(e)),
                      ),
                    )
                    .toList(),
            size: 42,
            direction: TextDirection.rtl,
            xShift: 10,
          ),
        ),
      ],
    );
  }

  void _openTripDetails(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return const TripDetailsPage();
        },
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return Align(child: FadeTransition(opacity: animation, child: child));
        },
        opaque: false,
      ),
    );
  }

  Widget _buildTripSmallards() {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        mainAxisExtent: 220,
        crossAxisSpacing: 8,
      ),
      shrinkWrap: true,
      children: [
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/2377432/pexels-photo-2377432.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          date: 'Mar 7-21',
          title: 'Road trips over Italina Riviera',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1615807/pexels-photo-1615807.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          date: 'Jan 7-23',
          title: 'Weekend in Listbon',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1559908/pexels-photo-1559908.jpeg?auto=compress&cs=tinysrgb&w=600',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1550348/pexels-photo-1550348.jpeg?auto=compress&cs=tinysrgb&w=600',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        ),
      ],
    );
  }
}
