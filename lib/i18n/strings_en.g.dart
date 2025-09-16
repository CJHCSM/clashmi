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

	/// en: 'Protocol Sniff'
	String get protocolSniff => 'Protocol Sniff';

	/// en: 'The Sniff domain name override the connection target address'
	String get protocolSniffOverrideDestination => 'The Sniff domain name override the connection target address';

	/// en: 'The current device has not installed the Edge WebView2 runtime, so the page cannot be displayed. Please download and install the Edge WebView2 runtime (x64), restart the App and try again.'
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

	/// en: 'Server Url'
	String get webdavServerUrl => 'Server Url';

	/// en: 'Can not be empty'
	String get webdavRequired => 'Can not be empty';

	/// en: 'Login failed:'
	String get webdavLoginFailed => 'Login failed:';

	/// en: 'Failed to get file list:'
	String get webdavListFailed => 'Failed to get file list:';
}

// Path: LaunchFailedScreen
class TranslationsLaunchFailedScreenEn {
	TranslationsLaunchFailedScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The app failed to start [Invalid process name], please reinstall the app to a separate directory'
	String get invalidProcess => 'The app failed to start [Invalid process name], please reinstall the app to a separate directory';

	/// en: 'The app failed to start [Failed to access the profile], please reinstall the app'
	String get invalidProfile => 'The app failed to start [Failed to access the profile], please reinstall the app';

	/// en: 'The app failed to start [Invalid version], please reinstall the app'
	String get invalidVersion => 'The app failed to start [Invalid version], please reinstall the app';

	/// en: 'The app failed to start [system version too low]'
	String get systemVersionLow => 'The app failed to start [system version too low]';

	/// en: 'The installation path is invalid, please reinstall it to a valid path'
	String get invalidInstallPath => 'The installation path is invalid, please reinstall it to a valid path';
}

// Path: PerAppAndroidScreen
class TranslationsPerAppAndroidScreenEn {
	TranslationsPerAppAndroidScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Per-App Proxy'
	String get title => 'Per-App Proxy';

	/// en: 'Whitelist Mode'
	String get whiteListMode => 'Whitelist Mode';

	/// en: 'When enabled: only the apps that have been checked are proxies; when not enabled: only the apps that are not checked are proxies'
	String get whiteListModeTip => 'When enabled: only the apps that have been checked are proxies; when not enabled: only the apps that are not checked are proxies';
}

// Path: UserAgreementScreen
class TranslationsUserAgreementScreenEn {
	TranslationsUserAgreementScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your Privacy Comes First'
	String get privacyFirst => 'Your Privacy Comes First';

	/// en: 'Accept & Continue'
	String get agreeAndContinue => 'Accept & Continue';
}

// Path: VersionUpdateScreen
class TranslationsVersionUpdateScreenEn {
	TranslationsVersionUpdateScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The new version[$p] is ready'
	String versionReady({required Object p}) => 'The new version[${p}] is ready';

	/// en: 'Restart To Update'
	String get update => 'Restart To Update';

	/// en: 'Not Now'
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

	/// en: 'Enable'
	String get enable => 'Enable';

	/// en: 'Disable'
	String get disable => 'Disable';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Quit'
	String get quit => 'Quit';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Added successfully'
	String get addSuccess => 'Added successfully';

	/// en: 'Add failed:$p'
	String addFailed({required Object p}) => 'Add failed:${p}';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Are you sure to delete?'
	String get removeConfirm => 'Are you sure to delete?';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'View'
	String get view => 'View';

	/// en: 'Remark'
	String get remark => 'Remark';

	/// en: 'Default'
	String get byDefault => 'Default';

	/// en: 'Edit Remark'
	String get editRemark => 'Edit Remark';

	/// en: 'More'
	String get more => 'More';

	/// en: 'Info'
	String get tips => 'Info';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Ok'
	String get ok => 'Ok';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'FAQ'
	String get faq => 'FAQ';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Days'
	String get days => 'Days';

