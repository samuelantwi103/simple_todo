import 'package:flutter/material.dart';

// User Task Screen
class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const NeverScrollableScrollPhysics(),
      child: SizedBox(
        // color: Colors.amber,
        height: 0.6 * MediaQuery.of(context).size.height,
        child: Center(
          child: RichText(
            softWrap: true,
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                const TextSpan(text: "Great 😁\n"),
                const TextSpan(text: "Don't have any tasks yet\n"),
                TextSpan(
                    text: "Work on some standups while you wait\n",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
