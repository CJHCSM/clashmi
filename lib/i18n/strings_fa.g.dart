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
class TranslationsFa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFa _root = this; // ignore: unused_field

	@override 
	TranslationsFa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsBackupAndSyncWebdavScreenFa BackupAndSyncWebdavScreen = _TranslationsBackupAndSyncWebdavScreenFa._(_root);
	@override late final _TranslationsLaunchFailedScreenFa LaunchFailedScreen = _TranslationsLaunchFailedScreenFa._(_root);
	@override late final _TranslationsPerAppAndroidScreenFa PerAppAndroidScreen = _TranslationsPerAppAndroidScreenFa._(_root);
	@override late final _TranslationsUserAgreementScreenFa UserAgreementScreen = _TranslationsUserAgreementScreenFa._(_root);
	@override late final _TranslationsVersionUpdateScreenFa VersionUpdateScreen = _TranslationsVersionUpdateScreenFa._(_root);
	@override late final _TranslationsMainFa main = _TranslationsMainFa._(_root);
	@override late final _TranslationsMetaFa meta = _TranslationsMetaFa._(_root);
	@override late final _TranslationsPermissionFa permission = _TranslationsPermissionFa._(_root);
	@override late final _TranslationsTlsFa tls = _TranslationsTlsFa._(_root);
	@override late final _TranslationsTunFa tun = _TranslationsTunFa._(_root);
	@override late final _TranslationsDnsFa dns = _TranslationsDnsFa._(_root);
	@override late final _TranslationsSnifferFa sniffer = _TranslationsSnifferFa._(_root);
	@override late final _TranslationsProfilePatchModeFa profilePatchMode = _TranslationsProfilePatchModeFa._(_root);
	@override String get protocolSniff => 'تشخیص پروتکل';
	@override String get protocolSniffOverrideDestination => 'نام دامنه شناسایی شده آدرس هدف اتصال را پوشش می دهد';
	@override String get edgeRuntimeNotInstalled => 'زمان اجرا Edge WebView2 روی دستگاه فعلی نصب نشده است و صفحه قابل نمایش نیست لطفاً زمان اجرا Edge WebView2 (x64) را بارگیری و نصب کنید، برنامه را مجدداً راه اندازی کنید و دوباره امتحان کنید.';
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: BackupAndSyncWebdavScreen
class _TranslationsBackupAndSyncWebdavScreenFa implements TranslationsBackupAndSyncWebdavScreenEn {
	_TranslationsBackupAndSyncWebdavScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get webdavServerUrl => 'آدرس URL سرور';
	@override String get webdavRequired => 'نمی‌تواند خالی باشد';
	@override String get webdavLoginFailed => 'ورود ناموفق بود:';
	@override String get webdavListFailed => 'دریافت لیست فایل ناموفق بود:';
}

// Path: LaunchFailedScreen
class _TranslationsLaunchFailedScreenFa implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'اجرای نرم‌افزار ناموفق بود [نام‌ اجرایی پروسه نامعتبر]، لطفا مجدد نرم‌افزار را در دایرکتوری دیگری نصب کنید';
	@override String get invalidProfile => 'اجرای نرم‌افزار ناموفق بود [دسترسی به پروفایل ناموفق بود]، لطفا مجدد نرم افزار را نصب کنید';
	@override String get invalidVersion => 'اجرای نرم‌افزار ناموفق بود [ورژن نامعتبر]، لطفا مجدد نرم‌افزار را نصب کنید';
	@override String get systemVersionLow => 'راه اندازی برنامه ناموفق بود [نسخه سیستم خیلی کم است]';
	@override String get invalidInstallPath => 'مسیر نصب نامعتبر است، لطفا مجدد در مسیر معتبر نصب کنید';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenFa implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروکسی به‌تفکیک برنامه';
	@override String get whiteListMode => 'حالت لیست سفید';
	@override String get whiteListModeTip => 'وقتی فعال باشد: فقط برنامه‌هایی که انتخاب شده‌اند پروکسی می‌شوند؛ وقتی فعال نباشد: فقط برنامه‌هایی که انتخاب نشده‌اند پروکسی می‌شوند';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenFa implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => 'حریم‌خصوصی شما اولویت دارد';
	@override String get agreeAndContinue => 'پذیرفتن و ادامه';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenFa implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => 'نسخه جدید [${p}] آماده است';
	@override String get update => 'راه‌اندازی مجدد برای به‌روزرسانی';
	@override String get cancel => 'الان‌ نه';
}

// Path: main
class _TranslationsMainFa implements TranslationsMainEn {
	_TranslationsMainFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayFa tray = _TranslationsMainTrayFa._(_root);
}