	/// en: 'Hours'
	String get hours => 'Hours';

	/// en: 'Minutes'
	String get minutes => 'Minutes';

	/// en: 'Seconds'
	String get seconds => 'Seconds';

	/// en: 'Protocol'
	String get protocol => 'Protocol';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Custom'
	String get custom => 'Custom';

	/// en: 'Connect'
	String get connect => 'Connect';

	/// en: 'Disconnect'
	String get disconnect => 'Disconnect';

	/// en: 'Connected'
	String get connected => 'Connected';

	/// en: 'Disconnected'
	String get disconnected => 'Disconnected';

	/// en: 'Connecting'
	String get connecting => 'Connecting';

	/// en: 'Connect Timeout'
	String get connectTimeout => 'Connect Timeout';

	/// en: 'Timeout'
	String get timeout => 'Timeout';

	/// en: 'Timeout Duration'
	String get timeoutDuration => 'Timeout Duration';

	/// en: 'Latency'
	String get latency => 'Latency';

	/// en: 'Latency Checks'
	String get latencyTest => 'Latency Checks';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Apply'
	String get apply => 'Apply';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Retry?'
	String get retry => 'Retry?';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Update interval'
	String get updateInterval => 'Update interval';

	/// en: 'Update failed:$p'
	String updateFailed({required Object p}) => 'Update failed:${p}';

	/// en: 'Minimum: 5m'
	String get updateInterval5mTips => 'Minimum: 5m';

	/// en: 'None'
	String get none => 'None';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Authentication'
	String get authentication => 'Authentication';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'User'
	String get user => 'User';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'sudo password (required for TUN mode)'
	String get sudoPassword => 'sudo password (required for TUN mode)';

	/// en: 'Other'
	String get other => 'Other';

	/// en: 'DNS'
	String get dns => 'DNS';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Invalid URL'
	String get urlInvalid => 'Invalid URL';

	/// en: 'Link can not be empty'
	String get urlCannotEmpty => 'Link can not be empty';

	/// en: 'URL is too long (>8182)'
	String get urlTooLong => 'URL is too long (>8182)';

	/// en: 'Copy Link'
	String get copyUrl => 'Copy Link';

	/// en: 'Open Link'
	String get openUrl => 'Open Link';

	/// en: 'Share Link'
	String get shareUrl => 'Share Link';

	/// en: 'Note: After modifying the configuration, you need to reconnect to take effect'
	String get coreSettingTips => 'Note: After modifying the configuration, you need to reconnect to take effect';

	/// en: 'Overwrite'
	String get overwrite => 'Overwrite';

	/// en: 'Custom Overwrite'
	String get overwriteCustom => 'Custom Overwrite';

	/// en: 'Original Profile <- Custom Overwrite <- App Overwrite'
	String get overwriteTips => 'Original Profile <- Custom Overwrite <- App Overwrite';

	/// en: 'Do not overwrite'
	String get noOverwrite => 'Do not overwrite';

	/// en: 'Overwrite Settings'
	String get overwriteSettings => 'Overwrite Settings';

	/// en: 'External Controller'
	String get externalController => 'External Controller';

	/// en: 'Secret'
	String get secret => 'Secret';

	/// en: 'TCP Concurrent Handshake'
	String get tcpConcurrent => 'TCP Concurrent Handshake';

	/// en: 'TLS Global Fingerprint'
	String get globalClientFingerprint => 'TLS Global Fingerprint';

	/// en: 'LAN device access'
	String get allowLanAccess => 'LAN device access';

	/// en: 'Mixed Proxy Port'
	String get mixedPort => 'Mixed Proxy Port';

	/// en: 'Log Level'
	String get logLevel => 'Log Level';

	/// en: 'TCP Keep-alive Interval'
	String get tcpkeepAliveInterval => 'TCP Keep-alive Interval';

	/// en: 'Delay Test URL'
	String get delayTestUrl => 'Delay Test URL';

