part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({
    required this.isDarkMode,
  });

  @override
  List<Object?> get props => [isDarkMode];

  ThemeState copyWith({
    bool? isDarkMode,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
    };
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      isDarkMode: json['isDarkMode'] as bool,
    );
  }
}
