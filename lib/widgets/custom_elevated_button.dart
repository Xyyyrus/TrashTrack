// import 'package:flutter/material.dart';

// class CustomElevatedButton extends StatelessWidget {
//   const CustomElevatedButton({
//     super.key,
//     this.onPressed,
//     this.isExpanded = false,
//     this.backgroundColor,
//     this.labelText,
//     this.height,
//   });

//   final void Function()? onPressed;
//   final bool isExpanded;
//   final Color? backgroundColor;
//   final String? labelText;
//   final double? height;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         fixedSize: isExpanded ? Size(double.maxFinite, height ?? 56) : null,
//         backgroundColor: backgroundColor ?? const Color(0xFF02413C),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         // side: const BorderSide(
//         //   color: Color(0xFF00EE5F),
//         //   width: 2.0,
//         // ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         elevation: 5,
//         shadowColor: Colors.black.withOpacity(0.2),
//         foregroundColor: Colors.white,
//       ),
//       child: Text(
//         labelText ?? '',
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           fontFamily: "Roboto",
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.isExpanded = false,
    this.backgroundColor,
    this.labelText,
    this.height,
    this.icon, // New icon parameter
  });

  final void Function()? onPressed;
  final bool isExpanded;
  final Color? backgroundColor;
  final String? labelText;
  final double? height;
  final Widget? icon; // New icon parameter

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: isExpanded ? Size(double.maxFinite, height ?? 56) : null,
        backgroundColor: backgroundColor ?? const Color(0xFF02413C),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.2),
        foregroundColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 8), // Spacing between icon and text
          ],
          Text(
            labelText ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto",
            ),
          ),
        ],
      ),
    );
  }
}
