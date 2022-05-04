import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';

class CustomSwitchComponent extends StatelessWidget {
  const CustomSwitchComponent({
    Key? key,
    required this.values,
    required this.onTap,
    required this.selectedValue,
  }) : super(key: key);
  final List values;
  final String selectedValue;
  final void Function(String value) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
          children: values
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    if (e != selectedValue) {
                      onTap(e);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: e == selectedValue ? ColorConstants.grey : null),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 3),
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: e == selectedValue
                                ? ColorConstants.lightGrey
                                : ColorConstants.grey),
                      ),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