	/// en: 'Delay Test Timeout(ms)'
	String get delayTestTimeout => 'Delay Test Timeout(ms)';

	/// en: 'TUN'
	String get tun => 'TUN';

	/// en: 'NTP'
	String get ntp => 'NTP';

	/// en: 'TLS'
	String get tls => 'TLS';

	/// en: 'GEO'
	String get geo => 'GEO';

	/// en: 'Downloading Geo RuleSet by proxy'
	String get geoDownloadByProxy => 'Downloading Geo RuleSet by proxy';

	/// en: 'Geosite/Geoip/Asn will be converted into the corresponding RuleSet'
	String get geoRulesetTips => 'Geosite/Geoip/Asn will be converted into the corresponding RuleSet';

	/// en: 'Sniffer'
	String get sniffer => 'Sniffer';

	/// en: 'UserAgent'
	String get userAgent => 'UserAgent';

	/// en: 'Launch at Startup'
	String get launchAtStartup => 'Launch at Startup';

	/// en: 'Please restart Clash Mi as administrator'
	String get launchAtStartupRunAsAdmin => 'Please restart Clash Mi as administrator';

	/// en: 'Portable Mode'
	String get portableMode => 'Portable Mode';

	/// en: 'If you need to exit portable mode, please exit [clashmi] and manually delete the [portable] folder in the same directory as [clashmi.exe]'
	String get portableModeDisableTips => 'If you need to exit portable mode, please exit [clashmi] and manually delete the [portable] folder in the same directory as [clashmi.exe]';

	/// en: 'System Proxy'
	String get systemProxy => 'System Proxy';

	/// en: 'Auto Connection after Launch'
	String get autoConnectAfterLaunch => 'Auto Connection after Launch';

	/// en: 'Hide window after startup'
	String get hideAfterLaunch => 'Hide window after startup';

	/// en: 'Auto Set System Proxy when Connected'
	String get autoSetSystemProxy => 'Auto Set System Proxy when Connected';

	/// en: 'Domain names that are allowed to bypass the system proxy'
	String get bypassSystemProxy => 'Domain names that are allowed to bypass the system proxy';

	/// en: 'Hide from [Recent Tasks]'
	String get excludeFromRecent => 'Hide from [Recent Tasks]';

	/// en: 'Wake Lock'
	String get wakeLock => 'Wake Lock';

	/// en: 'Hide VPN Icon'
	String get hideVpn => 'Hide VPN Icon';

	/// en: 'Enabling IPv6 will cause this function to fail'
	String get hideVpnTips => 'Enabling IPv6 will cause this function to fail';

	/// en: 'Hide Dock Icon'
	String get hideDockIcon => 'Hide Dock Icon';

	/// en: 'Website'
	String get website => 'Website';

	/// en: 'Rule'
	String get rule => 'Rule';

	/// en: 'Global'
	String get global => 'Global';

	/// en: 'Direct'
	String get direct => 'Direct';

	/// en: 'Block'
	String get block => 'Block';

	/// en: 'QR Code'
	String get qrcode => 'QR Code';

	/// en: 'The text is too long to display'
	String get qrcodeTooLong => 'The text is too long to display';

	/// en: 'Share QR Code'
	String get qrcodeShare => 'Share QR Code';

	/// en: 'Text To QR Code'
	String get textToQrcode => 'Text To QR Code';

	/// en: 'Scan QR Code'
	String get qrcodeScan => 'Scan QR Code';

	/// en: 'Scan Result'
	String get qrcodeScanResult => 'Scan Result';

	/// en: 'Scan From Image'
	String get qrcodeScanFromImage => 'Scan From Image';

	/// en: 'Failed to parse the image, please make sure the screenshot is a valid QR code'
	String get qrcodeScanResultFailed => 'Failed to parse the image, please make sure the screenshot is a valid QR code';

	/// en: 'Scan Result is empty'
	String get qrcodeScanResultEmpty => 'Scan Result is empty';

