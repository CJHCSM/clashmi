///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsBackupAndSyncWebdavScreenEn BackupAndSyncWebdavScreen = TranslationsBackupAndSyncWebdavScreenEn._(_root);
	late final TranslationsLaunchFailedScreenEn LaunchFailedScreen = TranslationsLaunchFailedScreenEn._(_root);
	late final TranslationsPerAppAndroidScreenEn PerAppAndroidScreen = TranslationsPerAppAndroidScreenEn._(_root);
	late final TranslationsUserAgreementScreenEn UserAgreementScreen = TranslationsUserAgreementScreenEn._(_root);
	late final TranslationsVersionUpdateScreenEn VersionUpdateScreen = TranslationsVersionUpdateScreenEn._(_root);
	late final TranslationsMainEn main = TranslationsMainEn._(_root);
	late final TranslationsMetaEn meta = TranslationsMetaEn._(_root);
	late final TranslationsPermissionEn permission = TranslationsPermissionEn._(_root);
	late final TranslationsTlsEn tls = TranslationsTlsEn._(_root);
	late final TranslationsTunEn tun = TranslationsTunEn._(_root);
	late final TranslationsDnsEn dns = TranslationsDnsEn._(_root);
	late final TranslationsSnifferEn sniffer = TranslationsSnifferEn._(_root);
	late final TranslationsProfilePatchModeEn profilePatchMode = TranslationsProfilePatchModeEn._(_root);
	String get protocolSniff => 'Protocol Sniff';
	String get protocolSniffOverrideDestination => 'The Sniff domain name override the connection target address';
	String get edgeRuntimeNotInstalled => 'The current device has not installed the Edge WebView2 runtime, so the page cannot be displayed. Please download and install the Edge WebView2 runtime (x64), restart the App and try again.';
	Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: BackupAndSyncWebdavScreen
class TranslationsBackupAndSyncWebdavScreenEn {
	TranslationsBackupAndSyncWebdavScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get webdavServerUrl => 'Server Url';
	String get webdavRequired => 'Can not be empty';
	String get webdavLoginFailed => 'Login failed:';
	String get webdavListFailed => 'Failed to get file list:';
}

// Path: LaunchFailedScreen
class TranslationsLaunchFailedScreenEn {
	TranslationsLaunchFailedScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get invalidProcess => 'The app failed to start [Invalid process name], please reinstall the app to a separate directory';
	String get invalidProfile => 'The app failed to start [Failed to access the profile], please reinstall the app';
	String get invalidVersion => 'The app failed to start [Invalid version], please reinstall the app';
	String get systemVersionLow => 'The app failed to start [system version too low]';
	String get invalidInstallPath => 'The installation path is invalid, please reinstall it to a valid path';
}

// Path: PerAppAndroidScreen
class TranslationsPerAppAndroidScreenEn {
	TranslationsPerAppAndroidScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Per-App Proxy';
	String get whiteListMode => 'Whitelist Mode';
	String get whiteListModeTip => 'When enabled: only the apps that have been checked are proxies; when not enabled: only the apps that are not checked are proxies';
}

// Path: UserAgreementScreen
class TranslationsUserAgreementScreenEn {
	TranslationsUserAgreementScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get privacyFirst => 'Your Privacy Comes First';
	String get agreeAndContinue => 'Accept & Continue';
}

// Path: VersionUpdateScreen
class TranslationsVersionUpdateScreenEn {
	TranslationsVersionUpdateScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String versionReady({required Object p}) => 'The new version[${p}] is ready';
	String get update => 'Restart To Update';
	String get cancel => 'Not Now';
}

// Path: main
class TranslationsMainEn {
	TranslationsMainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMainTrayEn tray = TranslationsMainTrayEn._(_root);
}