// Path: meta
class _TranslationsMetaFa implements TranslationsMetaEn {
	_TranslationsMetaFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get enable => 'فعال‌سازی';
	@override String get disable => 'غیرفعال';
	@override String get open => 'باز کن';
	@override String get close => 'بسته';
	@override String get quit => 'خروج';
	@override String get add => 'افزودن';
	@override String get addSuccess => 'با‌موفقیت اضافه شد';
	@override String addFailed({required Object p}) => 'افزودن ناموفق بود:${p}';
	@override String get remove => 'حذف';
	@override String get removeConfirm => 'آیا از حذف اطمینان دارین؟';
	@override String get edit => 'ویرایش کنید';
	@override String get view => 'بررسی';
	@override String get remark => 'ملاحضات';
	@override String get byDefault => 'پیش‌فرض';
	@override String get editRemark => 'یادداشت های اصلاحی';
	@override String get more => 'بیشتر';
	@override String get tips => 'اطلاعات';
	@override String get copy => 'کپی';
	@override String get save => 'ذخیره کنید';
	@override String get ok => 'خُب';
	@override String get cancel => 'لغو';
	@override String get faq => 'سوالات متداول';
	@override String get download => 'دانلود';
	@override String get loading => 'درحال بارگذاری…';
	@override String get days => 'روز';
	@override String get hours => 'ساعت';
	@override String get minutes => 'دقیقه';
	@override String get seconds => 'دومین';
	@override String get protocol => 'پروتکل';
	@override String get search => 'جستجو';
	@override String get custom => 'سفارشی';
	@override String get connect => 'اتصال';
	@override String get disconnect => 'قطع‌ اتصال';
	@override String get connected => 'وصل شد';
	@override String get disconnected => 'قطع شد';
	@override String get connecting => 'درحال اتصال';
	@override String get connectTimeout => 'اتمام مهلت اتصال';
	@override String get timeout => 'تایم اوت';
	@override String get timeoutDuration => 'مدت زمان وقفه';
	@override String get latency => 'تاخیر';
	@override String get latencyTest => 'بررسی تاخیر';
	@override String get language => 'زبان';
	@override String get next => 'بعدی';
	@override String get done => 'انجام‌شد';
	@override String get apply => 'درخواست دادن';
	@override String get refresh => 'بارگذاری مجدد';
	@override String get retry => 'دوباره امتحان کنید؟';
	@override String get update => 'تجدید';
	@override String get updateInterval => 'فاصله‌ی به‌روزرسانی';
	@override String get updateInterval5mTips => 'حداقل: 5 متر';
	@override String updateFailed({required Object p}) => 'به‌روزرسانی ناموفق بود:${p}';
	@override String get none => 'هیچ‌کدام';
	@override String get reset => 'ریست';
	@override String get authentication => 'مجوز';
	@override String get submit => 'ارسال';
	@override String get user => 'کاربر';
	@override String get account => 'نام‌کاربری';
	@override String get password => 'رمز‌عبور';
	@override String get required => 'الزامی';
	@override String get other => 'دیگر';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'URL نامعتبر';
	@override String get urlCannotEmpty => 'لینک نمی‌تواند خالی باشد';
	@override String get urlTooLong => 'URL خیلی طولانی است (>8182)';
	@override String get copyUrl => 'کپی‌کردن لینک';
	@override String get openUrl => 'بازکردن لینک';
	@override String get shareUrl => 'اشتراک لینک';
	@override String get coreSettingTips => 'توجه: پس از تغییر پیکربندی، باید دوباره وصل شوید تا اعمال شود';
	@override String get overwrite => 'لغو';
	@override String get overwriteCustom => 'لغوهای سفارشی';
	@override String get overwriteTips => 'پیکربندی اصلی <- لغو سفارشی <- لغو برنامه';
	@override String get noOverwrite => 'رونویسی نکنید';
	@override String get overwriteSettings => 'لغو تنظیمات';
	@override String get externalController => 'کنترل خارجی';
	@override String get secret => 'Secret';
	@override String get tcpConcurrent => 'دست دادن همزمان TCP';
	@override String get globalClientFingerprint => 'اثر انگشت جهانی TLS';
	@override String get allowLanAccess => 'دسترسی به دستگاه LAN';
	@override String get mixedPort => 'پورت پروکسی هیبریدی';
	@override String get logLevel => 'سطح ورود به سیستم';
	@override String get tcpkeepAliveInterval => 'فاصله حفظ زنده TCP';
	@override String get delayTestUrl => 'URL تست تأخیر';
	@override String get delayTestTimeout => 'مهلت زمانی تست تاخیری (میلی‌ثانیه)';
	@override String get tun => 'TUN';
	@override String get ntp => 'NTP';
	@override String get tls => 'TLS';
	@override String get geo => 'GEO';
	@override String get geoDownloadByProxy => 'دانلود Geo RuleSet با استفاده از یک پروکسی';
	@override String get geoRulesetTips => 'Geosite/Geoip/Asn به RuleSet مربوطه تبدیل می شود';
	@override String get sniffer => 'بو کشیدن';
	@override String get userAgent => 'UserAgent';
	@override String get launchAtStartup => 'اجرا در راه‌اندازی';
	@override String get launchAtStartupRunAsAdmin => 'لطفاً Clash Mi را به عنوان مدیر راه اندازی مجدد کنید';
	@override String get portableMode => 'حالت قابل‌حمل';
	@override String get portableModeDisableTips => 'اگر نیاز دارین از حالت قابل‌حمل خارج شوید لطفا از [clashmi] خارج شده و به‌صورت دستی پوشه [portable] هم مسیر با فایل [clashmi.exe] را حذف کنید';
	@override String get systemProxy => 'پروکسی سیستم';
	@override String get autoConnectAfterLaunch => 'اتصال خودکار پس‌از راه‌اندازی';
	@override String get hideAfterLaunch => 'پنهان کردن پنجره پس از راه اندازی';
	@override String get autoSetSystemProxy => 'تنظیم خودکار حالت پروکسی سیستم پس‌از اتصال';
	@override String get bypassSystemProxy => 'نام های دامنه ای که مجاز به دور زدن پراکسی سیستم هستند';
	@override String get website => 'وبسایت';
	@override String get rule => 'قانون';
	@override String get global => 'عمومی';
	@override String get direct => 'مستقیم';
	@override String get block => 'مسدود';
	@override String get qrcode => 'کد QR';
	@override String get qrcodeTooLong => 'متن برای نمایش خیلی طولانی است';
	@override String get qrcodeShare => 'اشتراک کدQR';
	@override String get textToQrcode => 'متن به کد QR';
	@override String get qrcodeScan => 'اسکن QRکد';
	@override String get qrcodeScanResult => 'نتایج اسکن';
	@override String get qrcodeScanFromImage => 'اسکن از عکس';
	@override String get qrcodeScanResultFailed => 'تجزیه عکس ناموفق بود، لطفا مطمعن شوید اسکرین‌شات یک کدQR معتبر است';
	@override String get qrcodeScanResultEmpty => 'نتیجه اسکن خالی است';
	@override String get screenshot => 'اسکرین‌شات';
	@override String get backupAndSync => 'پشتیبان‌گیری و همگام‌سازی';
	@override String get importSuccess => 'افزودن موفق بود';
	@override String get rewriteConfirm => 'این فایل کانفیگ‌های محلی موجود را بازنویسی می‌کند. آیا می‌خواهید ادامه بدین؟';
	@override String get importAndExport => 'وارد‌کردن و خروجی‌گرفتن';
	@override String get import => 'وارد‌کردن';
	@override String get importFromUrl => 'وارد کردن از URL';
	@override String get export => 'خروجی‌گرفتن';
	@override String get send => 'ارسال کنید';
	@override String get receive => 'تصاحب';
	@override String get sendConfirm => 'ارسال را تایید کرد؟';
	@override String get termOfUse => 'شرایط استفاده';
	@override String get privacyPolicy => 'سیاست حریم خصوصی';
	@override String get log => 'ورود به سیستم';
	@override String get coreLog => 'گزارش هسته';
	@override String get core => 'هسته';
	@override String get help => 'کمک کند';
	@override String get tutorial => 'آموزش';
	@override String get board => 'پانل';
	@override String get boardOnline => 'با استفاده از پنل آنلاین';
	@override String get boardOnlineUrl => 'آدرس پنل آنلاین';
	@override String get boardLocalPort => 'پورت پانل محلی';
	@override String get disableFontScaler => 'غیرفعال‌سازی مقیاس‌بندی فونت(با راه‌اندازی مجدد اعمال می‌شود)';
	@override String get autoOrientation => 'چرخش صفحه را دنبال کنید';
	@override String get restartTakesEffect => 'با راه‌اندازی مجدد اعمال می‌شود';
	@override String get runtimeProfile => 'پیکربندی زمان اجرا';
	@override String get willCompleteAfterRebootInstall => 'لطفاً دستگاه خود را مجدداً راه اندازی کنید تا نصب افزونه سیستم تکمیل شود.';
	@override String get willCompleteAfterRebootUninstall => 'لطفاً دستگاه خود را مجدداً راه‌اندازی کنید تا حذف نصب افزونه سیستم تکمیل شود';
	@override String get requestNeedsUserApproval => 'لطفاً به کلش می اجازه دهید افزونه‌های سیستمی را در [تنظیمات سیستم]-[حریم خصوصی و امنیت] نصب کند و پس از اتمام نصب، دوباره متصل شوید.';
	@override String get FullDiskAccessPermissionRequired => 'لطفاً مجوز clashmiServiceSE را در [تنظیمات سیستم]-[حریم خصوصی و امنیت]-[دسترسی کامل به دیسک] فعال کنید و دوباره متصل شوید.';
	@override String get proxy => 'بازیگری';
	@override String get theme => 'موضوع';
	@override String get tvMode => 'حالت تلویزیون';
	@override String get autoUpdate => 'به روز رسانی خودکار';
	@override String get updateChannel => 'کانال به‌روزرسانی خودکار';
	@override String hasNewVersion({required Object p}) => 'به‌روزرسانی نسخه ${p} ';
	@override String get devOptions => 'تنظیمات توسعه‌دهندگان';
	@override String get about => 'درباره';
	@override String get name => 'نام';
	@override String get version => 'نسخه';
	@override String get notice => 'اطلاعیه';
	@override String get sort => 'مرتب‌سازی';
	@override String get recommended => 'پیشنهادی';
	@override String innerError({required Object p}) => 'خطای داخلی: ${p}';
	@override String get share => 'اشتراک گذاری';
	@override String get importFromClipboard => 'افزودن از کلیپ‌برد';
	@override String get exportToClipboard => 'صادرات به کلیپ بورد';
	@override String get server => 'سرور';
	@override String get port => 'بندر';
	@override String get donate => 'اهدا کنید';
	@override String get setting => 'تنظیمات';
	@override String get settingCore => 'تنظیمات اصلی';
	@override String get settingApp => 'تنظیمات برنامه';
	@override String get coreOverwrite => 'Core Override';
	@override String get iCloud => 'iCloud';
	@override String get webdav => 'Webdav';
	@override String get lanSync => 'LAN Sync';
	@override String get lanSyncNotQuitTips => 'قبل از تکمیل همگام‌سازی از این قسمت خارج نشوید';
	@override String get deviceNoSpace => 'فضای خالی کافی ندارید';
	@override String get hideSystemApp => 'برنامه های سیستم را مخفی کنید';
	@override String get hideAppIcon => 'پنهان کردن نماد برنامه';
	@override String get openDir => 'بازکردن دایرکتوری فایل';
	@override String get fileChoose => 'انتخاب فایل';
	@override String get filePathCannotEmpty => 'مسیر فایل نمی‌تواند خالی باشد';
	@override String fileNotExist({required Object p}) => 'فایل وجود ندارد:${p}';
	@override String fileTypeInvalid({required Object p}) => 'نوع فایل نامعتبر:${p}';
	@override String get uwpExemption => 'معافیت جداسازی شبکه UWP';
	@override String get getProfile => 'پیکربندی را دریافت کنید';
	@override String get addProfile => 'افزودن پروفایل';
	@override String get myProfiles => 'پروفایل‌ها';
	@override String get profileEdit => 'ویرایش پروفایل';
	@override String get profileEditReloadAfterProfileUpdate => 'بارگذاری مجدد پس‌از به‌روزرسانی پروفایل';
	@override String get profileImport => 'وارد‌کردن فایل پروفایل';
	@override String get profileAddUrlOrContent => 'افزودن لینک پروفایل';
	@override String get profileUrlOrContent => 'لینک/محتوای پروفایل';
	@override String get profileUrlOrContentHit => 'لینک/محتوای پروفایل [الزامی] (پشتیبانی از کلش، V2ray(پشتیبانی به‌صورت دسته‌ای)، لینک‌های پروفایل فرعی)، استش، کارینگ، سینگ‌باکس، شدوساکس، لینک‌های پروفایل فرعی)';
	@override String get profileUrlOrContentCannotEmpty => 'لینک پروفایل نمی‌تواند خالی باشد';
}