	/// en: 'Screenshot'
	String get screenshot => 'Screenshot';

	/// en: 'Backup and Sync'
	String get backupAndSync => 'Backup and Sync';

	/// en: 'Import Success'
	String get importSuccess => 'Import Success';

	/// en: 'This file will overwrite the existing local configuration. Do you want to continue?'
	String get rewriteConfirm => 'This file will overwrite the existing local configuration. Do you want to continue?';

	/// en: 'Import and Export'
	String get importAndExport => 'Import and Export';

	/// en: 'Import'
	String get import => 'Import';

	/// en: 'Import from URL'
	String get importFromUrl => 'Import from URL';

	/// en: 'Export'
	String get export => 'Export';

	/// en: 'Send'
	String get send => 'Send';

	/// en: 'Receive'
	String get receive => 'Receive';

	/// en: 'Confirm to send?'
	String get sendConfirm => 'Confirm to send?';

	/// en: 'Terms of Service'
	String get termOfUse => 'Terms of Service';

	/// en: 'Privacy & Policy'
	String get privacyPolicy => 'Privacy & Policy';

	/// en: 'Log'
	String get log => 'Log';

	/// en: 'Core Log'
	String get coreLog => 'Core Log';

	/// en: 'Core'
	String get core => 'Core';

	/// en: 'Help'
	String get help => 'Help';

	/// en: 'Tutorial'
	String get tutorial => 'Tutorial';

	/// en: 'Board'
	String get board => 'Board';

	/// en: 'Use Online Board'
	String get boardOnline => 'Use Online Board';

	/// en: 'Online Board URL'
	String get boardOnlineUrl => 'Online Board URL';

	/// en: 'Local Board Port'
	String get boardLocalPort => 'Local Board Port';

	/// en: 'Disable Font scaling(Restart takes effect)'
	String get disableFontScaler => 'Disable Font scaling(Restart takes effect)';

	/// en: 'Rotate with the screen'
	String get autoOrientation => 'Rotate with the screen';

	/// en: 'Restart takes effect'
	String get restartTakesEffect => 'Restart takes effect';

	/// en: 'Runtime Profile'
	String get runtimeProfile => 'Runtime Profile';

	/// en: 'Please restart your device to complete the system extension installation'
	String get willCompleteAfterRebootInstall => 'Please restart your device to complete the system extension installation';

	/// en: 'Please restart your device to complete the the system extension uninstallation'
	String get willCompleteAfterRebootUninstall => 'Please restart your device to complete the the system extension uninstallation';

	/// en: 'Please [Allow] Clash Mi to install system extensions in [System Settings]-[Privacy and Security], and reconnect after installation is complete.'
	String get requestNeedsUserApproval => 'Please [Allow] Clash Mi to install system extensions in [System Settings]-[Privacy and Security], and reconnect after installation is complete.';

	/// en: 'Please enable clashmiServiceSE permission in [System Settings]-[Privacy and Security]-[Full Disk Access] and reconnect.'
	String get FullDiskAccessPermissionRequired => 'Please enable clashmiServiceSE permission in [System Settings]-[Privacy and Security]-[Full Disk Access] and reconnect.';

	/// en: 'Proxy'
	String get proxy => 'Proxy';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'TV Mode'
	String get tvMode => 'TV Mode';

	/// en: 'Auto Update'
	String get autoUpdate => 'Auto Update';

	/// en: 'Auto Update Channel'
	String get updateChannel => 'Auto Update Channel';

	/// en: 'Update Version $p'
	String hasNewVersion({required Object p}) => 'Update Version ${p}';

	/// en: 'Developer Options'
	String get devOptions => 'Developer Options';

	/// en: 'About'
	String get about => 'About';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Notice'
	String get notice => 'Notice';

	/// en: 'Reorder'
	String get sort => 'Reorder';

	/// en: 'Recommend'
	String get recommended => 'Recommend';

