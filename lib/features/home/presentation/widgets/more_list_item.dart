import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assessment/core/constants/assets.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';

class MoreListItem extends StatelessWidget {
  const MoreListItem({super.key, required this.title, this.isNew});
  final String title;
  final bool? isNew;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(borderColor), width: 1)),
      ),
      child: ListTile(
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2A2F36),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(Assets.orbIcons, width: 24, height: 24),
          ),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            if (isNew == true)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFFF79009).withOpacity(0.1),
                ),
                child: Text(
                  'New',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: const Color(0xFFF79009)),
                ),
              ),
            if (isNew == true) const SizedBox(width: 8), 
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}