// Path: permission
class _TranslationsPermissionFa implements TranslationsPermissionEn {
	_TranslationsPermissionFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get camera => 'دوربین';
	@override String get screen => 'ضبط صفحه';
	@override String get appQuery => 'Get Application List';
	@override String request({required Object p}) => 'مجوزهای [${p}] را فعال کنید';
	@override String requestNeed({required Object p}) => 'لطفاً مجوز [${p}] را فعال کنید';
}

// Path: tls
class _TranslationsTlsFa implements TranslationsTlsEn {
	_TranslationsTlsFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get insecure => 'رد شدن از تأیید گواهی';
	@override String get certificate => 'گواهی';
	@override String get privateKey => 'کلید خصوصی';
	@override String get customTrustCert => 'گواهی های سفارشی';
}

// Path: tun
class _TranslationsTunFa implements TranslationsTunEn {
	_TranslationsTunFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get stack => 'پشته شبکه';
	@override String get dnsHijack => 'ربودن DNS';
	@override String get strictRoute => 'مسیریابی دقیق';
	@override String get allowBypass => 'به برنامه‌ها اجازه دهید VPN را دور بزنند';
	@override String get appendHttpProxy => 'پیوست دادن پروکسی HTTP به وی‌پی‌ان';
	@override String get bypassHttpProxyDomain => 'دامنه ها مجاز به دور زدن پروکسی HTTP هستند';
}