// Path: meta
class TranslationsMetaEn {
	TranslationsMetaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get enable => 'Enable';
	String get disable => 'Disable';
	String get open => 'Open';
	String get close => 'Close';
	String get quit => 'Quit';
	String get add => 'Add';
	String get addSuccess => 'Added successfully';
	String addFailed({required Object p}) => 'Add failed:${p}';
	String get remove => 'Remove';
	String get removeConfirm => 'Are you sure to delete?';
	String get edit => 'Edit';
	String get view => 'View';
	String get remark => 'Remark';
	String get byDefault => 'Default';
	String get editRemark => 'Edit Remark';
	String get more => 'More';
	String get tips => 'Info';
	String get copy => 'Copy';
	String get save => 'Save';
	String get ok => 'Ok';
	String get cancel => 'Cancel';
	String get faq => 'FAQ';
	String get download => 'Download';
	String get loading => 'Loading...';
	String get days => 'Days';
	String get hours => 'Hours';
	String get minutes => 'Minutes';
	String get seconds => 'Seconds';
	String get protocol => 'Protocol';
	String get search => 'Search';
	String get custom => 'Custom';
	String get connect => 'Connect';
	String get disconnect => 'Disconnect';
	String get connected => 'Connected';
	String get disconnected => 'Disconnected';
	String get connecting => 'Connecting';
	String get connectTimeout => 'Connect Timeout';
	String get timeout => 'Timeout';
	String get timeoutDuration => 'Timeout Duration';
	String get latency => 'Latency';
	String get latencyTest => 'Latency Checks';
	String get language => 'Language';
	String get next => 'Next';
	String get done => 'Done';
	String get apply => 'Apply';
	String get refresh => 'Refresh';
	String get retry => 'Retry?';
	String get update => 'Update';
	String get updateInterval => 'Update interval';
	String updateFailed({required Object p}) => 'Update failed:${p}';
	String get updateInterval5mTips => 'Minimum: 5m';
	String get none => 'None';
	String get reset => 'Reset';
	String get authentication => 'Authentication';
	String get submit => 'Submit';
	String get user => 'User';
	String get account => 'Account';
	String get password => 'Password';
	String get required => 'Required';
	String get other => 'Other';
	String get dns => 'DNS';
	String get url => 'URL';
	String get urlInvalid => 'Invalid URL';
	String get urlCannotEmpty => 'Link can not be empty';
	String get urlTooLong => 'URL is too long (>8182)';
	String get copyUrl => 'Copy Link';
	String get openUrl => 'Open Link';
	String get shareUrl => 'Share Link';
	String get coreSettingTips => 'Note: After modifying the configuration, you need to reconnect to take effect';
	String get overwrite => 'Overwrite';
	String get overwriteCustom => 'Custom Overwrite';
	String get overwriteTips => 'Original Profile <- Custom Overwrite <- App Overwrite';
	String get noOverwrite => 'Do not overwrite';
	String get overwriteSettings => 'Overwrite Settings';
	String get externalController => 'External Controller';
	String get secret => 'Secret';
	String get tcpConcurrent => 'TCP Concurrent Handshake';
	String get globalClientFingerprint => 'TLS Global Fingerprint';
	String get allowLanAccess => 'LAN device access';
	String get mixedPort => 'Mixed Proxy Port';
	String get logLevel => 'Log Level';
	String get tcpkeepAliveInterval => 'TCP Keep-alive Interval';
	String get delayTestUrl => 'Delay Test URL';
	String get delayTestTimeout => 'Delay Test Timeout(ms)';
	String get tun => 'TUN';
	String get ntp => 'NTP';
	String get tls => 'TLS';
	String get geo => 'GEO';
	String get geoDownloadByProxy => 'Downloading Geo RuleSet by proxy';
	String get geoRulesetTips => 'Geosite/Geoip/Asn will be converted into the corresponding RuleSet';
	String get sniffer => 'Sniffer';
	String get userAgent => 'UserAgent';
	String get launchAtStartup => 'Launch at Startup';
	String get launchAtStartupRunAsAdmin => 'Please restart Clash Mi as administrator';
	String get portableMode => 'Portable Mode';
	String get portableModeDisableTips => 'If you need to exit portable mode, please exit [clashmi] and manually delete the [portable] folder in the same directory as [clashmi.exe]';
	String get systemProxy => 'System Proxy';
	String get autoConnectAfterLaunch => 'Auto Connection after Launch';
	String get hideAfterLaunch => 'Hide window after startup';
	String get autoSetSystemProxy => 'Auto Set System Proxy when Connected';
	String get bypassSystemProxy => 'Domain names that are allowed to bypass the system proxy';
	String get website => 'Website';
	String get rule => 'Rule';
	String get global => 'Global';
	String get direct => 'Direct';
	String get block => 'Block';
	String get qrcode => 'QR Code';
	String get qrcodeTooLong => 'The text is too long to display';
	String get qrcodeShare => 'Share QR Code';
	String get textToQrcode => 'Text To QR Code';
	String get qrcodeScan => 'Scan QR Code';
	String get qrcodeScanResult => 'Scan Result';
	String get qrcodeScanFromImage => 'Scan From Image';
	String get qrcodeScanResultFailed => 'Failed to parse the image, please make sure the screenshot is a valid QR code';
	String get qrcodeScanResultEmpty => 'Scan Result is empty';
	String get screenshot => 'Screenshot';
	String get backupAndSync => 'Backup and Sync';
	String get importSuccess => 'Import Success';
	String get rewriteConfirm => 'This file will overwrite the existing local configuration. Do you want to continue?';
	String get importAndExport => 'Import and Export';
	String get import => 'Import';
	String get importFromUrl => 'Import from URL';
	String get export => 'Export';
	String get send => 'Send';
	String get receive => 'Receive';
	String get sendConfirm => 'Confirm to send?';
	String get termOfUse => 'Terms of Service';
	String get privacyPolicy => 'Privacy & Policy';
	String get log => 'Log';
	String get coreLog => 'Core Log';
	String get core => 'Core';
	String get help => 'Help';
	String get tutorial => 'Tutorial';
	String get board => 'Board';
	String get boardOnline => 'Use Online Board';
	String get boardOnlineUrl => 'Online Board URL';
	String get boardLocalPort => 'Local Board Port';
	String get disableFontScaler => 'Disable Font scaling(Restart takes effect)';
	String get autoOrientation => 'Rotate with the screen';
	String get restartTakesEffect => 'Restart takes effect';
	String get runtimeProfile => 'Runtime Profile';
	String get willCompleteAfterRebootInstall => 'Please restart your device to complete the system extension installation';
	String get willCompleteAfterRebootUninstall => 'Please restart your device to complete the the system extension uninstallation';
	String get requestNeedsUserApproval => 'Please [Allow] Clash Mi to install system extensions in [System Settings]-[Privacy and Security], and reconnect after installation is complete.';
	String get FullDiskAccessPermissionRequired => 'Please enable clashmiServiceSE permission in [System Settings]-[Privacy and Security]-[Full Disk Access] and reconnect.';
	String get proxy => 'Proxy';
	String get theme => 'Theme';
	String get tvMode => 'TV Mode';
	String get autoUpdate => 'Auto Update';
	String get updateChannel => 'Auto Update Channel';
	String hasNewVersion({required Object p}) => 'Update Version ${p}';
	String get devOptions => 'Developer Options';
	String get about => 'About';
	String get name => 'Name';
	String get version => 'Version';
	String get notice => 'Notice';
	String get sort => 'Reorder';
	String get recommended => 'Recommend';
	String innerError({required Object p}) => 'Inner Error:${p}';
	String get share => 'Share';
	String get importFromClipboard => 'Import From Clipboard';
	String get exportToClipboard => 'Export to Clipboard';
	String get server => 'Server';
	String get port => 'Port';
	String get donate => 'Donate';
	String get setting => 'Settings';
	String get settingCore => 'Core Settings';
	String get settingApp => 'App Settings';
	String get coreOverwrite => 'Core Overwrite';
	String get iCloud => 'iCloud';
	String get webdav => 'Webdav';
	String get lanSync => 'LAN Sync';
	String get lanSyncNotQuitTips => 'Do not exit this interface before synchronization is completed';
	String get deviceNoSpace => 'Not enough disk space';
	String get hideSystemApp => 'Hide System Apps';
	String get hideAppIcon => 'Hide App Icons';
	String get openDir => 'Open File Directory';
	String get fileChoose => 'Select File';
	String get filePathCannotEmpty => 'The file path can not be empty';
	String fileNotExist({required Object p}) => 'File does not exist:${p}';
	String fileTypeInvalid({required Object p}) => 'Invalid file type:${p}';
	String get uwpExemption => 'UWP Network Isolation Exemptions';
	String get getProfile => 'Get Profile';
	String get addProfile => 'Add Profile';
	String get myProfiles => 'My Profiles';
	String get profileEdit => 'Profile Edit';
	String get profileEditReloadAfterProfileUpdate => 'Reload after Profile update';
	String get profileImport => 'Import Profile File';
	String get profileAddUrlOrContent => 'Add Profile Link';
	String get profileUrlOrContent => 'Profile Link/Content';
	String get profileUrlOrContentHit => 'Profile Link/Content [Required] (Support Clash,V2ray(batch supported),Stash,Karing,Sing-box,Shadowsocks,Sub Profile links)';
	String get profileUrlOrContentCannotEmpty => 'Profile Link can not be empty';
}

