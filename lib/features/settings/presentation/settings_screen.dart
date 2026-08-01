library ytmusic_client.features.settings.presentation.settings_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/domain/session_manager.dart';
import '../../../core/presentation/providers.dart';
import '../../../core/presentation/theme.dart';
import '../../../core/services/ota_service.dart';

final _logger = Logger('SettingsScreen');

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final authMode = ref.watch(authModeProvider);
    final sessionManager = ref.watch(sessionManagerProvider);
    final userProfile = sessionManager.userProfile;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Account section
          if (authMode == AuthMode.authenticated) ...[
            _buildAccountSection(userProfile!),
            const Divider(),
          ] else ...[
            _buildSignInSection(),
            const Divider(),
          ],

          // Playback section
          _buildSectionHeader('Playback'),
          SwitchListTile(
            title: const Text('Gapless playback'),
            subtitle: const Text('Seamless transitions between tracks'),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: const Text('Crossfade'),
            subtitle: const Text('Fade between tracks'),
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            title: const Text('Crossfade duration'),
            subtitle: const Text('5 seconds'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            title: const Text('Normalize volume'),
            subtitle: const Text('Adjust playback volume to a consistent level'),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: const Text('Background playback'),
            subtitle: const Text('Continue playing when app is backgrounded'),
            value: true,
            onChanged: (value) {},
          ),
          const Divider(),

          // Audio quality section
          _buildSectionHeader('Audio Quality'),
          ListTile(
            title: const Text('Streaming quality'),
            subtitle: const Text('High (256 kbps Opus)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showQualityDialog(),
          ),
          ListTile(
            title: const Text('Download quality'),
            subtitle: const Text('High (256 kbps Opus)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showQualityDialog(true),
          ),
          SwitchListTile(
            title: const Text('Download over Wi-Fi only'),
            subtitle: const Text('Avoid mobile data usage for downloads'),
            value: true,
            onChanged: (value) {},
          ),
          const Divider(),

          // Equalizer section
          _buildSectionHeader('Sound'),
          ListTile(
            title: const Text('Equalizer'),
            subtitle: const Text('Adjust frequency bands'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showEqualizerDialog(),
          ),
          ListTile(
            title: const Text('Bass boost'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Virtualizer'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),

          // Appearance section
          _buildSectionHeader('Appearance'),
          Consumer(
            builder: (context, ref, _) {
              final theme = ref.watch(themeProvider);
              return ListTile(
                title: const Text('Theme'),
                subtitle: Text(theme.seedColor == const Color(0xFFDB4437) ? 'System (YouTube Red)' : 'Custom'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showThemeDialog(),
              );
            },
          ),
          SwitchListTile(
            title: const Text('Dynamic theme from artwork'),
            subtitle: const Text('Extract colors from album art'),
            value: true,
            onChanged: (value) {},
          ),
          const Divider(),

          // Privacy section
          _buildSectionHeader('Privacy & Data'),
          SwitchListTile(
            title: const Text('Anonymous mode'),
            subtitle: const Text('No account sync, local-only data'),
            value: authMode == AuthMode.anonymous,
            onChanged: (value) async {
              if (value) {
                await ref.read(authModeProvider.notifier).setAnonymous();
              }
            },
          ),
          ListTile(
            title: const Text('Clear cache'),
            subtitle: const Text('Remove cached images and data'),
            trailing: const Icon(Icons.chevron_right),
            onTap: _clearCache,
          ),
          ListTile(
            title: const Text('Clear history'),
            subtitle: const Text('Remove listening and search history'),
            trailing: const Icon(Icons.chevron_right),
            onTap: _clearHistory,
          ),
          ListTile(
            title: const Text('Export data'),
            subtitle: const Text('Download your data'),
            trailing: const Icon(Icons.chevron_right),
            onTap: _exportData,
          ),
          const Divider(),

          // Advanced section
          _buildSectionHeader('Advanced'),
          Consumer(
            builder: (context, ref, _) {
              final otaStatus = ref.watch(otaStatusProvider);
              return Column(
                children: [
                  ListTile(
                    title: const Text('SponsorBlock'),
                    subtitle: const Text('Skip non-music segments'),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    title: const Text('Lyrics source'),
                    subtitle: const Text('YouTube Music + LRCLIB'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Custom API endpoints'),
                    subtitle: const Text('Configure InnerTube endpoints'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Debug logging'),
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const Divider(),
                  _buildOtaSection(otaStatus),
                ],
              );
            },
          ),
          const Divider(),

          // About section
          _buildSectionHeader('About'),
          ListTile(
            title: const Text('Version'),
            subtitle: const Text('1.0.0'),
          ),
          ListTile(
            title: const Text('Open source licenses'),
            onTap: () => _showLicenses(),
          ),
          ListTile(
            title: const Text('Source code'),
            subtitle: const Text('github.com/ytmusic-client'),
            onTap: () => _launchUrl('https://github.com'),
          ),
          ListTile(
            title: const Text('Report issue'),
            onTap: () => _launchUrl('https://github.com/issues'),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection(UserProfile profile) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(profile.avatarUrl),
            radius: 24,
          ),
          title: Text(profile.name, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(profile.email ?? ''),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Switch account'),
          leading: const Icon(Icons.swap_horiz),
          onTap: () => _showAccountSwitcher(),
        ),
        ListTile(
          title: const Text('Sign out'),
          leading: const Icon(Icons.logout),
          textColor: Theme.of(context).colorScheme.error,
          iconColor: Theme.of(context).colorScheme.error,
          onTap: () => _signOut(),
        ),
      ],
    );
  }

  Widget _buildSignInSection() {
    return ListTile(
      title: const Text('Sign in to YouTube Music'),
      subtitle: const Text('Sync library, playlists, and history'),
      leading: const Icon(Icons.person_add),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _showSignInDialog(),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _showQualityDialog([bool isDownload = false]) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isDownload ? 'Download Quality' : 'Streaming Quality'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('Low (48 kbps AAC)'),
              value: 'low',
              groupValue: 'high',
              onChanged: (value) {},
            ),
            RadioListTile<String>(
              title: const Text('Normal (128 kbps AAC)'),
              value: 'normal',
              groupValue: 'high',
              onChanged: (value) {},
            ),
            RadioListTile<String>(
              title: const Text('High (256 kbps Opus)'),
              value: 'high',
              groupValue: 'high',
              onChanged: (value) {},
            ),
            RadioListTile<String>(
              title: const Text('Always highest'),
              value: 'always_high',
              groupValue: 'high',
              onChanged: (value) {},
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ],
      ),
    );
  }

  void _showEqualizerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Equalizer'),
        content: SizedBox(
          width: 300,
          height: 200,
          child: Column(
            children: [
              Text('Equalizer settings would go here'),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Reset')),
                  FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Done')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('System default (YouTube Red)'),
              onTap: () {
                ref.read(themeProvider.notifier).resetToDefault();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Custom color'),
              onTap: () => _showColorPicker(),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPicker() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SizedBox(
          width: 300,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              Colors.red,
              Colors.pink,
              Colors.purple,
              Colors.deepPurple,
              Colors.indigo,
              Colors.blue,
              Colors.lightBlue,
              Colors.cyan,
              Colors.teal,
              Colors.green,
              Colors.lightGreen,
              Colors.lime,
              Colors.yellow,
              Colors.amber,
              Colors.orange,
              Colors.deepOrange,
            ].map((color) => GestureDetector(
              onTap: () {
                ref.read(themeProvider.notifier).updateSeedColor(color);
                Navigator.pop(context);
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }

  void _showAccountSwitcher() {
    // Show account switcher dialog
  }

  void _signOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign out?'),
        content: const Text('You will be signed out and local data will be kept.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              ref.read(authModeProvider.notifier).setAnonymous();
              Navigator.pop(context);
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }

  void _showSignInDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign in to YouTube Music'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('To sign in, you need to provide your YouTube cookies. This can be done by:'),
            const SizedBox(height: 16),
            const Text('1. Open YouTube Music in your browser'),
            const Text('2. Open developer tools (F12)'),
            const Text('3. Go to Application > Cookies > music.youtube.com'),
            const Text('4. Copy the cookie values'),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Paste cookies here',
                hintText: 'SID=...; HSID=...; SSID=...',
              ),
              maxLines: 3,
              onSubmitted: (value) => _handleSignIn(value),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ],
      ),
    );
  }

  void _handleSignIn(String cookies) {
    // Parse cookies and authenticate
    Navigator.pop(context);
  }

  void _clearCache() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear cache?'),
        content: const Text('This will remove all cached images and temporary data.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(onPressed: () {
            // Clear cache
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cache cleared')));
          }, child: const Text('Clear')),
        ],
      ),
    );
  }

  void _clearHistory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear history?'),
        content: const Text('This will remove all listening and search history.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(onPressed: () {
            // Clear history
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('History cleared')));
          }, child: const Text('Clear')),
        ],
      ),
    );
  }

  void _exportData() {
    // Export user data
  }

  void _showLicenses() {
    showLicensePage(context: context, applicationName: 'YTMusic', applicationVersion: '1.0.0');
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildOtaSection(AsyncValue<OtaStatus> otaStatus) {
    return Column(
      children: [
        ListTile(
          title: const Text('App Updates'),
          subtitle: const Text('Check for new versions from GitHub'),
          leading: const Icon(Icons.system_update),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => _showOtaDialog(context),
        ),
        otaStatus.when(
          data: (status) => _buildOtaStatusTile(status),
          loading: () => const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, __) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildOtaStatusTile(OtaStatus status) {
    return switch (status) {
      OtaUpdateAvailable(info: final info) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ExpansionTile(
            title: Text('Update Available: v${info.versionName}'),
            subtitle: Text(info.isPreRelease ? 'Pre-release (Debug)' : 'Stable Release'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (info.changelog.isNotEmpty) ...[
                      Text('Changelog:', style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 8),
                      Text(info.changelog),
                      const SizedBox(height: 16),
                    ],
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Later'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton(
                            onPressed: () => _installUpdate(info),
                            child: const Text('Install Now'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      OtaDownloading(progress: final progress) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Downloading Update...', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                LinearProgressIndicator(value: progress),
                const SizedBox(height: 8),
                Text('${(progress * 100).toStringAsFixed(1)}%'),
              ],
            ),
          ),
        ),
      OtaInstalling() => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text('Installing...'),
              ],
            ),
          ),
        ),
      OtaUpToDate() => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('App is up to date'),
            subtitle: Text('No updates available'),
          ),
        ),
      OtaError(message: final msg) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(Icons.error, color: Theme.of(context).colorScheme.error),
            title: const Text('Update check failed'),
            subtitle: Text(msg),
            trailing: TextButton(
              onPressed: () => OtaService.checkForUpdates(),
              child: const Text('Retry'),
            ),
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }

  void _showOtaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Check for Updates'),
        content: Consumer(
          builder: (context, ref, _) {
            final otaStatus = ref.watch(otaStatusProvider);
            return otaStatus.when(
              data: (status) => switch (status) {
                OtaChecking() => const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Checking for updates...'),
                    ],
                  ),
                OtaUpdateAvailable(info: final info) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Version ${info.versionName} available'),
                      const SizedBox(height: 8),
                      Text(info.isPreRelease ? 'Debug/Pre-release build' : 'Stable release'),
                      if (info.changelog.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Text('Changes:', style: Theme.of(context).textTheme.titleSmall),
                        Text(info.changelog),
                      ],
                    ],
                  ),
                OtaUpToDate() => const Text('You are on the latest version!'),
                OtaError(message: final msg) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 48),
                      const SizedBox(height: 16),
                      Text('Failed to check: $msg'),
                    ],
                  ),
                _ => const Text('Tap to check for updates'),
              };
            },
          loading: () => const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Checking...'),
            ],
          ),
          error: (_, __) => const Text('Error loading update status'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              OtaService.checkForUpdates();
            },
            child: const Text('Check Now'),
          ),
        ],
      ),
    );
  }

  Future<void> _installUpdate(OtaReleaseInfo info) async {
    final canInstall = await OtaService.canInstallPackages();
    if (!canInstall) {
      final shouldOpenSettings = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text('To install updates, the app needs permission to install packages. Open settings to enable this?'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Open Settings')),
          ],
        ),
      );
      if (shouldOpenSettings == true) {
        await OtaService.openInstallSettings();
      }
      return;
    }

    final success = await OtaService.downloadAndInstall(info);
    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update installation failed')),
      );
    }
  }
}