library ytmusic_client.shared.widgets.mini_player;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import '../../core/domain/queue_controller.dart';
import '../../core/domain/audio_player.dart';
import '../../core/presentation/providers.dart';
import '../models/track.dart';

final _logger = Logger('MiniPlayer');

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queueState = ref.watch(queueControllerProvider).currentState;
    final playerState = ref.watch(audioPlayerProvider).currentState;
    final position = ref.watch(audioPlayerProvider).position;
    final duration = ref.watch(audioPlayerProvider).duration;

    final track = queueState.currentTrack;

    if (track.id.isEmpty) {
      return const SizedBox.shrink();
    }

    final isPlaying = playerState == PlayerState.playing;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        elevation: 8,
        color: Theme.of(context).colorScheme.surface,
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              // Artwork
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  track.artworkUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 56,
                    height: 56,
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.music_note,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Track info
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      track.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      track.artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),

              // Progress bar
              SizedBox(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (duration != null && duration > Duration.zero)
                      LinearProgressIndicator(
                        value: duration.inMilliseconds > 0
                            ? position.inMilliseconds / duration.inMilliseconds
                            : 0.0,
                        minHeight: 2,
                        backgroundColor:
                            Theme.of(context).colorScheme.outlineVariant,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      )
                    else
                      const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(position),
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                        Text(
                          _formatDuration(duration ?? Duration.zero),
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Controls
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shuffle,
                      color: queueState.mode == PlaybackMode.shuffle
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () =>
                        ref.read(queueControllerProvider).shuffleQueue(),
                    tooltip: 'Shuffle',
                    iconSize: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () =>
                        ref.read(queueControllerProvider).previous(),
                    tooltip: 'Previous',
                    iconSize: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          ref.read(audioPlayerProvider).pause();
                        } else {
                          ref.read(audioPlayerProvider).resume();
                        }
                      },
                      tooltip: isPlaying ? 'Pause' : 'Play',
                      iconSize: 24,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () => ref.read(queueControllerProvider).next(),
                    tooltip: 'Next',
                    iconSize: 24,
                  ),
                  IconButton(
                    icon: Icon(
                      queueState.mode == PlaybackMode.repeatOne
                          ? Icons.repeat_one
                          : queueState.mode == PlaybackMode.repeatAll
                              ? Icons.repeat
                              : Icons.repeat,
                      color: queueState.mode != PlaybackMode.sequential
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {
                      final modes = [
                        PlaybackMode.sequential,
                        PlaybackMode.repeatAll,
                        PlaybackMode.repeatOne,
                      ];
                      final currentIndex = modes.indexOf(queueState.mode);
                      final nextMode = modes[(currentIndex + 1) % modes.length];
                      ref
                          .read(queueControllerProvider)
                          .setPlaybackMode(nextMode);
                    },
                    tooltip: 'Repeat',
                    iconSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