// Path: permission
class TranslationsPermissionEn {
	TranslationsPermissionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get camera => 'Camera';
	String get screen => 'Screen Recording';
	String get appQuery => 'Get Application List';
	String request({required Object p}) => 'Turn on [${p}] permission';
	String requestNeed({required Object p}) => 'Please Turn on [${p}] permission';
}

// Path: tls
class TranslationsTlsEn {
	TranslationsTlsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get insecure => 'Skip Certificate Verification';
	String get certificate => 'Certificate';
	String get privateKey => 'Private Key';
	String get customTrustCert => 'Custom Certifactes';
}

// Path: tun
class TranslationsTunEn {
	TranslationsTunEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get stack => 'Network stack';
	String get dnsHijack => 'DNS Hijack';
	String get strictRoute => 'Strict Route';
	String get allowBypass => 'Allow Apps to Bypass VPN';
	String get appendHttpProxy => 'Append HTTP Proxy to VPN';
	String get bypassHttpProxyDomain => 'Domains allowed to bypass HTTP proxy';
}

// Path: dns
class TranslationsDnsEn {
	TranslationsDnsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fakeIp => 'fake-ip';
	String get fallback => 'Fallback';
	String get preferH3 => 'Prefer DoH H3';
	String get useHosts => 'Use Hosts';
	String get useSystemHosts => 'Use System Hosts';
	String get enhancedMode => 'Enhanced Mode';
	String get fakeIPFilterMode => '${_root.dns.fakeIp} Filter Mode';
	String get fakeIPFilter => 'fake-ip Filter';
	String get nameServer => 'NameServer';
	String get defaultNameServer => '${_root.meta.byDefault} ${_root.dns.nameServer}';
	String get proxyNameServer => '${_root.meta.proxy} ${_root.dns.nameServer}';
	String get directNameServer => '${_root.meta.direct} ${_root.dns.nameServer}';
	String get fallbackNameServer => '${_root.dns.fallback} ${_root.dns.nameServer}';
	String get fallbackGeoIp => '${_root.dns.fallback} GeoIp';
	String get fallbackGeoIpCode => '${_root.dns.fallback} GeoIpCode';
}

