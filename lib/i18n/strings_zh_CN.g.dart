///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsZhCn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsBackupAndSyncWebdavScreenZhCn BackupAndSyncWebdavScreen = _TranslationsBackupAndSyncWebdavScreenZhCn._(_root);
	@override late final _TranslationsLaunchFailedScreenZhCn LaunchFailedScreen = _TranslationsLaunchFailedScreenZhCn._(_root);
	@override late final _TranslationsPerAppAndroidScreenZhCn PerAppAndroidScreen = _TranslationsPerAppAndroidScreenZhCn._(_root);
	@override late final _TranslationsUserAgreementScreenZhCn UserAgreementScreen = _TranslationsUserAgreementScreenZhCn._(_root);
	@override late final _TranslationsVersionUpdateScreenZhCn VersionUpdateScreen = _TranslationsVersionUpdateScreenZhCn._(_root);
	@override late final _TranslationsMainZhCn main = _TranslationsMainZhCn._(_root);
	@override late final _TranslationsMetaZhCn meta = _TranslationsMetaZhCn._(_root);
	@override late final _TranslationsPermissionZhCn permission = _TranslationsPermissionZhCn._(_root);
	@override late final _TranslationsTlsZhCn tls = _TranslationsTlsZhCn._(_root);
	@override late final _TranslationsTunZhCn tun = _TranslationsTunZhCn._(_root);
	@override late final _TranslationsDnsZhCn dns = _TranslationsDnsZhCn._(_root);
	@override late final _TranslationsSnifferZhCn sniffer = _TranslationsSnifferZhCn._(_root);
	@override late final _TranslationsProfilePatchModeZhCn profilePatchMode = _TranslationsProfilePatchModeZhCn._(_root);
	@override String get protocolSniff => '协议探测';
	@override String get protocolSniffOverrideDestination => '探测的域名覆盖连接目标地址';
	@override String get edgeRuntimeNotInstalled => '当前设备尚未安装Edge WebView2运行时,无法展示页面,请下载安装Edge WebView2运行时(x64)后,重启App再试';
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: BackupAndSyncWebdavScreen
class _TranslationsBackupAndSyncWebdavScreenZhCn implements TranslationsBackupAndSyncWebdavScreenEn {
	_TranslationsBackupAndSyncWebdavScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get webdavServerUrl => '服务器地址';
	@override String get webdavRequired => '不能为空';
	@override String get webdavLoginFailed => '登录失败:';
	@override String get webdavListFailed => '获取文件列表失败:';
}

// Path: LaunchFailedScreen
class _TranslationsLaunchFailedScreenZhCn implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => '应用启动失败[无效的进程名称],请重新安装应用到独立目录';
	@override String get invalidProfile => '应用启动失败[访问配置文件失败],请重新安装应用';
	@override String get invalidVersion => '应用启动失败[无效版本],请重新安装应用';
	@override String get systemVersionLow => '应用启动失败[系统版本过低]';
	@override String get invalidInstallPath => '无效的安装路径,请重新安装到有效路径';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenZhCn implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '分应用代理';
	@override String get whiteListMode => '白名单模式';
	@override String get whiteListModeTip => '启用后:仅代理已勾选的App;未启用:仅代理未勾选的App';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenZhCn implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => '您的隐私很重要';
	@override String get agreeAndContinue => '接受并继续';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenZhCn implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => '新版本[${p}]已就绪';
	@override String get update => '重启更新';
	@override String get cancel => '暂不更新';
}

// Path: main
class _TranslationsMainZhCn implements TranslationsMainEn {
	_TranslationsMainZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayZhCn tray = _TranslationsMainTrayZhCn._(_root);
}

