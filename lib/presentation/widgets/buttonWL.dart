import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class ButtonWL extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const ButtonWL({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed    
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  onPressed: () => isLoading ? null : onPressed(),
                  child: isLoading
                      ? SizedBox(
                          width : 20,
                          height: 20,
                          child : CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(ColorManger.white),
                            strokeWidth: 1.5,
                          ),
                        )
                      : Text(text)
              );
  }
}