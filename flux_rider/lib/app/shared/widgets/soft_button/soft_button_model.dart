import 'dart:convert';

import 'package:flutter/material.dart';

class SoftButtonModel {
  final String? label;
  final VoidCallback? onTap;

  SoftButtonModel({
    this.label,
    this.onTap,
  });

  SoftButtonModel copyWith({
    String? label,
    VoidCallback? onTap,
  }) {
    return SoftButtonModel(
      label: label ?? this.label,
      onTap: onTap ?? this.onTap,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'SoftButtonModel(label: $label, onTap: $onTap)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SoftButtonModel &&
        other.label == label &&
        other.onTap == onTap;
  }

  @override
  int get hashCode => label.hashCode ^ onTap.hashCode;
}