// Path: dns
class _TranslationsDnsFa implements TranslationsDnsEn {
	_TranslationsDnsFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get fakeIp => 'fake-ip';
	@override String get fallback => 'Fallback';
	@override String get preferH3 => 'اولویت DoH H3';
	@override String get useHosts => 'استفاده از هاست ها';
	@override String get useSystemHosts => 'استفاده از هاست های سیستم';
	@override String get enhancedMode => 'حالت پیشرفته';
	@override String get fakeIPFilterMode => 'حالت فیلتر ${_root.dns.fakeIp}';
	@override String get fakeIPFilter => 'فیلتر ${_root.dns.fakeIp}';
	@override String get nameServer => 'سرور DNS';
	@override String get defaultNameServer => '${_root.meta.byDefault} ${_root.dns.nameServer}';
	@override String get proxyNameServer => '${_root.meta.proxy} ${_root.dns.nameServer}';
	@override String get directNameServer => '${_root.meta.direct} ${_root.dns.nameServer}';
	@override String get fallbackNameServer => '${_root.dns.fallback} ${_root.dns.nameServer}';
	@override String get fallbackGeoIp => '${_root.dns.fallback} GeoIp';
	@override String get fallbackGeoIpCode => '${_root.dns.fallback} GeoIpCode';
}

// Path: sniffer
class _TranslationsSnifferFa implements TranslationsSnifferEn {
	_TranslationsSnifferFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get overrideDest => 'پوشش';
}

// Path: profilePatchMode
class _TranslationsProfilePatchModeFa implements TranslationsProfilePatchModeEn {
	_TranslationsProfilePatchModeFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get currentSelected => 'فعلی انتخاب شده';
	@override String get overwrite => 'Overwrite داخلی';
	@override String get noOverwrite => 'داخلی - رونویسی نشده است';
}