// Path: meta
class _TranslationsMetaZhCn implements TranslationsMetaEn {
	_TranslationsMetaZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get enable => '启用';
	@override String get disable => '禁用';
	@override String get open => '打开';
	@override String get close => '关闭';
	@override String get quit => '退出';
	@override String get add => '添加';
	@override String get addSuccess => '添加成功';
	@override String addFailed({required Object p}) => '添加失败:${p}';
	@override String get remove => '删除';
	@override String get removeConfirm => '确认删除?';
	@override String get edit => '编辑';
	@override String get view => '查看';
	@override String get remark => '备注';
	@override String get byDefault => '默认';
	@override String get editRemark => '修改备注';
	@override String get more => '更多';
	@override String get tips => '提示';
	@override String get copy => '拷贝';
	@override String get save => '保存';
	@override String get ok => '确定';
	@override String get cancel => '取消';
	@override String get faq => '常见问题';
	@override String get download => '下载';
	@override String get loading => '加载中...';
	@override String get days => '天';
	@override String get hours => '时';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get protocol => '协议';
	@override String get search => '搜索';
	@override String get custom => '自定义';
	@override String get connect => '连接';
	@override String get disconnect => '断开';
	@override String get connected => '已连接';
	@override String get disconnected => '未连接';
	@override String get connecting => '连接中';
	@override String get connectTimeout => '连接超时';
	@override String get timeout => '超时';
	@override String get timeoutDuration => '超时时长';
	@override String get latency => '延迟';
	@override String get latencyTest => '延迟检测';
	@override String get language => '语言';
	@override String get next => '下一步';
	@override String get done => '完成';
	@override String get apply => '应用';
	@override String get refresh => '刷新';
	@override String get retry => '是否重试?';
	@override String get update => '更新';
	@override String get updateInterval => '更新时间间隔';
	@override String get updateInterval5mTips => '最小:5m';
	@override String updateFailed({required Object p}) => '更新失败:${p}';
	@override String get none => '无';
	@override String get reset => '重置';
	@override String get authentication => '授权';
	@override String get submit => '提交';
	@override String get user => '用户';
	@override String get account => '账号';
	@override String get password => '密码';
	@override String get required => '必填';
	@override String get other => '其他';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'URL无效';
	@override String get urlCannotEmpty => 'URL不能为空';
	@override String get urlTooLong => 'URL过长(>8182)';
	@override String get copyUrl => '拷贝链接';
	@override String get openUrl => '打开链接';
	@override String get shareUrl => '分享链接';
	@override String get coreSettingTips => '注意:修改配置后,需要重新连接才会生效';
	@override String get overwrite => '覆写';
	@override String get overwriteCustom => '自定义覆写';
	@override String get overwriteTips => '原始配置<-自定义覆写<-App覆写';
	@override String get noOverwrite => '不覆写';
	@override String get overwriteSettings => '覆写设置';
	@override String get externalController => '外部控制';
	@override String get secret => 'Secret';
	@override String get tcpConcurrent => 'TCP并发握手';
	@override String get globalClientFingerprint => 'TLS全局指纹';
	@override String get allowLanAccess => '局域网设备接入';
	@override String get mixedPort => '混合代理端口';
	@override String get logLevel => '日志等级';
	@override String get tcpkeepAliveInterval => 'TCP保活时间间隔';
	@override String get delayTestUrl => '延迟测试URL';
	@override String get delayTestTimeout => '延迟测试超时(ms)';
	@override String get tun => 'TUN';
	@override String get ntp => 'NTP';
	@override String get tls => 'TLS';
	@override String get geo => 'GEO';
	@override String get geoDownloadByProxy => '使用代理下载Geo RuleSet';
	@override String get geoRulesetTips => 'Geosite/Geoip/Asn 会被转换成 对应的RuleSet';
	@override String get sniffer => '嗅探';
	@override String get userAgent => 'UserAgent';
	@override String get launchAtStartup => '开机启动';
	@override String get launchAtStartupRunAsAdmin => '请以管理员身份重新启动Clash Mi';
	@override String get portableMode => '便携模式';
	@override String get portableModeDisableTips => '如需退出便携模式,请退出[clashmi]后,手动删除[clashmi.exe]同目录下的[portable]文件夹即可';
	@override String get systemProxy => '系统代理';
	@override String get autoConnectAfterLaunch => '启动后自动连接';
	@override String get hideAfterLaunch => '启动后隐藏窗口';
	@override String get autoSetSystemProxy => '连接后自动设置系统代理';
	@override String get bypassSystemProxy => '允许绕过系统代理的域名';
	@override String get website => '官网';
	@override String get rule => '规则';
	@override String get global => '全局';
	@override String get direct => '直连';
	@override String get block => '拦截';
	@override String get qrcode => '二维码';
	@override String get qrcodeTooLong => '文本过长,无法展示';
	@override String get qrcodeShare => '分享二维码';
	@override String get textToQrcode => '文本转二维码';
	@override String get qrcodeScan => '扫描二维码';
	@override String get qrcodeScanResult => '扫描结果';
	@override String get qrcodeScanFromImage => '打开二维码图片';
	@override String get qrcodeScanResultFailed => '解析图片失败,请确保截图为有效的二维码';
	@override String get qrcodeScanResultEmpty => '扫描结果为空';
	@override String get screenshot => '截图';
	@override String get backupAndSync => '备份与同步';
	@override String get importSuccess => '导入成功';
	@override String get rewriteConfirm => '该文件将覆盖本地已有配置,是否继续?';
	@override String get importAndExport => '导入/导出';
	@override String get import => '导入';
	@override String get importFromUrl => '从URL导入';
	@override String get export => '导出';
	@override String get send => '发送';
	@override String get receive => '接收';
	@override String get sendConfirm => '确认发送?';
	@override String get termOfUse => '使用条款';
	@override String get privacyPolicy => '隐私政策';
	@override String get log => '日志';
	@override String get coreLog => '核心日志';
	@override String get core => '核心';
	@override String get help => '帮助';
	@override String get tutorial => '使用教程';
	@override String get board => '面板';
	@override String get boardOnline => '使用在线面板';
	@override String get boardOnlineUrl => '在线面板URL';
	@override String get boardLocalPort => '本地面板端口';
	@override String get disableFontScaler => '禁用字体缩放';
	@override String get autoOrientation => '跟随屏幕旋转';
	@override String get restartTakesEffect => '重启生效';
	@override String get runtimeProfile => '运行时配置';
	@override String get willCompleteAfterRebootInstall => '请重启设备,以便完成系统扩展安装';
	@override String get willCompleteAfterRebootUninstall => '请重启设备,以便完成系统扩展卸载';
	@override String get requestNeedsUserApproval => '请在[系统设置]-[隐私与安全性]里[允许] Clash Mi安装系统扩展,安装完成后重新连接';
	@override String get FullDiskAccessPermissionRequired => '请在[系统设置]-[隐私与安全性]-[完全磁盘访问权限]里开启clashmiServiceSE权限后,重新连接';
	@override String get proxy => '代理';
	@override String get theme => '主题';
	@override String get tvMode => 'TV模式';
	@override String get autoUpdate => '自动更新';
	@override String get updateChannel => '自动更新通道';
	@override String hasNewVersion({required Object p}) => '更新版本 ${p}';
	@override String get devOptions => '开发者选项';
	@override String get about => '关于';
	@override String get name => '名称';
	@override String get version => '版本';
	@override String get notice => '通知';
	@override String get sort => '排序';
	@override String get recommended => '推荐';
	@override String innerError({required Object p}) => '内部错误:${p}';
	@override String get share => '分享';
	@override String get importFromClipboard => '从剪贴板导入';
	@override String get exportToClipboard => '导出到剪贴板';
	@override String get server => '服务器';
	@override String get port => '端口';
	@override String get donate => '捐助';
	@override String get setting => '设置';
	@override String get settingCore => '核心设置';
	@override String get settingApp => '应用设置';
	@override String get coreOverwrite => '核心覆写';
	@override String get iCloud => 'iCloud';
	@override String get webdav => 'Webdav';
	@override String get lanSync => '局域网同步';
	@override String get lanSyncNotQuitTips => '同步完成前请勿退出此界面';
	@override String get deviceNoSpace => '磁盘空间不足';
	@override String get hideSystemApp => '隐藏系统应用';
	@override String get hideAppIcon => '隐藏应用图标';
	@override String get openDir => '打开文件目录';
	@override String get fileChoose => '选择文件';
	@override String get filePathCannotEmpty => '文件路径不能为空';
	@override String fileNotExist({required Object p}) => '文件不存在:${p}';
	@override String fileTypeInvalid({required Object p}) => '无效的文件类型:${p}';
	@override String get uwpExemption => 'UWP网络隔离豁免';
	@override String get getProfile => '获取配置';
	@override String get addProfile => '添加配置';
	@override String get myProfiles => '我的配置';
	@override String get profileEdit => '编辑配置';
	@override String get profileEditReloadAfterProfileUpdate => '配置更新后重新加载';
	@override String get profileImport => '导入配置文件';
	@override String get profileAddUrlOrContent => '添加配置链接';
	@override String get profileUrlOrContent => '配置链接/内容';
	@override String get profileUrlOrContentHit => 'Clash配置链接/内容[必填]';
	@override String get profileUrlOrContentCannotEmpty => '配置链接不能为空';
}

