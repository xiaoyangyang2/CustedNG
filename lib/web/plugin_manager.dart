import 'package:custed2/web/plugin.dart';
import 'package:custed2/web/plugin_set.dart';
import 'package:custed2/web/plugins/login_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PluginManager {
  final plugins = <WebPlugin>[
    LoginPlugin(),
  ];

  PluginSet getPulgins(Uri uri) {
    final activePlugins = <WebPlugin>[];

    for (var plugin in plugins) {
      if (plugin.shouldActivate(uri)) {
        activePlugins.add(plugin);
      }
    }

    final pluginSet = PluginSet(plugins: activePlugins);

    for (var plugin in activePlugins) {
      plugin.setDispatcher(pluginSet);
    }

    return pluginSet;
  }

  Set<JavascriptChannel> getChannels() {
    final channels = <JavascriptChannel>{};

    var channelIndex = 0;
    for (var plugin in plugins) {
      channelIndex++;
      plugin.channel = '__custed_channel_$channelIndex';

      channels.add(
        JavascriptChannel(
          name: plugin.channel,
          onMessageReceived: (msg) => plugin.onMessage(msg.message),
        ),
      );
    }

    return channels;
  }
}