// Path: main.tray
class _TranslationsMainTrayFa implements TranslationsMainTrayEn {
	_TranslationsMainTrayFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '    بازکردن    ';
	@override String get menuExit => '    بستن    ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'BackupAndSyncWebdavScreen.webdavServerUrl': return 'آدرس URL سرور';
			case 'BackupAndSyncWebdavScreen.webdavRequired': return 'نمی‌تواند خالی باشد';
			case 'BackupAndSyncWebdavScreen.webdavLoginFailed': return 'ورود ناموفق بود:';
			case 'BackupAndSyncWebdavScreen.webdavListFailed': return 'دریافت لیست فایل ناموفق بود:';
			case 'LaunchFailedScreen.invalidProcess': return 'اجرای نرم‌افزار ناموفق بود [نام‌ اجرایی پروسه نامعتبر]، لطفا مجدد نرم‌افزار را در دایرکتوری دیگری نصب کنید';
			case 'LaunchFailedScreen.invalidProfile': return 'اجرای نرم‌افزار ناموفق بود [دسترسی به پروفایل ناموفق بود]، لطفا مجدد نرم افزار را نصب کنید';
			case 'LaunchFailedScreen.invalidVersion': return 'اجرای نرم‌افزار ناموفق بود [ورژن نامعتبر]، لطفا مجدد نرم‌افزار را نصب کنید';
			case 'LaunchFailedScreen.systemVersionLow': return 'راه اندازی برنامه ناموفق بود [نسخه سیستم خیلی کم است]';
			case 'LaunchFailedScreen.invalidInstallPath': return 'مسیر نصب نامعتبر است، لطفا مجدد در مسیر معتبر نصب کنید';
			case 'PerAppAndroidScreen.title': return 'پروکسی به‌تفکیک برنامه';
			case 'PerAppAndroidScreen.whiteListMode': return 'حالت لیست سفید';
			case 'PerAppAndroidScreen.whiteListModeTip': return 'وقتی فعال باشد: فقط برنامه‌هایی که انتخاب شده‌اند پروکسی می‌شوند؛ وقتی فعال نباشد: فقط برنامه‌هایی که انتخاب نشده‌اند پروکسی می‌شوند';
			case 'UserAgreementScreen.privacyFirst': return 'حریم‌خصوصی شما اولویت دارد';
			case 'UserAgreementScreen.agreeAndContinue': return 'پذیرفتن و ادامه';
			case 'VersionUpdateScreen.versionReady': return ({required Object p}) => 'نسخه جدید [${p}] آماده است';
			case 'VersionUpdateScreen.update': return 'راه‌اندازی مجدد برای به‌روزرسانی';
			case 'VersionUpdateScreen.cancel': return 'الان‌ نه';
			case 'main.tray.menuOpen': return '    بازکردن    ';
			case 'main.tray.menuExit': return '    بستن    ';
			case 'meta.enable': return 'فعال‌سازی';
			case 'meta.disable': return 'غیرفعال';
			case 'meta.open': return 'باز کن';
			case 'meta.close': return 'بسته';
			case 'meta.quit': return 'خروج';
			case 'meta.add': return 'افزودن';
			case 'meta.addSuccess': return 'با‌موفقیت اضافه شد';
			case 'meta.addFailed': return ({required Object p}) => 'افزودن ناموفق بود:${p}';
			case 'meta.remove': return 'حذف';
			case 'meta.removeConfirm': return 'آیا از حذف اطمینان دارین؟';
			case 'meta.edit': return 'ویرایش کنید';
			case 'meta.view': return 'بررسی';
			case 'meta.remark': return 'ملاحضات';
			case 'meta.byDefault': return 'پیش‌فرض';
			case 'meta.editRemark': return 'یادداشت های اصلاحی';
			case 'meta.more': return 'بیشتر';
			case 'meta.tips': return 'اطلاعات';
			case 'meta.copy': return 'کپی';
			case 'meta.save': return 'ذخیره کنید';
			case 'meta.ok': return 'خُب';
			case 'meta.cancel': return 'لغو';
			case 'meta.faq': return 'سوالات متداول';
			case 'meta.download': return 'دانلود';
			case 'meta.loading': return 'درحال بارگذاری…';
			case 'meta.days': return 'روز';
			case 'meta.hours': return 'ساعت';
			case 'meta.minutes': return 'دقیقه';
			case 'meta.seconds': return 'دومین';
			case 'meta.protocol': return 'پروتکل';
			case 'meta.search': return 'جستجو';
			case 'meta.custom': return 'سفارشی';
			case 'meta.connect': return 'اتصال';
			case 'meta.disconnect': return 'قطع‌ اتصال';
			case 'meta.connected': return 'وصل شد';
			case 'meta.disconnected': return 'قطع شد';
			case 'meta.connecting': return 'درحال اتصال';
			case 'meta.connectTimeout': return 'اتمام مهلت اتصال';
			case 'meta.timeout': return 'تایم اوت';
			case 'meta.timeoutDuration': return 'مدت زمان وقفه';
			case 'meta.latency': return 'تاخیر';
			case 'meta.latencyTest': return 'بررسی تاخیر';
			case 'meta.language': return 'زبان';
			case 'meta.next': return 'بعدی';
			case 'meta.done': return 'انجام‌شد';
			case 'meta.apply': return 'درخواست دادن';
			case 'meta.refresh': return 'بارگذاری مجدد';
			case 'meta.retry': return 'دوباره امتحان کنید؟';
			case 'meta.update': return 'تجدید';
			case 'meta.updateInterval': return 'فاصله‌ی به‌روزرسانی';
			case 'meta.updateInterval5mTips': return 'حداقل: 5 متر';
			case 'meta.updateFailed': return ({required Object p}) => 'به‌روزرسانی ناموفق بود:${p}';
			case 'meta.none': return 'هیچ‌کدام';
			case 'meta.reset': return 'ریست';
			case 'meta.authentication': return 'مجوز';
			case 'meta.submit': return 'ارسال';
			case 'meta.user': return 'کاربر';
			case 'meta.account': return 'نام‌کاربری';
			case 'meta.password': return 'رمز‌عبور';
			case 'meta.required': return 'الزامی';
			case 'meta.other': return 'دیگر';
			case 'meta.dns': return 'DNS';
			case 'meta.url': return 'URL';
			case 'meta.urlInvalid': return 'URL نامعتبر';
			case 'meta.urlCannotEmpty': return 'لینک نمی‌تواند خالی باشد';
			case 'meta.urlTooLong': return 'URL خیلی طولانی است (>8182)';
			case 'meta.copyUrl': return 'کپی‌کردن لینک';
			case 'meta.openUrl': return 'بازکردن لینک';
			case 'meta.shareUrl': return 'اشتراک لینک';
			case 'meta.coreSettingTips': return 'توجه: پس از تغییر پیکربندی، باید دوباره وصل شوید تا اعمال شود';
			case 'meta.overwrite': return 'لغو';
			case 'meta.overwriteCustom': return 'لغوهای سفارشی';
			case 'meta.overwriteTips': return 'پیکربندی اصلی <- لغو سفارشی <- لغو برنامه';
			case 'meta.noOverwrite': return 'رونویسی نکنید';
			case 'meta.overwriteSettings': return 'لغو تنظیمات';
			case 'meta.externalController': return 'کنترل خارجی';
			case 'meta.secret': return 'Secret';
			case 'meta.tcpConcurrent': return 'دست دادن همزمان TCP';
			case 'meta.globalClientFingerprint': return 'اثر انگشت جهانی TLS';
			case 'meta.allowLanAccess': return 'دسترسی به دستگاه LAN';
			case 'meta.mixedPort': return 'پورت پروکسی هیبریدی';
			case 'meta.logLevel': return 'سطح ورود به سیستم';
			case 'meta.tcpkeepAliveInterval': return 'فاصله حفظ زنده TCP';
			case 'meta.delayTestUrl': return 'URL تست تأخیر';
			case 'meta.delayTestTimeout': return 'مهلت زمانی تست تاخیری (میلی‌ثانیه)';
			case 'meta.tun': return 'TUN';
			case 'meta.ntp': return 'NTP';
			case 'meta.tls': return 'TLS';
			case 'meta.geo': return 'GEO';
			case 'meta.geoDownloadByProxy': return 'دانلود Geo RuleSet با استفاده از یک پروکسی';
			case 'meta.geoRulesetTips': return 'Geosite/Geoip/Asn به RuleSet مربوطه تبدیل می شود';
			case 'meta.sniffer': return 'بو کشیدن';
			case 'meta.userAgent': return 'UserAgent';
			case 'meta.launchAtStartup': return 'اجرا در راه‌اندازی';
			case 'meta.launchAtStartupRunAsAdmin': return 'لطفاً Clash Mi را به عنوان مدیر راه اندازی مجدد کنید';
			case 'meta.portableMode': return 'حالت قابل‌حمل';
			case 'meta.portableModeDisableTips': return 'اگر نیاز دارین از حالت قابل‌حمل خارج شوید لطفا از [clashmi] خارج شده و به‌صورت دستی پوشه [portable] هم مسیر با فایل [clashmi.exe] را حذف کنید';
			case 'meta.systemProxy': return 'پروکسی سیستم';
			case 'meta.autoConnectAfterLaunch': return 'اتصال خودکار پس‌از راه‌اندازی';
			case 'meta.hideAfterLaunch': return 'پنهان کردن پنجره پس از راه اندازی';
			case 'meta.autoSetSystemProxy': return 'تنظیم خودکار حالت پروکسی سیستم پس‌از اتصال';
			case 'meta.bypassSystemProxy': return 'نام های دامنه ای که مجاز به دور زدن پراکسی سیستم هستند';
			case 'meta.website': return 'وبسایت';
			case 'meta.rule': return 'قانون';
			case 'meta.global': return 'عمومی';
			case 'meta.direct': return 'مستقیم';
			case 'meta.block': return 'مسدود';
			case 'meta.qrcode': return 'کد QR';
			case 'meta.qrcodeTooLong': return 'متن برای نمایش خیلی طولانی است';
			case 'meta.qrcodeShare': return 'اشتراک کدQR';
			case 'meta.textToQrcode': return 'متن به کد QR';
			case 'meta.qrcodeScan': return 'اسکن QRکد';
			case 'meta.qrcodeScanResult': return 'نتایج اسکن';
			case 'meta.qrcodeScanFromImage': return 'اسکن از عکس';
			case 'meta.qrcodeScanResultFailed': return 'تجزیه عکس ناموفق بود، لطفا مطمعن شوید اسکرین‌شات یک کدQR معتبر است';
			case 'meta.qrcodeScanResultEmpty': return 'نتیجه اسکن خالی است';
			case 'meta.screenshot': return 'اسکرین‌شات';
			case 'meta.backupAndSync': return 'پشتیبان‌گیری و همگام‌سازی';
			case 'meta.importSuccess': return 'افزودن موفق بود';
			case 'meta.rewriteConfirm': return 'این فایل کانفیگ‌های محلی موجود را بازنویسی می‌کند. آیا می‌خواهید ادامه بدین؟';
			case 'meta.importAndExport': return 'وارد‌کردن و خروجی‌گرفتن';
			case 'meta.import': return 'وارد‌کردن';
			case 'meta.importFromUrl': return 'وارد کردن از URL';
			case 'meta.export': return 'خروجی‌گرفتن';
			case 'meta.send': return 'ارسال کنید';
			case 'meta.receive': return 'تصاحب';
			case 'meta.sendConfirm': return 'ارسال را تایید کرد؟';
			case 'meta.termOfUse': return 'شرایط استفاده';
			case 'meta.privacyPolicy': return 'سیاست حریم خصوصی';
			case 'meta.log': return 'ورود به سیستم';
			case 'meta.coreLog': return 'گزارش هسته';
			case 'meta.core': return 'هسته';
			case 'meta.help': return 'کمک کند';
			case 'meta.tutorial': return 'آموزش';
			case 'meta.board': return 'پانل';
			case 'meta.boardOnline': return 'با استفاده از پنل آنلاین';
			case 'meta.boardOnlineUrl': return 'آدرس پنل آنلاین';
			case 'meta.boardLocalPort': return 'پورت پانل محلی';
			case 'meta.disableFontScaler': return 'غیرفعال‌سازی مقیاس‌بندی فونت(با راه‌اندازی مجدد اعمال می‌شود)';
			case 'meta.autoOrientation': return 'چرخش صفحه را دنبال کنید';
			case 'meta.restartTakesEffect': return 'با راه‌اندازی مجدد اعمال می‌شود';
			case 'meta.runtimeProfile': return 'پیکربندی زمان اجرا';
			case 'meta.willCompleteAfterRebootInstall': return 'لطفاً دستگاه خود را مجدداً راه اندازی کنید تا نصب افزونه سیستم تکمیل شود.';
			case 'meta.willCompleteAfterRebootUninstall': return 'لطفاً دستگاه خود را مجدداً راه‌اندازی کنید تا حذف نصب افزونه سیستم تکمیل شود';
			case 'meta.requestNeedsUserApproval': return 'لطفاً به کلش می اجازه دهید افزونه‌های سیستمی را در [تنظیمات سیستم]-[حریم خصوصی و امنیت] نصب کند و پس از اتمام نصب، دوباره متصل شوید.';
			case 'meta.FullDiskAccessPermissionRequired': return 'لطفاً مجوز clashmiServiceSE را در [تنظیمات سیستم]-[حریم خصوصی و امنیت]-[دسترسی کامل به دیسک] فعال کنید و دوباره متصل شوید.';
			case 'meta.proxy': return 'بازیگری';
			case 'meta.theme': return 'موضوع';
			case 'meta.tvMode': return 'حالت تلویزیون';
			case 'meta.autoUpdate': return 'به روز رسانی خودکار';
			case 'meta.updateChannel': return 'کانال به‌روزرسانی خودکار';
			case 'meta.hasNewVersion': return ({required Object p}) => 'به‌روزرسانی نسخه ${p} ';
			case 'meta.devOptions': return 'تنظیمات توسعه‌دهندگان';
			case 'meta.about': return 'درباره';
			case 'meta.name': return 'نام';
			case 'meta.version': return 'نسخه';
			case 'meta.notice': return 'اطلاعیه';
			case 'meta.sort': return 'مرتب‌سازی';
			case 'meta.recommended': return 'پیشنهادی';
			case 'meta.innerError': return ({required Object p}) => 'خطای داخلی: ${p}';
			case 'meta.share': return 'اشتراک گذاری';
			case 'meta.importFromClipboard': return 'افزودن از کلیپ‌برد';
			case 'meta.exportToClipboard': return 'صادرات به کلیپ بورد';
			case 'meta.server': return 'سرور';
			case 'meta.port': return 'بندر';
			case 'meta.donate': return 'اهدا کنید';
			case 'meta.setting': return 'تنظیمات';
			case 'meta.settingCore': return 'تنظیمات اصلی';
			case 'meta.settingApp': return 'تنظیمات برنامه';
			case 'meta.coreOverwrite': return 'Core Override';
			case 'meta.iCloud': return 'iCloud';
			case 'meta.webdav': return 'Webdav';
			case 'meta.lanSync': return 'LAN Sync';
			case 'meta.lanSyncNotQuitTips': return 'قبل از تکمیل همگام‌سازی از این قسمت خارج نشوید';
			case 'meta.deviceNoSpace': return 'فضای خالی کافی ندارید';
			case 'meta.hideSystemApp': return 'برنامه های سیستم را مخفی کنید';
			case 'meta.hideAppIcon': return 'پنهان کردن نماد برنامه';
			case 'meta.openDir': return 'بازکردن دایرکتوری فایل';
			case 'meta.fileChoose': return 'انتخاب فایل';
			case 'meta.filePathCannotEmpty': return 'مسیر فایل نمی‌تواند خالی باشد';
			case 'meta.fileNotExist': return ({required Object p}) => 'فایل وجود ندارد:${p}';
			case 'meta.fileTypeInvalid': return ({required Object p}) => 'نوع فایل نامعتبر:${p}';
			case 'meta.uwpExemption': return 'معافیت جداسازی شبکه UWP';
			case 'meta.getProfile': return 'پیکربندی را دریافت کنید';
			case 'meta.addProfile': return 'افزودن پروفایل';
			case 'meta.myProfiles': return 'پروفایل‌ها';
			case 'meta.profileEdit': return 'ویرایش پروفایل';
			case 'meta.profileEditReloadAfterProfileUpdate': return 'بارگذاری مجدد پس‌از به‌روزرسانی پروفایل';
			case 'meta.profileImport': return 'وارد‌کردن فایل پروفایل';
			case 'meta.profileAddUrlOrContent': return 'افزودن لینک پروفایل';
			case 'meta.profileUrlOrContent': return 'لینک/محتوای پروفایل';
			case 'meta.profileUrlOrContentHit': return 'لینک/محتوای پروفایل [الزامی] (پشتیبانی از کلش، V2ray(پشتیبانی به‌صورت دسته‌ای)، لینک‌های پروفایل فرعی)، استش، کارینگ، سینگ‌باکس، شدوساکس، لینک‌های پروفایل فرعی)';
			case 'meta.profileUrlOrContentCannotEmpty': return 'لینک پروفایل نمی‌تواند خالی باشد';
			case 'permission.camera': return 'دوربین';
			case 'permission.screen': return 'ضبط صفحه';
			case 'permission.appQuery': return 'Get Application List';
			case 'permission.request': return ({required Object p}) => 'مجوزهای [${p}] را فعال کنید';
			case 'permission.requestNeed': return ({required Object p}) => 'لطفاً مجوز [${p}] را فعال کنید';
			case 'tls.insecure': return 'رد شدن از تأیید گواهی';
			case 'tls.certificate': return 'گواهی';
			case 'tls.privateKey': return 'کلید خصوصی';
			case 'tls.customTrustCert': return 'گواهی های سفارشی';
			case 'tun.stack': return 'پشته شبکه';
			case 'tun.dnsHijack': return 'ربودن DNS';
			case 'tun.strictRoute': return 'مسیریابی دقیق';
			case 'tun.allowBypass': return 'به برنامه‌ها اجازه دهید VPN را دور بزنند';
			case 'tun.appendHttpProxy': return 'پیوست دادن پروکسی HTTP به وی‌پی‌ان';
			case 'tun.bypassHttpProxyDomain': return 'دامنه ها مجاز به دور زدن پروکسی HTTP هستند';
			case 'dns.fakeIp': return 'fake-ip';
			case 'dns.fallback': return 'Fallback';
			case 'dns.preferH3': return 'اولویت DoH H3';
			case 'dns.useHosts': return 'استفاده از هاست ها';
			case 'dns.useSystemHosts': return 'استفاده از هاست های سیستم';
			case 'dns.enhancedMode': return 'حالت پیشرفته';
			case 'dns.fakeIPFilterMode': return 'حالت فیلتر ${_root.dns.fakeIp}';
			case 'dns.fakeIPFilter': return 'فیلتر ${_root.dns.fakeIp}';
			case 'dns.nameServer': return 'سرور DNS';
			case 'dns.defaultNameServer': return '${_root.meta.byDefault} ${_root.dns.nameServer}';
			case 'dns.proxyNameServer': return '${_root.meta.proxy} ${_root.dns.nameServer}';
			case 'dns.directNameServer': return '${_root.meta.direct} ${_root.dns.nameServer}';
			case 'dns.fallbackNameServer': return '${_root.dns.fallback} ${_root.dns.nameServer}';
			case 'dns.fallbackGeoIp': return '${_root.dns.fallback} GeoIp';
			case 'dns.fallbackGeoIpCode': return '${_root.dns.fallback} GeoIpCode';
			case 'sniffer.overrideDest': return 'پوشش';
			case 'profilePatchMode.currentSelected': return 'فعلی انتخاب شده';
			case 'profilePatchMode.overwrite': return 'Overwrite داخلی';
			case 'profilePatchMode.noOverwrite': return 'داخلی - رونویسی نشده است';
			case 'protocolSniff': return 'تشخیص پروتکل';
			case 'protocolSniffOverrideDestination': return 'نام دامنه شناسایی شده آدرس هدف اتصال را پوشش می دهد';
			case 'edgeRuntimeNotInstalled': return 'زمان اجرا Edge WebView2 روی دستگاه فعلی نصب نشده است و صفحه قابل نمایش نیست لطفاً زمان اجرا Edge WebView2 (x64) را بارگیری و نصب کنید، برنامه را مجدداً راه اندازی کنید و دوباره امتحان کنید.';
			case 'locales.en': return 'English';
			case 'locales.zh-CN': return '简体中文';
			case 'locales.ar': return 'عربي';
			case 'locales.ru': return 'Русский';
			case 'locales.fa': return 'فارسی';
			default: return null;
		}
	}
}

