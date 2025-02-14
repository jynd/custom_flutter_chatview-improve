import 'package:flutter/foundation.dart';

class Reaction {
  Reaction({
    required this.reactions,
    required this.reactedUserIds,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        reactions: json['reactions'],
        reactedUserIds: json['reactedUserIds'],
      );

  /// Provides list of reaction in single message.
  final List<String> reactions;

  /// Provides list of user who reacted on message.
  final List<String> reactedUserIds;

  Map<String, dynamic> toJson() => {
        'reactions': reactions,
        'reactedUserIds': reactedUserIds,
      };

  @override
  String toString() =>
      'Reaction(reactions: $reactions, reactedUserIds: $reactedUserIds)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reaction &&
        listEquals(reactions, reactions) &&
        listEquals(reactedUserIds, reactedUserIds);
  }

  @override
  int get hashCode => reactions.hashCode ^ reactedUserIds.hashCode;
}
