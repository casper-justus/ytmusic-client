library ytmusic_client.core.services.sponsor_block;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

final _logger = Logger('SponsorBlock');

class SponsorBlockService {
  static const String _apiUrl = 'https://sponsor.ajay.app/api';

  final Dio _dio;

  SponsorBlockService({Dio? dio}) : _dio = dio ?? _createDefaultDio();

  static Dio _createDefaultDio() {
    return Dio(BaseOptions(
      baseUrl: _apiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'User-Agent': 'YTMusicClient/1.0',
      },
    ));
  }

  Future<List<SponsorSegment>?> getSegments(String videoId) async {
    try {
      final response = await _dio.get(
        '/skipSegments',
        queryParameters: {
          'videoID': videoId,
          'categories': jsonEncode([
            'sponsor',
            'intro',
            'outro',
            'selfpromo',
            'interaction',
            'music_offtopic'
          ]),
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map(
                (json) => SponsorSegment.fromJson(json as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 404) {
        return null;
      }
    } catch (e) {
      _logger.warning('SponsorBlock fetch failed for $videoId: $e');
    }
    return null;
  }

  Future<void> submitSegment(SponsorSegment segment) async {
    try {
      await _dio.post(
        '/submitSegments',
        data: segment.toJson(),
      );
    } catch (e) {
      _logger.warning('SponsorBlock submit failed: $e');
    }
  }

  Future<void> voteSegment(String uuid, int category, bool upvote) async {
    try {
      await _dio.post(
        '/vote',
        queryParameters: {
          'UUID': uuid,
          'category': category,
          'type': upvote ? 1 : 0,
        },
      );
    } catch (e) {
      _logger.warning('SponsorBlock vote failed: $e');
    }
  }

  List<Duration> getSkipRanges(
      String videoId, Duration currentPosition, List<SponsorSegment> segments) {
    final ranges = <Duration>[];
    for (final segment in segments) {
      if (segment.segment.isNotEmpty) {
        final start = segment.segment[0];
        final end = segment.segment[1];
        if (currentPosition >= start && currentPosition < end) {
          ranges.add(end - currentPosition);
        }
      }
    }
    return ranges;
  }
}

class SponsorSegment {
  final String uuid;
  final String videoId;
  final List<Duration> segment;
  final String category;
  final int votes;
  final String submitter;

  SponsorSegment({
    required this.uuid,
    required this.videoId,
    required this.segment,
    required this.category,
    required this.votes,
    required this.submitter,
  });

  factory SponsorSegment.fromJson(Map<String, dynamic> json) {
    final segmentData = json['segment'] as List<dynamic>?;
    final segment = segmentData
            ?.map((e) => Duration(seconds: (e as num).toInt()))
            .toList() ??
        [];

    return SponsorSegment(
      uuid: json['UUID'] as String? ?? '',
      videoId: json['videoID'] as String? ?? '',
      segment: segment,
      category: json['category'] as String? ?? '',
      votes: json['votes'] as int? ?? 0,
      submitter: json['submitter'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'UUID': uuid,
        'videoID': videoId,
        'segment': segment.map((d) => d.inSeconds).toList(),
        'category': category,
        'votes': votes,
        'submitter': submitter,
      };
}

enum SponsorCategory {
  sponsor,
  intro,
  outro,
  selfpromo,
  interaction,
  music_offtopic
}

extension SponsorCategoryExtension on SponsorCategory {
  String get value {
    switch (this) {
      case SponsorCategory.sponsor:
        return 'sponsor';
      case SponsorCategory.intro:
        return 'intro';
      case SponsorCategory.outro:
        return 'outro';
      case SponsorCategory.selfpromo:
        return 'selfpromo';
      case SponsorCategory.interaction:
        return 'interaction';
      case SponsorCategory.music_offtopic:
        return 'music_offtopic';
    }
  }
}
