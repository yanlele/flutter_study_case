import 'package:flutter/material.dart';

/// loading 组件
void showLoading(BuildContext context, {String text = "loading"}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(minWidth: 180, minHeight: 120),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Text(text, style: Theme.of(context).textTheme.bodyText2),
              )
            ],
          ),
        ),
      );
    },
  );
}