// Path: permission
class _TranslationsPermissionZhCn implements TranslationsPermissionEn {
	_TranslationsPermissionZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get camera => '摄像头';
	@override String get screen => '屏幕录制';
	@override String get appQuery => '获取应用列表';
	@override String request({required Object p}) => '开启[${p}]权限';
	@override String requestNeed({required Object p}) => '请开启[${p}]权限';
}

// Path: tls
class _TranslationsTlsZhCn implements TranslationsTlsEn {
	_TranslationsTlsZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get insecure => '跳过证书验证';
	@override String get certificate => '证书';
	@override String get privateKey => '私钥';
	@override String get customTrustCert => '自定义证书';
}

// Path: tun
class _TranslationsTunZhCn implements TranslationsTunEn {
	_TranslationsTunZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get stack => '网络栈';
	@override String get dnsHijack => 'DNS劫持';
	@override String get strictRoute => '严格路由';
	@override String get allowBypass => '允许应用绕过VPN';
	@override String get appendHttpProxy => '附加HTTP代理到VPN';
	@override String get bypassHttpProxyDomain => '允许绕过HTTP代理的域名';
}

// Path: dns
class _TranslationsDnsZhCn implements TranslationsDnsEn {
	_TranslationsDnsZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get fakeIp => 'fake-ip';
	@override String get fallback => 'Fallback';
	@override String get preferH3 => 'DoH H3优先';
	@override String get useHosts => '使用Hosts';
	@override String get useSystemHosts => '使用系统Hosts';
	@override String get enhancedMode => '增强模式';
	@override String get fakeIPFilterMode => '${_root.dns.fakeIp} 过滤模式';
	@override String get fakeIPFilter => '${_root.dns.fakeIp} 过滤';
	@override String get nameServer => '域名解析服务器';
	@override String get defaultNameServer => '${_root.meta.byDefault} ${_root.dns.nameServer}';
	@override String get proxyNameServer => '${_root.meta.proxy} ${_root.dns.nameServer}';
	@override String get directNameServer => '${_root.meta.direct} ${_root.dns.nameServer}';
	@override String get fallbackNameServer => '${_root.dns.fallback} ${_root.dns.nameServer}';
	@override String get fallbackGeoIp => '${_root.dns.fallback} GeoIp';
	@override String get fallbackGeoIpCode => '${_root.dns.fallback} GeoIpCode';
}