// Path: sniffer
class TranslationsSnifferEn {
	TranslationsSnifferEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get overrideDest => 'Override';
}

// Path: profilePatchMode
class TranslationsProfilePatchModeEn {
	TranslationsProfilePatchModeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get currentSelected => 'Current Selected';
	String get overwrite => 'Built-in Overwrite';
	String get noOverwrite => 'Built-in - no Overwrite';
}

// Path: main.tray
class TranslationsMainTrayEn {
	TranslationsMainTrayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get menuOpen => '    Open    ';
	String get menuExit => '    Exit    ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'BackupAndSyncWebdavScreen.webdavServerUrl': return 'Server Url';
			case 'BackupAndSyncWebdavScreen.webdavRequired': return 'Can not be empty';
			case 'BackupAndSyncWebdavScreen.webdavLoginFailed': return 'Login failed:';
			case 'BackupAndSyncWebdavScreen.webdavListFailed': return 'Failed to get file list:';
			case 'LaunchFailedScreen.invalidProcess': return 'The app failed to start [Invalid process name], please reinstall the app to a separate directory';
			case 'LaunchFailedScreen.invalidProfile': return 'The app failed to start [Failed to access the profile], please reinstall the app';
			case 'LaunchFailedScreen.invalidVersion': return 'The app failed to start [Invalid version], please reinstall the app';
			case 'LaunchFailedScreen.systemVersionLow': return 'The app failed to start [system version too low]';
			case 'LaunchFailedScreen.invalidInstallPath': return 'The installation path is invalid, please reinstall it to a valid path';
			case 'PerAppAndroidScreen.title': return 'Per-App Proxy';
			case 'PerAppAndroidScreen.whiteListMode': return 'Whitelist Mode';
			case 'PerAppAndroidScreen.whiteListModeTip': return 'When enabled: only the apps that have been checked are proxies; when not enabled: only the apps that are not checked are proxies';
			case 'UserAgreementScreen.privacyFirst': return 'Your Privacy Comes First';
			case 'UserAgreementScreen.agreeAndContinue': return 'Accept & Continue';
			case 'VersionUpdateScreen.versionReady': return ({required Object p}) => 'The new version[${p}] is ready';
			case 'VersionUpdateScreen.update': return 'Restart To Update';
			case 'VersionUpdateScreen.cancel': return 'Not Now';
			case 'main.tray.menuOpen': return '    Open    ';
			case 'main.tray.menuExit': return '    Exit    ';
			case 'meta.enable': return 'Enable';
			case 'meta.disable': return 'Disable';
			case 'meta.open': return 'Open';
			case 'meta.close': return 'Close';
			case 'meta.quit': return 'Quit';
			case 'meta.add': return 'Add';
			case 'meta.addSuccess': return 'Added successfully';
			case 'meta.addFailed': return ({required Object p}) => 'Add failed:${p}';
			case 'meta.remove': return 'Remove';
			case 'meta.removeConfirm': return 'Are you sure to delete?';
			case 'meta.edit': return 'Edit';
			case 'meta.view': return 'View';
			case 'meta.remark': return 'Remark';
			case 'meta.byDefault': return 'Default';
			case 'meta.editRemark': return 'Edit Remark';
			case 'meta.more': return 'More';
			case 'meta.tips': return 'Info';
			case 'meta.copy': return 'Copy';
			case 'meta.save': return 'Save';
			case 'meta.ok': return 'Ok';
			case 'meta.cancel': return 'Cancel';
			case 'meta.faq': return 'FAQ';
			case 'meta.download': return 'Download';
			case 'meta.loading': return 'Loading...';
			case 'meta.days': return 'Days';
			case 'meta.hours': return 'Hours';
			case 'meta.minutes': return 'Minutes';
			case 'meta.seconds': return 'Seconds';
			case 'meta.protocol': return 'Protocol';
			case 'meta.search': return 'Search';
			case 'meta.custom': return 'Custom';
			case 'meta.connect': return 'Connect';
			case 'meta.disconnect': return 'Disconnect';
			case 'meta.connected': return 'Connected';
			case 'meta.disconnected': return 'Disconnected';
			case 'meta.connecting': return 'Connecting';
			case 'meta.connectTimeout': return 'Connect Timeout';
			case 'meta.timeout': return 'Timeout';
			case 'meta.timeoutDuration': return 'Timeout Duration';
			case 'meta.latency': return 'Latency';
			case 'meta.latencyTest': return 'Latency Checks';
			case 'meta.language': return 'Language';
			case 'meta.next': return 'Next';
			case 'meta.done': return 'Done';
			case 'meta.apply': return 'Apply';
			case 'meta.refresh': return 'Refresh';
			case 'meta.retry': return 'Retry?';
			case 'meta.update': return 'Update';
			case 'meta.updateInterval': return 'Update interval';
			case 'meta.updateFailed': return ({required Object p}) => 'Update failed:${p}';
			case 'meta.updateInterval5mTips': return 'Minimum: 5m';
			case 'meta.none': return 'None';
			case 'meta.reset': return 'Reset';
			case 'meta.authentication': return 'Authentication';
			case 'meta.submit': return 'Submit';
			case 'meta.user': return 'User';
			case 'meta.account': return 'Account';
			case 'meta.password': return 'Password';
			case 'meta.required': return 'Required';
			case 'meta.other': return 'Other';
			case 'meta.dns': return 'DNS';
			case 'meta.url': return 'URL';
			case 'meta.urlInvalid': return 'Invalid URL';
			case 'meta.urlCannotEmpty': return 'Link can not be empty';
			case 'meta.urlTooLong': return 'URL is too long (>8182)';
			case 'meta.copyUrl': return 'Copy Link';
			case 'meta.openUrl': return 'Open Link';
			case 'meta.shareUrl': return 'Share Link';
			case 'meta.coreSettingTips': return 'Note: After modifying the configuration, you need to reconnect to take effect';
			case 'meta.overwrite': return 'Overwrite';
			case 'meta.overwriteCustom': return 'Custom Overwrite';
			case 'meta.overwriteTips': return 'Original Profile <- Custom Overwrite <- App Overwrite';
			case 'meta.noOverwrite': return 'Do not overwrite';
			case 'meta.overwriteSettings': return 'Overwrite Settings';
			case 'meta.externalController': return 'External Controller';
			case 'meta.secret': return 'Secret';
			case 'meta.tcpConcurrent': return 'TCP Concurrent Handshake';
			case 'meta.globalClientFingerprint': return 'TLS Global Fingerprint';
			case 'meta.allowLanAccess': return 'LAN device access';
			case 'meta.mixedPort': return 'Mixed Proxy Port';
			case 'meta.logLevel': return 'Log Level';
			case 'meta.tcpkeepAliveInterval': return 'TCP Keep-alive Interval';
			case 'meta.delayTestUrl': return 'Delay Test URL';
			case 'meta.delayTestTimeout': return 'Delay Test Timeout(ms)';
			case 'meta.tun': return 'TUN';
			case 'meta.ntp': return 'NTP';
			case 'meta.tls': return 'TLS';
			case 'meta.geo': return 'GEO';
			case 'meta.geoDownloadByProxy': return 'Downloading Geo RuleSet by proxy';
			case 'meta.geoRulesetTips': return 'Geosite/Geoip/Asn will be converted into the corresponding RuleSet';
			case 'meta.sniffer': return 'Sniffer';
			case 'meta.userAgent': return 'UserAgent';
			case 'meta.launchAtStartup': return 'Launch at Startup';
			case 'meta.launchAtStartupRunAsAdmin': return 'Please restart Clash Mi as administrator';
			case 'meta.portableMode': return 'Portable Mode';
			case 'meta.portableModeDisableTips': return 'If you need to exit portable mode, please exit [clashmi] and manually delete the [portable] folder in the same directory as [clashmi.exe]';
			case 'meta.systemProxy': return 'System Proxy';
			case 'meta.autoConnectAfterLaunch': return 'Auto Connection after Launch';
			case 'meta.hideAfterLaunch': return 'Hide window after startup';
			case 'meta.autoSetSystemProxy': return 'Auto Set System Proxy when Connected';
			case 'meta.bypassSystemProxy': return 'Domain names that are allowed to bypass the system proxy';
			case 'meta.website': return 'Website';
			case 'meta.rule': return 'Rule';
			case 'meta.global': return 'Global';
			case 'meta.direct': return 'Direct';
			case 'meta.block': return 'Block';
			case 'meta.qrcode': return 'QR Code';
			case 'meta.qrcodeTooLong': return 'The text is too long to display';
			case 'meta.qrcodeShare': return 'Share QR Code';
			case 'meta.textToQrcode': return 'Text To QR Code';
			case 'meta.qrcodeScan': return 'Scan QR Code';
			case 'meta.qrcodeScanResult': return 'Scan Result';
			case 'meta.qrcodeScanFromImage': return 'Scan From Image';
			case 'meta.qrcodeScanResultFailed': return 'Failed to parse the image, please make sure the screenshot is a valid QR code';
			case 'meta.qrcodeScanResultEmpty': return 'Scan Result is empty';
			case 'meta.screenshot': return 'Screenshot';
			case 'meta.backupAndSync': return 'Backup and Sync';
			case 'meta.importSuccess': return 'Import Success';
			case 'meta.rewriteConfirm': return 'This file will overwrite the existing local configuration. Do you want to continue?';
			case 'meta.importAndExport': return 'Import and Export';
			case 'meta.import': return 'Import';
			case 'meta.importFromUrl': return 'Import from URL';
			case 'meta.export': return 'Export';
			case 'meta.send': return 'Send';
			case 'meta.receive': return 'Receive';
			case 'meta.sendConfirm': return 'Confirm to send?';
			case 'meta.termOfUse': return 'Terms of Service';
			case 'meta.privacyPolicy': return 'Privacy & Policy';
			case 'meta.log': return 'Log';
			case 'meta.coreLog': return 'Core Log';
			case 'meta.core': return 'Core';
			case 'meta.help': return 'Help';
			case 'meta.tutorial': return 'Tutorial';
			case 'meta.board': return 'Board';
			case 'meta.boardOnline': return 'Use Online Board';
			case 'meta.boardOnlineUrl': return 'Online Board URL';
			case 'meta.boardLocalPort': return 'Local Board Port';
			case 'meta.disableFontScaler': return 'Disable Font scaling(Restart takes effect)';
			case 'meta.autoOrientation': return 'Rotate with the screen';
			case 'meta.restartTakesEffect': return 'Restart takes effect';
			case 'meta.runtimeProfile': return 'Runtime Profile';
			case 'meta.willCompleteAfterRebootInstall': return 'Please restart your device to complete the system extension installation';
			case 'meta.willCompleteAfterRebootUninstall': return 'Please restart your device to complete the the system extension uninstallation';
			case 'meta.requestNeedsUserApproval': return 'Please [Allow] Clash Mi to install system extensions in [System Settings]-[Privacy and Security], and reconnect after installation is complete.';
			case 'meta.FullDiskAccessPermissionRequired': return 'Please enable clashmiServiceSE permission in [System Settings]-[Privacy and Security]-[Full Disk Access] and reconnect.';
			case 'meta.proxy': return 'Proxy';
			case 'meta.theme': return 'Theme';
			case 'meta.tvMode': return 'TV Mode';
			case 'meta.autoUpdate': return 'Auto Update';
			case 'meta.updateChannel': return 'Auto Update Channel';
			case 'meta.hasNewVersion': return ({required Object p}) => 'Update Version ${p}';
			case 'meta.devOptions': return 'Developer Options';
			case 'meta.about': return 'About';
			case 'meta.name': return 'Name';
			case 'meta.version': return 'Version';
			case 'meta.notice': return 'Notice';
			case 'meta.sort': return 'Reorder';
			case 'meta.recommended': return 'Recommend';
			case 'meta.innerError': return ({required Object p}) => 'Inner Error:${p}';
			case 'meta.share': return 'Share';
			case 'meta.importFromClipboard': return 'Import From Clipboard';
			case 'meta.exportToClipboard': return 'Export to Clipboard';
			case 'meta.server': return 'Server';
			case 'meta.port': return 'Port';
			case 'meta.donate': return 'Donate';
			case 'meta.setting': return 'Settings';
			case 'meta.settingCore': return 'Core Settings';
			case 'meta.settingApp': return 'App Settings';
			case 'meta.coreOverwrite': return 'Core Overwrite';
			case 'meta.iCloud': return 'iCloud';
			case 'meta.webdav': return 'Webdav';
			case 'meta.lanSync': return 'LAN Sync';
			case 'meta.lanSyncNotQuitTips': return 'Do not exit this interface before synchronization is completed';
			case 'meta.deviceNoSpace': return 'Not enough disk space';
			case 'meta.hideSystemApp': return 'Hide System Apps';
			case 'meta.hideAppIcon': return 'Hide App Icons';
			case 'meta.openDir': return 'Open File Directory';
			case 'meta.fileChoose': return 'Select File';
			case 'meta.filePathCannotEmpty': return 'The file path can not be empty';
			case 'meta.fileNotExist': return ({required Object p}) => 'File does not exist:${p}';
			case 'meta.fileTypeInvalid': return ({required Object p}) => 'Invalid file type:${p}';
			case 'meta.uwpExemption': return 'UWP Network Isolation Exemptions';
			case 'meta.getProfile': return 'Get Profile';
			case 'meta.addProfile': return 'Add Profile';
			case 'meta.myProfiles': return 'My Profiles';
			case 'meta.profileEdit': return 'Profile Edit';
			case 'meta.profileEditReloadAfterProfileUpdate': return 'Reload after Profile update';
			case 'meta.profileImport': return 'Import Profile File';
			case 'meta.profileAddUrlOrContent': return 'Add Profile Link';
			case 'meta.profileUrlOrContent': return 'Profile Link/Content';
			case 'meta.profileUrlOrContentHit': return 'Profile Link/Content [Required] (Support Clash,V2ray(batch supported),Stash,Karing,Sing-box,Shadowsocks,Sub Profile links)';
			case 'meta.profileUrlOrContentCannotEmpty': return 'Profile Link can not be empty';
			case 'permission.camera': return 'Camera';
			case 'permission.screen': return 'Screen Recording';
			case 'permission.appQuery': return 'Get Application List';
			case 'permission.request': return ({required Object p}) => 'Turn on [${p}] permission';
			case 'permission.requestNeed': return ({required Object p}) => 'Please Turn on [${p}] permission';
			case 'tls.insecure': return 'Skip Certificate Verification';
			case 'tls.certificate': return 'Certificate';
			case 'tls.privateKey': return 'Private Key';
			case 'tls.customTrustCert': return 'Custom Certifactes';
			case 'tun.stack': return 'Network stack';
			case 'tun.dnsHijack': return 'DNS Hijack';
			case 'tun.strictRoute': return 'Strict Route';
			case 'tun.allowBypass': return 'Allow Apps to Bypass VPN';
			case 'tun.appendHttpProxy': return 'Append HTTP Proxy to VPN';
			case 'tun.bypassHttpProxyDomain': return 'Domains allowed to bypass HTTP proxy';
			case 'dns.fakeIp': return 'fake-ip';
			case 'dns.fallback': return 'Fallback';
			case 'dns.preferH3': return 'Prefer DoH H3';
			case 'dns.useHosts': return 'Use Hosts';
			case 'dns.useSystemHosts': return 'Use System Hosts';
			case 'dns.enhancedMode': return 'Enhanced Mode';
			case 'dns.fakeIPFilterMode': return '${_root.dns.fakeIp} Filter Mode';
			case 'dns.fakeIPFilter': return 'fake-ip Filter';
			case 'dns.nameServer': return 'NameServer';
			case 'dns.defaultNameServer': return '${_root.meta.byDefault} ${_root.dns.nameServer}';
			case 'dns.proxyNameServer': return '${_root.meta.proxy} ${_root.dns.nameServer}';
			case 'dns.directNameServer': return '${_root.meta.direct} ${_root.dns.nameServer}';
			case 'dns.fallbackNameServer': return '${_root.dns.fallback} ${_root.dns.nameServer}';
			case 'dns.fallbackGeoIp': return '${_root.dns.fallback} GeoIp';
			case 'dns.fallbackGeoIpCode': return '${_root.dns.fallback} GeoIpCode';
			case 'sniffer.overrideDest': return 'Override';
			case 'profilePatchMode.currentSelected': return 'Current Selected';
			case 'profilePatchMode.overwrite': return 'Built-in Overwrite';
			case 'profilePatchMode.noOverwrite': return 'Built-in - no Overwrite';
			case 'protocolSniff': return 'Protocol Sniff';
			case 'protocolSniffOverrideDestination': return 'The Sniff domain name override the connection target address';
			case 'edgeRuntimeNotInstalled': return 'The current device has not installed the Edge WebView2 runtime, so the page cannot be displayed. Please download and install the Edge WebView2 runtime (x64), restart the App and try again.';
			case 'locales.en': return 'English';
			case 'locales.zh-CN': return '简体中文';
			case 'locales.ar': return 'عربي';
			case 'locales.ru': return 'Русский';
			case 'locales.fa': return 'فارسی';
			default: return null;
		}
	}
}

