import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings/theme_bloc.dart';

class ThemeToggler extends StatefulWidget {
  const ThemeToggler({Key? key}) : super(key: key);

  @override
  State<ThemeToggler> createState() => _ThemeTogglerState();
}

class _ThemeTogglerState extends State<ThemeToggler>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        print(state);
        if (state.isDarkMode) {
          _controller.forward();
        } else {
          _controller.reverse();
        }

        return Container(
          padding: const EdgeInsets.all(4),
          width: 130,
          child: GestureDetector(
            onTap: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: state.isDarkMode
                            ? [
                                Colors.blue.shade900,
                                Colors.indigo.shade900,
                              ]
                            : [
                                Colors.blue.shade300,
                                Colors.lightBlue.shade200,
                              ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: state.isDarkMode ? 0.5 : 1.0,
                          child: const Icon(
                            Icons.light_mode,
                            color: Colors.yellow,
                            size: 24,
                          ),
                        ),

                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: state.isDarkMode ? 1.0 : 0.5,
                          child: const Icon(
                            Icons.dark_mode,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),

                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Positioned(
                        left: Tween<double>(begin: 4, end: 86)
                            .animate(_animation)
                            .value,
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 400),
                            turns: state.isDarkMode ? 0.5 : 0,
                            child: const Icon(
                              Icons.brightness_medium,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
