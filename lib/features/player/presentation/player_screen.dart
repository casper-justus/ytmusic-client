library ytmusic_client.features.player.presentation.player_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import '../../../core/domain/queue_controller.dart';
import '../../../core/domain/audio_player.dart';
import '../../../core/domain/lyrics_resolver.dart';
import '../../../core/presentation/providers.dart';
import '../../../shared/models/track.dart';

final _logger = Logger('PlayerScreen');

class PlayerScreen extends ConsumerStatefulWidget {
  const PlayerScreen({super.key});

  @override
  ConsumerState<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ConsumerState<PlayerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showQueue = false;
  bool _showLyrics = false;
  bool _showEqualizer = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queueState = ref.watch(queueControllerProvider).currentState;
    final playerState = ref.watch(audioPlayerProvider).currentState;
    final position = ref.watch(audioPlayerProvider).position;
    final duration = ref.watch(audioPlayerProvider).duration;
    final track = queueState.currentTrack;

    if (track.id.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Player')),
        body: const Center(child: Text('Nothing playing')),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cast),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _showMoreOptions,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background artwork with blur
          Positioned.fill(
            child: Image.network(
              track.artworkUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(color: Colors.black.withValues(alpha: 0.3)),
            ),
          ),
          
          // Main content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // Artwork
                Hero(
                  tag: 'artwork-${track.id}',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          track.artworkUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            child: const Icon(Icons.music_note, size: 80),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Track info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        track.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        track.artist,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (track.album != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          track.album!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Progress bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                        ),
                        child: Slider(
                          value: position.inMilliseconds.toDouble().clamp(0, (duration?.inMilliseconds ?? 1).toDouble()),
                          max: (duration?.inMilliseconds ?? 1).toDouble(),
                          onChanged: (value) {
                            ref.read(audioPlayerProvider).seek(Duration(milliseconds: value.toInt()));
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(position), style: Theme.of(context).textTheme.bodySmall),
                          Text(_formatDuration(duration ?? Duration.zero), style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Main controls
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          queueState.mode == PlaybackMode.shuffle
                              ? Icons.shuffle_on
                              : Icons.shuffle,
                          color: queueState.mode == PlaybackMode.shuffle
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () => _toggleShuffle(queueState),
                        tooltip: 'Shuffle',
                        iconSize: 28,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: () => ref.read(queueControllerProvider).previous(),
                        tooltip: 'Previous',
                        iconSize: 36,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            playerState == PlayerState.playing ? Icons.pause : Icons.play_arrow,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 32,
                          ),
                          onPressed: () {
                            if (playerState == PlayerState.playing) {
                              ref.read(audioPlayerProvider).pause();
                            } else {
                              ref.read(audioPlayerProvider).resume();
                            }
                          },
                          tooltip: playerState == PlayerState.playing ? 'Pause' : 'Play',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: () => ref.read(queueControllerProvider).next(),
                        tooltip: 'Next',
                        iconSize: 36,
                      ),
                      IconButton(
                        icon: Icon(
                          queueState.mode == PlaybackMode.repeatOne
                              ? Icons.repeat_one
                              : queueState.mode == PlaybackMode.repeatAll
                                  ? Icons.repeat_on
                                  : Icons.repeat,
                          color: queueState.mode != PlaybackMode.sequential
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () => _cycleRepeatMode(queueState),
                        tooltip: 'Repeat',
                        iconSize: 28,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Secondary controls
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          _showQueue ? Icons.queue_music_outlined : Icons.queue_music,
                          color: _showQueue ? Theme.of(context).colorScheme.primary : null,
                        ),
                        onPressed: () => setState(() => _showQueue = !_showQueue),
                        tooltip: 'Queue',
                      ),
                      IconButton(
                        icon: Icon(
                          _showLyrics ? Icons.lyrics_outlined : Icons.lyrics,
                          color: _showLyrics ? Theme.of(context).colorScheme.primary : null,
                        ),
                        onPressed: () => setState(() => _showLyrics = !_showLyrics),
                        tooltip: 'Lyrics',
                      ),
                      IconButton(
                        icon: Icon(
                          _showEqualizer ? Icons.tune_outlined : Icons.tune,
                          color: _showEqualizer ? Theme.of(context).colorScheme.primary : null,
                        ),
                        onPressed: () => setState(() => _showEqualizer = !_showEqualizer),
                        tooltip: 'Equalizer',
                      ),
                      IconButton(
                        icon: const Icon(Icons.timer),
                        onPressed: () => _showSleepTimer(),
                        tooltip: 'Sleep timer',
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // Bottom tabs for queue/lyrics/equalizer
                if (_showQueue || _showLyrics || _showEqualizer)
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildQueueTab(),
                        _buildLyricsTab(track),
                        _buildEqualizerTab(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQueueTab() {
    final queueState = ref.watch(queueControllerProvider).currentState;
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: queueState.queueList.length,
      itemBuilder: (context, index) {
        final track = queueState.queueList[index];
        final isCurrent = index == queueState.index;
        
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(track.artworkUrl, width: 48, height: 48, fit: BoxFit.cover),
          ),
          title: Text(
            track.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: isCurrent ? const TextStyle(fontWeight: FontWeight.bold, color: Colors.white) : null,
          ),
          subtitle: Text(track.artist, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: isCurrent
              ? Icon(Icons.equalizer, color: Theme.of(context).colorScheme.primary)
              : null,
          onTap: () => ref.read(queueControllerProvider).playQueue(queueState.queueList, startIndex: index),
        );
      },
    );
  }

  Widget _buildLyricsTab(Track track) {
    final lyricsAsync = ref.watch(lyricsProvider(LyricsParams(
      trackId: track.id,
      title: track.title,
      artist: track.artist,
      duration: track.duration,
    )));

    return lyricsAsync.when(
      data: (lyrics) {
        if (lyrics.lines.isEmpty) {
          return const Center(child: Text('No lyrics available'));
        }

        final position = ref.watch(audioPlayerProvider).position;
        final currentLineIndex = _findCurrentLine(lyrics.lines, position);

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: lyrics.lines.length,
          itemBuilder: (context, index) {
            final line = lyrics.lines[index];
            final isCurrent = index == currentLineIndex;
            
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                line.text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isCurrent ? Theme.of(context).colorScheme.primary : null,
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Failed to load lyrics')),
    );
  }

  Widget _buildEqualizerTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Equalizer', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildEqualizerBand('60Hz', 0.0),
                _buildEqualizerBand('230Hz', 0.0),
                _buildEqualizerBand('910Hz', 0.0),
                _buildEqualizerBand('3.6kHz', 0.0),
                _buildEqualizerBand('14kHz', 0.0),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.restore),
                label: const Text('Reset'),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: const Icon(Icons.preset),
                label: const Text('Presets'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEqualizerBand(String label, double value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Slider(
          value: value,
          min: -12.0,
          max: 12.0,
          divisions: 24,
          direction: Axis.vertical,
          onChanged: (v) {},
        ),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  int _findCurrentLine(List<LyricsLine> lines, Duration position) {
    for (int i = lines.length - 1; i >= 0; i--) {
      if (lines[i].time <= position) return i;
    }
    return -1;
  }

  void _toggleShuffle(QueueState state) {
    final modes = [PlaybackMode.sequential, PlaybackMode.shuffle];
    final currentIndex = modes.indexOf(state.mode);
    final nextMode = modes[(currentIndex + 1) % modes.length];
    ref.read(queueControllerProvider).setPlaybackMode(nextMode);
  }

  void _cycleRepeatMode(QueueState state) {
    final modes = [PlaybackMode.sequential, PlaybackMode.repeatAll, PlaybackMode.repeatOne];
    final currentIndex = modes.indexOf(state.mode);
    final nextMode = modes[(currentIndex + 1) % modes.length];
    ref.read(queueControllerProvider).setPlaybackMode(nextMode);
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.add_to_queue),
            title: const Text('Add to queue'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add),
            title: const Text('Add to playlist'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Download'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Sleep timer'),
            onTap: _showSleepTimer,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('View song info'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showSleepTimer() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sleep Timer', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('15 minutes'),
              onTap: () => _setSleepTimer(15),
            ),
            ListTile(
              title: const Text('30 minutes'),
              onTap: () => _setSleepTimer(30),
            ),
            ListTile(
              title: const Text('45 minutes'),
              onTap: () => _setSleepTimer(45),
            ),
            ListTile(
              title: const Text('60 minutes'),
              onTap: () => _setSleepTimer(60),
            ),
            ListTile(
              title: const Text('End of track'),
              onTap: () => _setSleepTimer(-1),
            ),
          ],
        ),
      ),
    );
  }

  void _setSleepTimer(int minutes) {
    // Implement sleep timer
    Navigator.pop(context);
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}