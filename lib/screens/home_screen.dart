import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/category_section.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/featured_products.dart';
import '../widgets/hero_section.dart';
import '../widgets/loading_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _isLoading = true;
  late AnimationController _loadingController;

  @override
  void initState() {
    super.initState();
    _loadingController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Simulate loading time
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _isLoading
          ? const LoadingOverlay()
          : AnimationLimiter(
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    floating: true,
                    // pinned: true,
                    expandedHeight: 80,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    flexibleSpace: CustomAppBar(),
                  ),
                  SliverToBoxAdapter(
                    child: AnimationConfiguration.staggeredList(
                      position: 0,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(child: const HeroSection()),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AnimationConfiguration.staggeredList(
                      position: 1,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(child: const CategorySection()),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AnimationConfiguration.staggeredList(
                      position: 2,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(child: const FeaturedProducts()),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              ),
            ),
    );
  }
}
