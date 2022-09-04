import 'package:fluent_ui/fluent_ui.dart';

class MyCard extends Card {
  const MyCard(
      {super.key,
      this.paddings,
      this.contentPadding,
      this.borderRd,
      this.elevations,
      this.color,
      required this.child})
      : super(child: child);

  final EdgeInsets? paddings;
  final EdgeInsets? contentPadding;
  final double? elevations;
  final double? borderRd;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings ?? const EdgeInsets.all(10),
      child: Card(
        elevation: elevation,
        backgroundColor: color,
        padding: contentPadding ?? const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(borderRd ?? 10),
        child: child,
      ),
    );
  }
}



// class MyCard extends Container {
//   MyCard(
//       {super.key,
//       this.padding,
//       this.margin,
//       this.borderRadius,
//       this.color,
//       this.shadowColor,
//       required this.child});

//   final EdgeInsets? padding;
//   final EdgeInsets? margin;
//   final double? borderRadius;
//   final Color? color;
//   final Color? shadowColor;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding ?? const EdgeInsets.all(10),
//       margin: margin ?? const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: color ?? Colors.white,
//           borderRadius: BorderRadius.circular(borderRadius ?? 10),
//           boxShadow: [
//             BoxShadow(
//                 blurRadius: 6,
//                 offset: const Offset(3, -3),
//                 color: shadowColor ?? Colors.transparent),
//             BoxShadow(
//                 blurRadius: 6,
//                 offset: const Offset(-3, 3),
//                 color: shadowColor ?? Colors.transparent)
//           ]),
//       child: child,
//     );
//   }
// }