	/// en: 'Inner Error:$p'
	String innerError({required Object p}) => 'Inner Error:${p}';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Import From Clipboard'
	String get importFromClipboard => 'Import From Clipboard';

	/// en: 'Export to Clipboard'
	String get exportToClipboard => 'Export to Clipboard';

	/// en: 'Server'
	String get server => 'Server';

	/// en: 'Port'
	String get port => 'Port';

	/// en: 'Donate'
	String get donate => 'Donate';

	/// en: 'Settings'
	String get setting => 'Settings';

	/// en: 'Core Settings'
	String get settingCore => 'Core Settings';

	/// en: 'App Settings'
	String get settingApp => 'App Settings';

	/// en: 'Core Overwrite'
	String get coreOverwrite => 'Core Overwrite';

	/// en: 'iCloud'
	String get iCloud => 'iCloud';

	/// en: 'Webdav'
	String get webdav => 'Webdav';

	/// en: 'LAN Sync'
	String get lanSync => 'LAN Sync';

	/// en: 'Do not exit this interface before synchronization is completed'
	String get lanSyncNotQuitTips => 'Do not exit this interface before synchronization is completed';

	/// en: 'Not enough disk space'
	String get deviceNoSpace => 'Not enough disk space';

	/// en: 'Hide System Apps'
	String get hideSystemApp => 'Hide System Apps';

	/// en: 'Hide App Icons'
	String get hideAppIcon => 'Hide App Icons';

	/// en: 'Open File Directory'
	String get openDir => 'Open File Directory';

	/// en: 'Select File'
	String get fileChoose => 'Select File';

	/// en: 'The file path can not be empty'
	String get filePathCannotEmpty => 'The file path can not be empty';

	/// en: 'File does not exist:$p'
	String fileNotExist({required Object p}) => 'File does not exist:${p}';

	/// en: 'Invalid file type:$p'
	String fileTypeInvalid({required Object p}) => 'Invalid file type:${p}';

	/// en: 'UWP Network Isolation Exemptions'
	String get uwpExemption => 'UWP Network Isolation Exemptions';

	/// en: 'Get Profile'
	String get getProfile => 'Get Profile';

	/// en: 'Add Profile'
	String get addProfile => 'Add Profile';

	/// en: 'My Profiles'
	String get myProfiles => 'My Profiles';

	/// en: 'Profile Edit'
	String get profileEdit => 'Profile Edit';

	/// en: 'Reload after Profile update'
	String get profileEditReloadAfterProfileUpdate => 'Reload after Profile update';

	/// en: 'Import Profile File'
	String get profileImport => 'Import Profile File';

	/// en: 'Add Profile Link'
	String get profileAddUrlOrContent => 'Add Profile Link';

	/// en: 'Profile Link/Content'
	String get profileUrlOrContent => 'Profile Link/Content';

	/// en: 'Profile Link/Content [Required] (Support Clash,V2ray(batch supported),Stash,Karing,Sing-box,Shadowsocks,Sub Profile links)'
	String get profileUrlOrContentHit => 'Profile Link/Content [Required] (Support Clash,V2ray(batch supported),Stash,Karing,Sing-box,Shadowsocks,Sub Profile links)';

	/// en: 'Profile Link can not be empty'
	String get profileUrlOrContentCannotEmpty => 'Profile Link can not be empty';
}

// Path: permission
class TranslationsPermissionEn {
	TranslationsPermissionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Camera'
	String get camera => 'Camera';

	/// en: 'Screen Recording'
	String get screen => 'Screen Recording';

	/// en: 'Get Application List'
	String get appQuery => 'Get Application List';

	/// en: 'Turn on [$p] permission'
	String request({required Object p}) => 'Turn on [${p}] permission';

	/// en: 'Please Turn on [$p] permission'
	String requestNeed({required Object p}) => 'Please Turn on [${p}] permission';
}

// Path: tls
class TranslationsTlsEn {
	TranslationsTlsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Skip Certificate Verification'
	String get insecure => 'Skip Certificate Verification';

