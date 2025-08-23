import 'dart:ui';
import 'package:flutter/material.dart';

class SkeletonLoader extends StatefulWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration animationDuration;
  final Widget? child;

  const SkeletonLoader({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.animationDuration = const Duration(milliseconds: 1200),
    this.child,
  });

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..repeat();
    
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutSine,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    final baseColor = widget.baseColor ?? 
        (isDarkMode 
            ? Colors.white.withOpacity(0.1)
            : Colors.grey.withOpacity(0.3));
    
    final highlightColor = widget.highlightColor ?? 
        (isDarkMode 
            ? Colors.white.withOpacity(0.2)
            : Colors.grey.withOpacity(0.1));

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                0.0,
                _animation.value,
                1.0,
              ],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

// Pre-built skeleton components for common use cases
class SkeletonText extends StatelessWidget {
  final double? width;
  final double height;
  final int lines;
  final double spacing;

  const SkeletonText({
    super.key,
    this.width,
    this.height = 14,
    this.lines = 1,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(lines, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index < lines - 1 ? spacing : 0),
          child: SkeletonLoader(
            width: index == lines - 1 && lines > 1 
                ? (width ?? double.infinity) * 0.7
                : width,
            height: height,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class SkeletonAvatar extends StatelessWidget {
  final double size;
  final bool isCircular;

  const SkeletonAvatar({
    super.key,
    this.size = 40,
    this.isCircular = true,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      width: size,
      height: size,
      borderRadius: isCircular 
          ? BorderRadius.circular(size / 2)
          : BorderRadius.circular(8),
    );
  }
}

class SkeletonCard extends StatelessWidget {
  final double? width;
  final double height;
  final EdgeInsets padding;
  final bool hasAvatar;
  final bool hasTitle;
  final bool hasSubtitle;
  final int textLines;

  const SkeletonCard({
    super.key,
    this.width,
    this.height = 120,
    this.padding = const EdgeInsets.all(16),
    this.hasAvatar = false,
    this.hasTitle = true,
    this.hasSubtitle = true,
    this.textLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withOpacity(0.05)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasAvatar) ...[
              const SkeletonAvatar(),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasTitle)
                    const SkeletonText(
                      height: 16,
                      width: 150,
                    ),
                  if (hasTitle && hasSubtitle) const SizedBox(height: 8),
                  if (hasSubtitle)
                    SkeletonText(
                      height: 12,
                      lines: textLines,
                      width: double.infinity,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkeletonList extends StatelessWidget {
  final int itemCount;
  final double itemHeight;
  final EdgeInsets padding;
  final double spacing;
  final bool hasAvatar;
  final bool hasTitle;
  final bool hasSubtitle;

  const SkeletonList({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 80,
    this.padding = const EdgeInsets.all(16),
    this.spacing = 12,
    this.hasAvatar = true,
    this.hasTitle = true,
    this.hasSubtitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: List.generate(itemCount, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index < itemCount - 1 ? spacing : 0),
            child: SkeletonCard(
              height: itemHeight,
              padding: const EdgeInsets.all(12),
              hasAvatar: hasAvatar,
              hasTitle: hasTitle,
              hasSubtitle: hasSubtitle,
            ),
          );
        }),
      ),
    );
  }
}

class SkeletonGlassCard extends StatelessWidget {
  final double? width;
  final double height;
  final EdgeInsets padding;
  final bool hasIcon;
  final bool hasTitle;
  final bool hasSubtitle;
  final int textLines;

  const SkeletonGlassCard({
    super.key,
    this.width,
    this.height = 100,
    this.padding = const EdgeInsets.all(20),
    this.hasIcon = true,
    this.hasTitle = true,
    this.hasSubtitle = true,
    this.textLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.white.withOpacity(0.15)
                : const Color(0xFF7986CB).withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: padding,
            child: Row(
              children: [
                if (hasIcon) ...[
                  SkeletonLoader(
                    width: 48,
                    height: 48,
                    borderRadius: BorderRadius.circular(12),
                    baseColor: Colors.white.withOpacity(0.2),
                    highlightColor: Colors.white.withOpacity(0.4),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (hasTitle)
                        SkeletonLoader(
                          width: 120,
                          height: 16,
                          borderRadius: BorderRadius.circular(4),
                          baseColor: Colors.white.withOpacity(0.3),
                          highlightColor: Colors.white.withOpacity(0.5),
                        ),
                      if (hasTitle && hasSubtitle) const SizedBox(height: 8),
                      if (hasSubtitle)
                        ...List.generate(textLines, (index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index < textLines - 1 ? 4 : 0,
                            ),
                            child: SkeletonLoader(
                              width: index == textLines - 1 && textLines > 1
                                  ? 80
                                  : double.infinity,
                              height: 12,
                              borderRadius: BorderRadius.circular(4),
                              baseColor: Colors.white.withOpacity(0.2),
                              highlightColor: Colors.white.withOpacity(0.4),
                            ),
                          );
                        }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkeletonMapLoader extends StatelessWidget {
  final double? width;
  final double? height;
  final String message;

  const SkeletonMapLoader({
    super.key,
    this.width,
    this.height,
    this.message = 'Loading map...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SkeletonLoader(
            width: 60,
            height: 60,
            borderRadius: BorderRadius.circular(30),
            baseColor: Colors.white.withOpacity(0.2),
            highlightColor: Colors.white.withOpacity(0.4),
          ),
          const SizedBox(height: 16),
          SkeletonText(
            width: 100,
            height: 14,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// Search skeleton for search results
class SkeletonSearchResult extends StatelessWidget {
  final int itemCount;

  const SkeletonSearchResult({
    super.key,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(itemCount, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: SkeletonGlassCard(
            height: 70,
            padding: const EdgeInsets.all(16),
            hasIcon: true,
            hasTitle: true,
            hasSubtitle: true,
            textLines: 1,
          ),
        );
      }),
    );
  }
}