// Path: sniffer
class _TranslationsSnifferZhCn implements TranslationsSnifferEn {
	_TranslationsSnifferZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get overrideDest => '覆盖';
}

// Path: profilePatchMode
class _TranslationsProfilePatchModeZhCn implements TranslationsProfilePatchModeEn {
	_TranslationsProfilePatchModeZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get currentSelected => '当前选择';
	@override String get overwrite => '内置-覆写';
	@override String get noOverwrite => '内置-不覆写';
}

// Path: main.tray
class _TranslationsMainTrayZhCn implements TranslationsMainTrayEn {
	_TranslationsMainTrayZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '    打开    ';
	@override String get menuExit => '    退出    ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'BackupAndSyncWebdavScreen.webdavServerUrl': return '服务器地址';
			case 'BackupAndSyncWebdavScreen.webdavRequired': return '不能为空';
			case 'BackupAndSyncWebdavScreen.webdavLoginFailed': return '登录失败:';
			case 'BackupAndSyncWebdavScreen.webdavListFailed': return '获取文件列表失败:';
			case 'LaunchFailedScreen.invalidProcess': return '应用启动失败[无效的进程名称],请重新安装应用到独立目录';
			case 'LaunchFailedScreen.invalidProfile': return '应用启动失败[访问配置文件失败],请重新安装应用';
			case 'LaunchFailedScreen.invalidVersion': return '应用启动失败[无效版本],请重新安装应用';
			case 'LaunchFailedScreen.systemVersionLow': return '应用启动失败[系统版本过低]';
			case 'LaunchFailedScreen.invalidInstallPath': return '无效的安装路径,请重新安装到有效路径';
			case 'PerAppAndroidScreen.title': return '分应用代理';
			case 'PerAppAndroidScreen.whiteListMode': return '白名单模式';
			case 'PerAppAndroidScreen.whiteListModeTip': return '启用后:仅代理已勾选的App;未启用:仅代理未勾选的App';
			case 'UserAgreementScreen.privacyFirst': return '您的隐私很重要';
			case 'UserAgreementScreen.agreeAndContinue': return '接受并继续';
			case 'VersionUpdateScreen.versionReady': return ({required Object p}) => '新版本[${p}]已就绪';
			case 'VersionUpdateScreen.update': return '重启更新';
			case 'VersionUpdateScreen.cancel': return '暂不更新';
			case 'main.tray.menuOpen': return '    打开    ';
			case 'main.tray.menuExit': return '    退出    ';
			case 'meta.enable': return '启用';
			case 'meta.disable': return '禁用';
			case 'meta.open': return '打开';
			case 'meta.close': return '关闭';
			case 'meta.quit': return '退出';
			case 'meta.add': return '添加';
			case 'meta.addSuccess': return '添加成功';
			case 'meta.addFailed': return ({required Object p}) => '添加失败:${p}';
			case 'meta.remove': return '删除';
			case 'meta.removeConfirm': return '确认删除?';
			case 'meta.edit': return '编辑';
			case 'meta.view': return '查看';
			case 'meta.remark': return '备注';
			case 'meta.byDefault': return '默认';
			case 'meta.editRemark': return '修改备注';
			case 'meta.more': return '更多';
			case 'meta.tips': return '提示';
			case 'meta.copy': return '拷贝';
			case 'meta.save': return '保存';
			case 'meta.ok': return '确定';
			case 'meta.cancel': return '取消';
			case 'meta.faq': return '常见问题';
			case 'meta.download': return '下载';
			case 'meta.loading': return '加载中...';
			case 'meta.days': return '天';
			case 'meta.hours': return '时';
			case 'meta.minutes': return '分';
			case 'meta.seconds': return '秒';
			case 'meta.protocol': return '协议';
			case 'meta.search': return '搜索';
			case 'meta.custom': return '自定义';
			case 'meta.connect': return '连接';
			case 'meta.disconnect': return '断开';
			case 'meta.connected': return '已连接';
			case 'meta.disconnected': return '未连接';
			case 'meta.connecting': return '连接中';
			case 'meta.connectTimeout': return '连接超时';
			case 'meta.timeout': return '超时';
			case 'meta.timeoutDuration': return '超时时长';
			case 'meta.latency': return '延迟';
			case 'meta.latencyTest': return '延迟检测';
			case 'meta.language': return '语言';
			case 'meta.next': return '下一步';
			case 'meta.done': return '完成';
			case 'meta.apply': return '应用';
			case 'meta.refresh': return '刷新';
			case 'meta.retry': return '是否重试?';
			case 'meta.update': return '更新';
			case 'meta.updateInterval': return '更新时间间隔';
			case 'meta.updateInterval5mTips': return '最小:5m';
			case 'meta.updateFailed': return ({required Object p}) => '更新失败:${p}';
			case 'meta.none': return '无';
			case 'meta.reset': return '重置';
			case 'meta.authentication': return '授权';
			case 'meta.submit': return '提交';
			case 'meta.user': return '用户';
			case 'meta.account': return '账号';
			case 'meta.password': return '密码';
			case 'meta.required': return '必填';
			case 'meta.other': return '其他';
			case 'meta.dns': return 'DNS';
			case 'meta.url': return 'URL';
			case 'meta.urlInvalid': return 'URL无效';
			case 'meta.urlCannotEmpty': return 'URL不能为空';
			case 'meta.urlTooLong': return 'URL过长(>8182)';
			case 'meta.copyUrl': return '拷贝链接';
			case 'meta.openUrl': return '打开链接';
			case 'meta.shareUrl': return '分享链接';
			case 'meta.coreSettingTips': return '注意:修改配置后,需要重新连接才会生效';
			case 'meta.overwrite': return '覆写';
			case 'meta.overwriteCustom': return '自定义覆写';
			case 'meta.overwriteTips': return '原始配置<-自定义覆写<-App覆写';
			case 'meta.noOverwrite': return '不覆写';
			case 'meta.overwriteSettings': return '覆写设置';
			case 'meta.externalController': return '外部控制';
			case 'meta.secret': return 'Secret';
			case 'meta.tcpConcurrent': return 'TCP并发握手';
			case 'meta.globalClientFingerprint': return 'TLS全局指纹';
			case 'meta.allowLanAccess': return '局域网设备接入';
			case 'meta.mixedPort': return '混合代理端口';
			case 'meta.logLevel': return '日志等级';
			case 'meta.tcpkeepAliveInterval': return 'TCP保活时间间隔';
			case 'meta.delayTestUrl': return '延迟测试URL';
			case 'meta.delayTestTimeout': return '延迟测试超时(ms)';
			case 'meta.tun': return 'TUN';
			case 'meta.ntp': return 'NTP';
			case 'meta.tls': return 'TLS';
			case 'meta.geo': return 'GEO';
			case 'meta.geoDownloadByProxy': return '使用代理下载Geo RuleSet';
			case 'meta.geoRulesetTips': return 'Geosite/Geoip/Asn 会被转换成 对应的RuleSet';
			case 'meta.sniffer': return '嗅探';
			case 'meta.userAgent': return 'UserAgent';
			case 'meta.launchAtStartup': return '开机启动';
			case 'meta.launchAtStartupRunAsAdmin': return '请以管理员身份重新启动Clash Mi';
			case 'meta.portableMode': return '便携模式';
			case 'meta.portableModeDisableTips': return '如需退出便携模式,请退出[clashmi]后,手动删除[clashmi.exe]同目录下的[portable]文件夹即可';
			case 'meta.systemProxy': return '系统代理';
			case 'meta.autoConnectAfterLaunch': return '启动后自动连接';
			case 'meta.hideAfterLaunch': return '启动后隐藏窗口';
			case 'meta.autoSetSystemProxy': return '连接后自动设置系统代理';
			case 'meta.bypassSystemProxy': return '允许绕过系统代理的域名';
			case 'meta.website': return '官网';
			case 'meta.rule': return '规则';
			case 'meta.global': return '全局';
			case 'meta.direct': return '直连';
			case 'meta.block': return '拦截';
			case 'meta.qrcode': return '二维码';
			case 'meta.qrcodeTooLong': return '文本过长,无法展示';
			case 'meta.qrcodeShare': return '分享二维码';
			case 'meta.textToQrcode': return '文本转二维码';
			case 'meta.qrcodeScan': return '扫描二维码';
			case 'meta.qrcodeScanResult': return '扫描结果';
			case 'meta.qrcodeScanFromImage': return '打开二维码图片';
			case 'meta.qrcodeScanResultFailed': return '解析图片失败,请确保截图为有效的二维码';
			case 'meta.qrcodeScanResultEmpty': return '扫描结果为空';
			case 'meta.screenshot': return '截图';
			case 'meta.backupAndSync': return '备份与同步';
			case 'meta.importSuccess': return '导入成功';
			case 'meta.rewriteConfirm': return '该文件将覆盖本地已有配置,是否继续?';
			case 'meta.importAndExport': return '导入/导出';
			case 'meta.import': return '导入';
			case 'meta.importFromUrl': return '从URL导入';
			case 'meta.export': return '导出';
			case 'meta.send': return '发送';
			case 'meta.receive': return '接收';
			case 'meta.sendConfirm': return '确认发送?';
			case 'meta.termOfUse': return '使用条款';
			case 'meta.privacyPolicy': return '隐私政策';
			case 'meta.log': return '日志';
			case 'meta.coreLog': return '核心日志';
			case 'meta.core': return '核心';
			case 'meta.help': return '帮助';
			case 'meta.tutorial': return '使用教程';
			case 'meta.board': return '面板';
			case 'meta.boardOnline': return '使用在线面板';
			case 'meta.boardOnlineUrl': return '在线面板URL';
			case 'meta.boardLocalPort': return '本地面板端口';
			case 'meta.disableFontScaler': return '禁用字体缩放';
			case 'meta.autoOrientation': return '跟随屏幕旋转';
			case 'meta.restartTakesEffect': return '重启生效';
			case 'meta.runtimeProfile': return '运行时配置';
			case 'meta.willCompleteAfterRebootInstall': return '请重启设备,以便完成系统扩展安装';
			case 'meta.willCompleteAfterRebootUninstall': return '请重启设备,以便完成系统扩展卸载';
			case 'meta.requestNeedsUserApproval': return '请在[系统设置]-[隐私与安全性]里[允许] Clash Mi安装系统扩展,安装完成后重新连接';
			case 'meta.FullDiskAccessPermissionRequired': return '请在[系统设置]-[隐私与安全性]-[完全磁盘访问权限]里开启clashmiServiceSE权限后,重新连接';
			case 'meta.proxy': return '代理';
			case 'meta.theme': return '主题';
			case 'meta.tvMode': return 'TV模式';
			case 'meta.autoUpdate': return '自动更新';
			case 'meta.updateChannel': return '自动更新通道';
			case 'meta.hasNewVersion': return ({required Object p}) => '更新版本 ${p}';
			case 'meta.devOptions': return '开发者选项';
			case 'meta.about': return '关于';
			case 'meta.name': return '名称';
			case 'meta.version': return '版本';
			case 'meta.notice': return '通知';
			case 'meta.sort': return '排序';
			case 'meta.recommended': return '推荐';
			case 'meta.innerError': return ({required Object p}) => '内部错误:${p}';
			case 'meta.share': return '分享';
			case 'meta.importFromClipboard': return '从剪贴板导入';
			case 'meta.exportToClipboard': return '导出到剪贴板';
			case 'meta.server': return '服务器';
			case 'meta.port': return '端口';
			case 'meta.donate': return '捐助';
			case 'meta.setting': return '设置';
			case 'meta.settingCore': return '核心设置';
			case 'meta.settingApp': return '应用设置';
			case 'meta.coreOverwrite': return '核心覆写';
			case 'meta.iCloud': return 'iCloud';
			case 'meta.webdav': return 'Webdav';
			case 'meta.lanSync': return '局域网同步';
			case 'meta.lanSyncNotQuitTips': return '同步完成前请勿退出此界面';
			case 'meta.deviceNoSpace': return '磁盘空间不足';
			case 'meta.hideSystemApp': return '隐藏系统应用';
			case 'meta.hideAppIcon': return '隐藏应用图标';
			case 'meta.openDir': return '打开文件目录';
			case 'meta.fileChoose': return '选择文件';
			case 'meta.filePathCannotEmpty': return '文件路径不能为空';
			case 'meta.fileNotExist': return ({required Object p}) => '文件不存在:${p}';
			case 'meta.fileTypeInvalid': return ({required Object p}) => '无效的文件类型:${p}';
			case 'meta.uwpExemption': return 'UWP网络隔离豁免';
			case 'meta.getProfile': return '获取配置';
			case 'meta.addProfile': return '添加配置';
			case 'meta.myProfiles': return '我的配置';
			case 'meta.profileEdit': return '编辑配置';
			case 'meta.profileEditReloadAfterProfileUpdate': return '配置更新后重新加载';
			case 'meta.profileImport': return '导入配置文件';
			case 'meta.profileAddUrlOrContent': return '添加配置链接';
			case 'meta.profileUrlOrContent': return '配置链接/内容';
			case 'meta.profileUrlOrContentHit': return 'Clash配置链接/内容[必填]';
			case 'meta.profileUrlOrContentCannotEmpty': return '配置链接不能为空';
			case 'permission.camera': return '摄像头';
			case 'permission.screen': return '屏幕录制';
			case 'permission.appQuery': return '获取应用列表';
			case 'permission.request': return ({required Object p}) => '开启[${p}]权限';
			case 'permission.requestNeed': return ({required Object p}) => '请开启[${p}]权限';
			case 'tls.insecure': return '跳过证书验证';
			case 'tls.certificate': return '证书';
			case 'tls.privateKey': return '私钥';
			case 'tls.customTrustCert': return '自定义证书';
			case 'tun.stack': return '网络栈';
			case 'tun.dnsHijack': return 'DNS劫持';
			case 'tun.strictRoute': return '严格路由';
			case 'tun.allowBypass': return '允许应用绕过VPN';
			case 'tun.appendHttpProxy': return '附加HTTP代理到VPN';
			case 'tun.bypassHttpProxyDomain': return '允许绕过HTTP代理的域名';
			case 'dns.fakeIp': return 'fake-ip';
			case 'dns.fallback': return 'Fallback';
			case 'dns.preferH3': return 'DoH H3优先';
			case 'dns.useHosts': return '使用Hosts';
			case 'dns.useSystemHosts': return '使用系统Hosts';
			case 'dns.enhancedMode': return '增强模式';
			case 'dns.fakeIPFilterMode': return '${_root.dns.fakeIp} 过滤模式';
			case 'dns.fakeIPFilter': return '${_root.dns.fakeIp} 过滤';
			case 'dns.nameServer': return '域名解析服务器';
			case 'dns.defaultNameServer': return '${_root.meta.byDefault} ${_root.dns.nameServer}';
			case 'dns.proxyNameServer': return '${_root.meta.proxy} ${_root.dns.nameServer}';
			case 'dns.directNameServer': return '${_root.meta.direct} ${_root.dns.nameServer}';
			case 'dns.fallbackNameServer': return '${_root.dns.fallback} ${_root.dns.nameServer}';
			case 'dns.fallbackGeoIp': return '${_root.dns.fallback} GeoIp';
			case 'dns.fallbackGeoIpCode': return '${_root.dns.fallback} GeoIpCode';
			case 'sniffer.overrideDest': return '覆盖';
			case 'profilePatchMode.currentSelected': return '当前选择';
			case 'profilePatchMode.overwrite': return '内置-覆写';
			case 'profilePatchMode.noOverwrite': return '内置-不覆写';
			case 'protocolSniff': return '协议探测';
			case 'protocolSniffOverrideDestination': return '探测的域名覆盖连接目标地址';
			case 'edgeRuntimeNotInstalled': return '当前设备尚未安装Edge WebView2运行时,无法展示页面,请下载安装Edge WebView2运行时(x64)后,重启App再试';
			case 'locales.en': return 'English';
			case 'locales.zh-CN': return '简体中文';
			case 'locales.ar': return 'عربي';
			case 'locales.ru': return 'Русский';
			case 'locales.fa': return 'فارسی';
			default: return null;
		}
	}
}