	/// en: 'Certificate'
	String get certificate => 'Certificate';

	/// en: 'Private Key'
	String get privateKey => 'Private Key';

	/// en: 'Custom Certifactes'
	String get customTrustCert => 'Custom Certifactes';
}

// Path: tun
class TranslationsTunEn {
	TranslationsTunEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Network stack'
	String get stack => 'Network stack';

	/// en: 'DNS Hijack'
	String get dnsHijack => 'DNS Hijack';

	/// en: 'Strict Route'
	String get strictRoute => 'Strict Route';

	/// en: 'Allow Apps to Bypass VPN'
	String get allowBypass => 'Allow Apps to Bypass VPN';

	/// en: 'Append HTTP Proxy to VPN'
	String get appendHttpProxy => 'Append HTTP Proxy to VPN';

	/// en: 'Domains allowed to bypass HTTP proxy'
	String get bypassHttpProxyDomain => 'Domains allowed to bypass HTTP proxy';
}

// Path: dns
class TranslationsDnsEn {
	TranslationsDnsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'fake-ip'
	String get fakeIp => 'fake-ip';

	/// en: 'Fallback'
	String get fallback => 'Fallback';

	/// en: 'Prefer DoH H3'
	String get preferH3 => 'Prefer DoH H3';

	/// en: 'Use Hosts'
	String get useHosts => 'Use Hosts';

	/// en: 'Use System Hosts'
	String get useSystemHosts => 'Use System Hosts';

	/// en: 'Enhanced Mode'
	String get enhancedMode => 'Enhanced Mode';

	/// en: 'fake-ip Filter Mode'
	String get fakeIPFilterMode => '${_root.dns.fakeIp} Filter Mode';

	/// en: 'fake-ip Filter'
	String get fakeIPFilter => 'fake-ip Filter';

	/// en: 'NameServer'
	String get nameServer => 'NameServer';

	/// en: 'Default NameServer'
	String get defaultNameServer => '${_root.meta.byDefault} ${_root.dns.nameServer}';

	/// en: 'Proxy NameServer'
	String get proxyNameServer => '${_root.meta.proxy} ${_root.dns.nameServer}';

	/// en: 'Direct NameServer'
	String get directNameServer => '${_root.meta.direct} ${_root.dns.nameServer}';

	/// en: 'Fallback NameServer'
	String get fallbackNameServer => '${_root.dns.fallback} ${_root.dns.nameServer}';

	/// en: 'Fallback GeoIp'
	String get fallbackGeoIp => '${_root.dns.fallback} GeoIp';

	/// en: 'Fallback GeoIpCode'
	String get fallbackGeoIpCode => '${_root.dns.fallback} GeoIpCode';
}

// Path: sniffer
class TranslationsSnifferEn {
	TranslationsSnifferEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Override'
	String get overrideDest => 'Override';
}

// Path: profilePatchMode
class TranslationsProfilePatchModeEn {
	TranslationsProfilePatchModeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Current Selected'
	String get currentSelected => 'Current Selected';

	/// en: 'Built-in Overwrite'
	String get overwrite => 'Built-in Overwrite';

	/// en: 'Built-in - no Overwrite'
	String get noOverwrite => 'Built-in - no Overwrite';
}

// Path: main.tray
class TranslationsMainTrayEn {
	TranslationsMainTrayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: ' Open '
	String get menuOpen => '    Open    ';

	/// en: ' Exit '
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
			case 'meta.sudoPassword': return 'sudo password (required for TUN mode)';
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
			case 'meta.excludeFromRecent': return 'Hide from [Recent Tasks]';
			case 'meta.wakeLock': return 'Wake Lock';
			case 'meta.hideVpn': return 'Hide VPN Icon';
			case 'meta.hideVpnTips': return 'Enabling IPv6 will cause this function to fail';
			case 'meta.hideDockIcon': return 'Hide Dock Icon';
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

