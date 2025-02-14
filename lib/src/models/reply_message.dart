/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import '../values/enumaration.dart';

class ReplyMessage {
  /// Provides reply message.
  final String message;

  /// Provides user id of who replied message.
  final String replyBy;

  /// Provides user id of whom to reply.
  final String replyTo;
  final MessageType messageType;

  /// Provides max duration for recorded voice message.
  final Duration? voiceMessageDuration;

  /// Id of message, it replies to.
  final String messageId;

  const ReplyMessage({
    this.messageId = '',
    this.message = '',
    this.replyTo = '',
    this.replyBy = '',
    this.messageType = MessageType.text,
    this.voiceMessageDuration,
  });

  factory ReplyMessage.fromJson(Map<String, dynamic> json) => ReplyMessage(
        message: json['message'],
        replyBy: json['replyBy'],
        replyTo: json['replyTo'],
        messageType: json["message_type"],
        messageId: json["id"],
        voiceMessageDuration: json["voiceMessageDuration"],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'replyBy': replyBy,
        'replyTo': replyTo,
        'message_type': messageType,
        'id': messageId,
        'voiceMessageDuration': voiceMessageDuration,
      };

  @override
  String toString() {
    return 'ReplyMessage(message: $message, replyBy: $replyBy, replyTo: $replyTo, messageType: $messageType, voiceMessageDuration: $voiceMessageDuration, messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is! ReplyMessage) return false;

    return other.message == message &&
        other.replyBy == replyBy &&
        other.replyTo == replyTo &&
        other.messageType == messageType &&
        other.voiceMessageDuration == voiceMessageDuration &&
        other.messageId == messageId;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        replyBy.hashCode ^
        replyTo.hashCode ^
        messageType.hashCode ^
        voiceMessageDuration.hashCode ^
        messageId.hashCode;
  }
}
