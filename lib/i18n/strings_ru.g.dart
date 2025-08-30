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
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsBackupAndSyncWebdavScreenRu BackupAndSyncWebdavScreen = _TranslationsBackupAndSyncWebdavScreenRu._(_root);
	@override late final _TranslationsLaunchFailedScreenRu LaunchFailedScreen = _TranslationsLaunchFailedScreenRu._(_root);
	@override late final _TranslationsPerAppAndroidScreenRu PerAppAndroidScreen = _TranslationsPerAppAndroidScreenRu._(_root);
	@override late final _TranslationsUserAgreementScreenRu UserAgreementScreen = _TranslationsUserAgreementScreenRu._(_root);
	@override late final _TranslationsVersionUpdateScreenRu VersionUpdateScreen = _TranslationsVersionUpdateScreenRu._(_root);
	@override late final _TranslationsMainRu main = _TranslationsMainRu._(_root);
	@override late final _TranslationsMetaRu meta = _TranslationsMetaRu._(_root);
	@override late final _TranslationsPermissionRu permission = _TranslationsPermissionRu._(_root);
	@override late final _TranslationsTlsRu tls = _TranslationsTlsRu._(_root);
	@override late final _TranslationsTunRu tun = _TranslationsTunRu._(_root);
	@override late final _TranslationsDnsRu dns = _TranslationsDnsRu._(_root);
	@override late final _TranslationsSnifferRu sniffer = _TranslationsSnifferRu._(_root);
	@override late final _TranslationsProfilePatchModeRu profilePatchMode = _TranslationsProfilePatchModeRu._(_root);
	@override String get protocolSniff => 'Определение протокола';
	@override String get protocolSniffOverrideDestination => 'Обнаруженное имя домена перезаписывает целевой адрес подключения.';
	@override String get edgeRuntimeNotInstalled => 'Среда выполнения Edge WebView2 не установлена ​​на текущем устройстве, и страница не может быть отображена. Загрузите и установите среду выполнения Edge WebView2 (x64), перезапустите приложение и повторите попытку.';
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: BackupAndSyncWebdavScreen
class _TranslationsBackupAndSyncWebdavScreenRu implements TranslationsBackupAndSyncWebdavScreenEn {
	_TranslationsBackupAndSyncWebdavScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get webdavServerUrl => 'Адрес сервера';
	@override String get webdavRequired => 'Не может быть пустым';
	@override String get webdavLoginFailed => 'Ошибка входа:';
	@override String get webdavListFailed => 'Не удалось получить список файлов:';
}

// Path: LaunchFailedScreen
class _TranslationsLaunchFailedScreenRu implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'Не удалось запустить приложение [Неверное имя процесса], переустановите приложение в отдельную папку';
	@override String get invalidProfile => 'Не удалось запустить приложение [Не удалось получить доступ к профилю], переустановите приложение';
	@override String get invalidVersion => 'Не удалось запустить приложение [Неверная версия], переустановите приложение';
	@override String get systemVersionLow => 'Не удалось запустить приложение [Слишком низкая версия системы]';
	@override String get invalidInstallPath => 'Путь установки недействителен, переустановите его по допустимому пути';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenRu implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Проксируемые приложения';
	@override String get whiteListMode => 'Режим белого списка';
	@override String get whiteListModeTip => 'Если включено: перенаправляются через прокси-сервер только те приложения, которые были отмечены. Если выключено: перенаправляются через прокси-сервер только те приложения, которые не были отмечены.';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenRu implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => 'Ваша конфиденциальность превыше всего';
	@override String get agreeAndContinue => 'Принять и продолжить';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenRu implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => 'Новая версия [${p}] доступна';
	@override String get update => 'Перезапустить';
	@override String get cancel => 'Не сейчас';
}

// Path: main
class _TranslationsMainRu implements TranslationsMainEn {
	_TranslationsMainRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayRu tray = _TranslationsMainTrayRu._(_root);
}

// Path: meta
class _TranslationsMetaRu implements TranslationsMetaEn {
	_TranslationsMetaRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Включить';
	@override String get disable => 'Запретить';
	@override String get open => 'Открыть';
	@override String get close => 'Закрыть';
	@override String get quit => 'Выйти';
	@override String get add => 'Добавить';
	@override String get addSuccess => 'Добавлено успешно';
	@override String addFailed({required Object p}) => 'Ошибка при добавлении:${p}';
	@override String get remove => 'Удалить';
	@override String get removeConfirm => 'Подтверждаете удаление?';
	@override String get edit => 'Редактировать';
	@override String get view => 'Просмотр';
	@override String get remark => 'Примечание';
	@override String get byDefault => 'по умолчанию';
	@override String get editRemark => 'Заметки об изменениях';
	@override String get more => 'Больше';
	@override String get tips => 'Инфо';
	@override String get copy => 'Скопировать';
	@override String get save => 'сохранять';
	@override String get ok => 'Ок';
	@override String get cancel => 'Закрыть';
	@override String get faq => 'Часто задаваемые вопросы (FAQ)';
	@override String get download => 'Скачать';
	@override String get loading => 'Загрузка...';
	@override String get days => 'дни';
	@override String get hours => 'часы';
	@override String get minutes => 'минуты';
	@override String get seconds => 'Второй';
	@override String get protocol => 'Протокол';
	@override String get search => 'Поиск';
	@override String get custom => 'Настроить самостоятельно';
	@override String get connect => 'Соединить';
	@override String get disconnect => 'Отключить';
	@override String get connected => 'Подключено';
	@override String get disconnected => 'Отключено';
	@override String get connecting => 'Подключение';
	@override String get connectTimeout => 'Таймаут при соединении';
	@override String get timeout => 'Тайм-аут';
	@override String get timeoutDuration => 'Длительность тайм-аута';
	@override String get latency => 'Задерживать';
	@override String get latencyTest => 'Обнаружение задержки';
	@override String get language => 'Язык';
	@override String get next => 'Дальше';
	@override String get done => 'Готово';
	@override String get apply => 'Применить';
	@override String get refresh => 'Обновить';
	@override String get retry => 'Хотите попробовать еще раз?';
	@override String get update => 'Обновить';
	@override String get updateInterval => 'Интервал обновления';
	@override String get updateInterval5mTips => 'Минимум: 5 м';
	@override String updateFailed({required Object p}) => 'Не удалось обновить:${p}';
	@override String get none => 'Ничего не делать';
	@override String get reset => 'Перезагрузить';
	@override String get authentication => 'Авторизация';
	@override String get submit => 'Отправить';
	@override String get user => 'Пользователь';
	@override String get account => 'Аккаунт';
	@override String get password => 'Пароль';
	@override String get required => 'Необходимо';
	@override String get other => 'Другой';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'Неверный URL';
	@override String get urlCannotEmpty => 'Ссылка не может быть пустой';
	@override String get urlTooLong => 'URL слишком длинный (>8182)';
	@override String get copyUrl => 'Скопировать ссылку';
	@override String get openUrl => 'Открыть ссылку';
	@override String get shareUrl => 'Поделиться ссылкой';
	@override String get coreSettingTips => 'Примечание: После изменения конфигурации необходимо повторно подключиться, чтобы изменения вступили в силу.';
	@override String get overwrite => 'Переопределить';
	@override String get overwriteCustom => 'Пользовательские переопределения';
	@override String get overwriteTips => 'Исходная конфигурация <- Пользовательское переопределение <- Переопределение приложения';
	@override String get noOverwrite => 'Не перезаписывать';
	@override String get overwriteSettings => 'Переопределить настройки';
	@override String get externalController => 'Внешнее управление';
	@override String get secret => 'Пароль';
	@override String get tcpConcurrent => 'Параллельное TCP-подтверждение';
	@override String get globalClientFingerprint => 'Глобальный отпечаток пальца TLS';
	@override String get allowLanAccess => 'Доступ к локальной сети устройства';
	@override String get mixedPort => 'Порт mixed-прокси';
	@override String get logLevel => 'Уровень журнала';
	@override String get tcpkeepAliveInterval => 'Интервал проверки активности TCP';
	@override String get delayTestUrl => 'URL-адрес теста задержки';
	@override String get delayTestTimeout => 'Время ожидания теста задержки (мс)';
	@override String get tun => 'TUN';
	@override String get ntp => 'NTP';
	@override String get tls => 'TLS';
	@override String get geo => 'GEO';
	@override String get geoDownloadByProxy => 'Загрузка гео-правил через прокси';
	@override String get geoRulesetTips => 'Geosite/Geoip/Asn будет преобразован в соответствующий RuleSet';
	@override String get sniffer => 'Обнаружение доменов';
	@override String get userAgent => 'UserAgent';
	@override String get launchAtStartup => 'Запуск при включении';
	@override String get launchAtStartupRunAsAdmin => 'Пожалуйста, перезапустите Clash Mi от имени администратора.';
	@override String get portableMode => 'Портативный режим';
	@override String get portableModeDisableTips => 'Если вам нужно выйти из портативного режима, выйдите из [clashmi] и вручную удалите папку [portable] в том же каталоге, что и [clashmi.exe]';
	@override String get systemProxy => 'Системный прокси';
	@override String get autoConnectAfterLaunch => 'Автоматическое подключение после запуска';
	@override String get hideAfterLaunch => 'Скрыть окно после запуска';
	@override String get autoSetSystemProxy => 'Установить системный прокси после подключения';
	@override String get bypassSystemProxy => 'Доменные имена, которым разрешено обходить системный прокси-сервер';
	@override String get website => 'Веб-сайт';
	@override String get rule => 'Правила';
	@override String get global => 'Глобально';
	@override String get direct => 'Напрямую';
	@override String get block => 'Блокировать';
	@override String get qrcode => 'QR-код';
	@override String get qrcodeTooLong => 'Слишком большой текст для отображения';
	@override String get qrcodeShare => 'Поделиться QR-кодом';
	@override String get textToQrcode => 'Преобразование текста в QR-код';
	@override String get qrcodeScan => 'Сканировать QR-код';
	@override String get qrcodeScanResult => 'Результат сканирования';
	@override String get qrcodeScanFromImage => 'Открыть';
	@override String get qrcodeScanResultFailed => 'Не удалось проанализировать изображение. Убедитесь, что снимок экрана представляет собой действительный QR-код.';
	@override String get qrcodeScanResultEmpty => 'Пустой результат сканирования.';
	@override String get screenshot => 'Скриншот';
	@override String get backupAndSync => 'Резервное копирование и синхронизация';
	@override String get importSuccess => 'Импорт выполнен успешно';
	@override String get rewriteConfirm => 'Этот файл перезапишет существующую локальную конфигурацию. Продолжить?';
	@override String get importAndExport => 'Импорт и экспорт';
	@override String get import => 'Импорт';
	@override String get importFromUrl => 'Импорт из URL';
	@override String get export => 'Экспорт';
	@override String get send => 'Передать';
	@override String get receive => 'Принять';
	@override String get sendConfirm => 'Подтверждаете передачу?';
	@override String get termOfUse => 'Условия использования';
	@override String get privacyPolicy => 'Политика конфиденциальности';
	@override String get log => 'Журнал';
	@override String get coreLog => 'Журнал ядра';
	@override String get core => 'Ядро';
	@override String get help => 'Помощь';
	@override String get tutorial => 'Руководство';
	@override String get board => 'Панель';
	@override String get boardOnline => 'Использование онлайн-панели';
	@override String get boardOnlineUrl => 'URL-адрес онлайн-панели';
	@override String get boardLocalPort => 'Порт локальной панели';
	@override String get disableFontScaler => 'Отключить масштабирование шрифта';
	@override String get autoOrientation => 'Следовать за поворотом экрана';
	@override String get restartTakesEffect => 'Требуется перезапуск';
	@override String get runtimeProfile => 'Конфигурация времени выполнения';
	@override String get willCompleteAfterRebootInstall => 'Пожалуйста, перезагрузите устройство, чтобы завершить установку расширения системы.';
	@override String get willCompleteAfterRebootUninstall => 'Пожалуйста, перезагрузите устройство, чтобы завершить удаление системного расширения.';
	@override String get requestNeedsUserApproval => 'Пожалуйста, [разрешите] Clash Mi устанавливать системные расширения в [Системные настройки] - [Конфиденциальность и безопасность] и переподключитесь после завершения установки.';
	@override String get FullDiskAccessPermissionRequired => 'Включите разрешение clashmiServiceSE в [Системные настройки]-[Конфиденциальность и безопасность]-[Полный доступ к диску] и переподключитесь.';
	@override String get proxy => 'Прокси';
	@override String get theme => 'Тема';
	@override String get tvMode => 'Режим ТВ';
	@override String get autoUpdate => 'Автоматические обновления';
	@override String get updateChannel => 'Канал автоматического обновления';
	@override String hasNewVersion({required Object p}) => 'Обновить версию ${p}';
	@override String get devOptions => 'Параметры разработчика';
	@override String get about => 'О приложении';
	@override String get name => 'Название';
	@override String get version => 'Версия';
	@override String get notice => 'Уведомления';
	@override String get sort => 'Отсортировать';
	@override String get recommended => 'Рекомендуемые';
	@override String innerError({required Object p}) => 'Внутренняя ошибка:${p}';
	@override String get share => 'Поделиться';
	@override String get importFromClipboard => 'Импорт из буфера обмена';
	@override String get exportToClipboard => 'Экспорт в буфер обмена';
	@override String get server => 'Сервер';
	@override String get port => 'Порт';
	@override String get donate => 'Пожертвовать';
	@override String get setting => 'Настройки';
	@override String get settingCore => 'Настройки ядра';
	@override String get settingApp => 'Настройки приложения';
	@override String get coreOverwrite => 'Переопределение ядра';
	@override String get iCloud => 'iCloud';
	@override String get webdav => 'Webdav';
	@override String get lanSync => 'Синхронизация по локальной сети';
	@override String get lanSyncNotQuitTips => 'Не выходите из этого окна до завершения синхронизации.';
	@override String get deviceNoSpace => 'Недостаточно места на диске';
	@override String get hideSystemApp => 'Скрыть системные приложения';
	@override String get hideAppIcon => 'Скрыть значок приложения';
	@override String get openDir => 'Открыть каталог файлов';
	@override String get fileChoose => 'Выбрать файл';
	@override String get filePathCannotEmpty => 'Путь к файлу не может быть пустым';
	@override String fileNotExist({required Object p}) => 'Файла не существует:${p}';
	@override String fileTypeInvalid({required Object p}) => 'Неверный тип файла:${p}';
	@override String get uwpExemption => 'Исключение из изоляции сети UWP';
	@override String get getProfile => 'Получить конфигурацию';
	@override String get addProfile => 'Добавить профиль';
	@override String get myProfiles => 'Профили';
	@override String get profileEdit => 'Редактирование профилей';
	@override String get profileEditReloadAfterProfileUpdate => 'Перезагрузить после обновления профиля';
	@override String get profileImport => 'Импорт файла конфигурации';
	@override String get profileAddUrlOrContent => 'Добавление подписки';
	@override String get profileUrlOrContent => 'Ссылка на подписку/содержание';
	@override String get profileUrlOrContentHit => 'Ссылка на подписку/содержание [обязательно] (Поддерживаются Clash, V2ray(c пакетом поддержки), Stash, Karing, Sing-box, Shadowsocks, Sub; Ссылка на конфигурацию).';
	@override String get profileUrlOrContentCannotEmpty => 'Ссылка на подписку не может быть пустой';
}

// Path: permission
class _TranslationsPermissionRu implements TranslationsPermissionEn {
	_TranslationsPermissionRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get camera => 'Камера';
	@override String get screen => 'Запись экрана';
	@override String get appQuery => 'Получить список приложений';
	@override String request({required Object p}) => 'Включить разрешения [${p}]';
	@override String requestNeed({required Object p}) => 'Пожалуйста, включите разрешение [${p}]';
}

// Path: tls
class _TranslationsTlsRu implements TranslationsTlsEn {
	_TranslationsTlsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get insecure => 'Пропустить проверку сертификата';
	@override String get certificate => 'Сертификат';
	@override String get privateKey => 'Закрытый ключ';
	@override String get customTrustCert => 'Индивидуальные сертификаты';
}

// Path: tun
class _TranslationsTunRu implements TranslationsTunEn {
	_TranslationsTunRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get stack => 'Сетевой стек';
	@override String get dnsHijack => 'Перехват DNS';
	@override String get strictRoute => 'Строгая маршрутизация';
	@override String get allowBypass => 'Разрешить приложениям обходить VPN';
	@override String get appendHttpProxy => 'Подключите HTTP-прокси к VPN';
	@override String get bypassHttpProxyDomain => 'Домены, которым разрешено обходить HTTP-прокси';
}

// Path: dns
class _TranslationsDnsRu implements TranslationsDnsEn {
	_TranslationsDnsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get fakeIp => 'fake-ip';
	@override String get fallback => 'Fallback';
	@override String get preferH3 => 'Приоритет DoH H3';
	@override String get useHosts => 'Использование хостов';
	@override String get useSystemHosts => 'Использование системных хостов';
	@override String get enhancedMode => 'Расширенный режим';
	@override String get fakeIPFilterMode => '${_root.dns.fakeIp} режим фильтра';
	@override String get fakeIPFilter => '${_root.dns.fakeIp} фильтрация';
	@override String get nameServer => 'DNS-сервер';
	@override String get defaultNameServer => '${_root.meta.byDefault} ${_root.dns.nameServer}';
	@override String get proxyNameServer => '${_root.meta.proxy} ${_root.dns.nameServer}';
	@override String get directNameServer => '${_root.meta.direct} ${_root.dns.nameServer}';
	@override String get fallbackNameServer => '${_root.dns.fallback} ${_root.dns.nameServer}';
	@override String get fallbackGeoIp => '${_root.dns.fallback} GeoIp';
	@override String get fallbackGeoIpCode => '${_root.dns.fallback} GeoIpCode';
}

// Path: sniffer
class _TranslationsSnifferRu implements TranslationsSnifferEn {
	_TranslationsSnifferRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get overrideDest => 'Переназначить';
}

// Path: profilePatchMode
class _TranslationsProfilePatchModeRu implements TranslationsProfilePatchModeEn {
	_TranslationsProfilePatchModeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get currentSelected => 'Текущий сервер';
	@override String get overwrite => 'Встроенная функция переопределения';
	@override String get noOverwrite => 'Встроенный - не перезаписывается';
}

// Path: main.tray
class _TranslationsMainTrayRu implements TranslationsMainTrayEn {
	_TranslationsMainTrayRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '    Открыть    ';
	@override String get menuExit => '    Выйти    ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'BackupAndSyncWebdavScreen.webdavServerUrl': return 'Адрес сервера';
			case 'BackupAndSyncWebdavScreen.webdavRequired': return 'Не может быть пустым';
			case 'BackupAndSyncWebdavScreen.webdavLoginFailed': return 'Ошибка входа:';
			case 'BackupAndSyncWebdavScreen.webdavListFailed': return 'Не удалось получить список файлов:';
			case 'LaunchFailedScreen.invalidProcess': return 'Не удалось запустить приложение [Неверное имя процесса], переустановите приложение в отдельную папку';
			case 'LaunchFailedScreen.invalidProfile': return 'Не удалось запустить приложение [Не удалось получить доступ к профилю], переустановите приложение';
			case 'LaunchFailedScreen.invalidVersion': return 'Не удалось запустить приложение [Неверная версия], переустановите приложение';
			case 'LaunchFailedScreen.systemVersionLow': return 'Не удалось запустить приложение [Слишком низкая версия системы]';
			case 'LaunchFailedScreen.invalidInstallPath': return 'Путь установки недействителен, переустановите его по допустимому пути';
			case 'PerAppAndroidScreen.title': return 'Проксируемые приложения';
			case 'PerAppAndroidScreen.whiteListMode': return 'Режим белого списка';
			case 'PerAppAndroidScreen.whiteListModeTip': return 'Если включено: перенаправляются через прокси-сервер только те приложения, которые были отмечены. Если выключено: перенаправляются через прокси-сервер только те приложения, которые не были отмечены.';
			case 'UserAgreementScreen.privacyFirst': return 'Ваша конфиденциальность превыше всего';
			case 'UserAgreementScreen.agreeAndContinue': return 'Принять и продолжить';
			case 'VersionUpdateScreen.versionReady': return ({required Object p}) => 'Новая версия [${p}] доступна';
			case 'VersionUpdateScreen.update': return 'Перезапустить';
			case 'VersionUpdateScreen.cancel': return 'Не сейчас';
			case 'main.tray.menuOpen': return '    Открыть    ';
			case 'main.tray.menuExit': return '    Выйти    ';
			case 'meta.enable': return 'Включить';
			case 'meta.disable': return 'Запретить';
			case 'meta.open': return 'Открыть';
			case 'meta.close': return 'Закрыть';
			case 'meta.quit': return 'Выйти';
			case 'meta.add': return 'Добавить';
			case 'meta.addSuccess': return 'Добавлено успешно';
			case 'meta.addFailed': return ({required Object p}) => 'Ошибка при добавлении:${p}';
			case 'meta.remove': return 'Удалить';
			case 'meta.removeConfirm': return 'Подтверждаете удаление?';
			case 'meta.edit': return 'Редактировать';
			case 'meta.view': return 'Просмотр';
			case 'meta.remark': return 'Примечание';
			case 'meta.byDefault': return 'по умолчанию';
			case 'meta.editRemark': return 'Заметки об изменениях';
			case 'meta.more': return 'Больше';
			case 'meta.tips': return 'Инфо';
			case 'meta.copy': return 'Скопировать';
			case 'meta.save': return 'сохранять';
			case 'meta.ok': return 'Ок';
			case 'meta.cancel': return 'Закрыть';
			case 'meta.faq': return 'Часто задаваемые вопросы (FAQ)';
			case 'meta.download': return 'Скачать';
			case 'meta.loading': return 'Загрузка...';
			case 'meta.days': return 'дни';
			case 'meta.hours': return 'часы';
			case 'meta.minutes': return 'минуты';
			case 'meta.seconds': return 'Второй';
			case 'meta.protocol': return 'Протокол';
			case 'meta.search': return 'Поиск';
			case 'meta.custom': return 'Настроить самостоятельно';
			case 'meta.connect': return 'Соединить';
			case 'meta.disconnect': return 'Отключить';
			case 'meta.connected': return 'Подключено';
			case 'meta.disconnected': return 'Отключено';
			case 'meta.connecting': return 'Подключение';
			case 'meta.connectTimeout': return 'Таймаут при соединении';
			case 'meta.timeout': return 'Тайм-аут';
			case 'meta.timeoutDuration': return 'Длительность тайм-аута';
			case 'meta.latency': return 'Задерживать';
			case 'meta.latencyTest': return 'Обнаружение задержки';
			case 'meta.language': return 'Язык';
			case 'meta.next': return 'Дальше';
			case 'meta.done': return 'Готово';
			case 'meta.apply': return 'Применить';
			case 'meta.refresh': return 'Обновить';
			case 'meta.retry': return 'Хотите попробовать еще раз?';
			case 'meta.update': return 'Обновить';
			case 'meta.updateInterval': return 'Интервал обновления';
			case 'meta.updateInterval5mTips': return 'Минимум: 5 м';
			case 'meta.updateFailed': return ({required Object p}) => 'Не удалось обновить:${p}';
			case 'meta.none': return 'Ничего не делать';
			case 'meta.reset': return 'Перезагрузить';
			case 'meta.authentication': return 'Авторизация';
			case 'meta.submit': return 'Отправить';
			case 'meta.user': return 'Пользователь';
			case 'meta.account': return 'Аккаунт';
			case 'meta.password': return 'Пароль';
			case 'meta.required': return 'Необходимо';
			case 'meta.other': return 'Другой';
			case 'meta.dns': return 'DNS';
			case 'meta.url': return 'URL';
			case 'meta.urlInvalid': return 'Неверный URL';
			case 'meta.urlCannotEmpty': return 'Ссылка не может быть пустой';
			case 'meta.urlTooLong': return 'URL слишком длинный (>8182)';
			case 'meta.copyUrl': return 'Скопировать ссылку';
			case 'meta.openUrl': return 'Открыть ссылку';
			case 'meta.shareUrl': return 'Поделиться ссылкой';
			case 'meta.coreSettingTips': return 'Примечание: После изменения конфигурации необходимо повторно подключиться, чтобы изменения вступили в силу.';
			case 'meta.overwrite': return 'Переопределить';
			case 'meta.overwriteCustom': return 'Пользовательские переопределения';
			case 'meta.overwriteTips': return 'Исходная конфигурация <- Пользовательское переопределение <- Переопределение приложения';
			case 'meta.noOverwrite': return 'Не перезаписывать';
			case 'meta.overwriteSettings': return 'Переопределить настройки';
			case 'meta.externalController': return 'Внешнее управление';
			case 'meta.secret': return 'Пароль';
			case 'meta.tcpConcurrent': return 'Параллельное TCP-подтверждение';
			case 'meta.globalClientFingerprint': return 'Глобальный отпечаток пальца TLS';
			case 'meta.allowLanAccess': return 'Доступ к локальной сети устройства';
			case 'meta.mixedPort': return 'Порт mixed-прокси';
			case 'meta.logLevel': return 'Уровень журнала';
			case 'meta.tcpkeepAliveInterval': return 'Интервал проверки активности TCP';
			case 'meta.delayTestUrl': return 'URL-адрес теста задержки';
			case 'meta.delayTestTimeout': return 'Время ожидания теста задержки (мс)';
			case 'meta.tun': return 'TUN';
			case 'meta.ntp': return 'NTP';
			case 'meta.tls': return 'TLS';
			case 'meta.geo': return 'GEO';
			case 'meta.geoDownloadByProxy': return 'Загрузка гео-правил через прокси';
			case 'meta.geoRulesetTips': return 'Geosite/Geoip/Asn будет преобразован в соответствующий RuleSet';
			case 'meta.sniffer': return 'Обнаружение доменов';
			case 'meta.userAgent': return 'UserAgent';
			case 'meta.launchAtStartup': return 'Запуск при включении';
			case 'meta.launchAtStartupRunAsAdmin': return 'Пожалуйста, перезапустите Clash Mi от имени администратора.';
			case 'meta.portableMode': return 'Портативный режим';
			case 'meta.portableModeDisableTips': return 'Если вам нужно выйти из портативного режима, выйдите из [clashmi] и вручную удалите папку [portable] в том же каталоге, что и [clashmi.exe]';
			case 'meta.systemProxy': return 'Системный прокси';
			case 'meta.autoConnectAfterLaunch': return 'Автоматическое подключение после запуска';
			case 'meta.hideAfterLaunch': return 'Скрыть окно после запуска';
			case 'meta.autoSetSystemProxy': return 'Установить системный прокси после подключения';
			case 'meta.bypassSystemProxy': return 'Доменные имена, которым разрешено обходить системный прокси-сервер';
			case 'meta.website': return 'Веб-сайт';
			case 'meta.rule': return 'Правила';
			case 'meta.global': return 'Глобально';
			case 'meta.direct': return 'Напрямую';
			case 'meta.block': return 'Блокировать';
			case 'meta.qrcode': return 'QR-код';
			case 'meta.qrcodeTooLong': return 'Слишком большой текст для отображения';
			case 'meta.qrcodeShare': return 'Поделиться QR-кодом';
			case 'meta.textToQrcode': return 'Преобразование текста в QR-код';
			case 'meta.qrcodeScan': return 'Сканировать QR-код';
			case 'meta.qrcodeScanResult': return 'Результат сканирования';
			case 'meta.qrcodeScanFromImage': return 'Открыть';
			case 'meta.qrcodeScanResultFailed': return 'Не удалось проанализировать изображение. Убедитесь, что снимок экрана представляет собой действительный QR-код.';
			case 'meta.qrcodeScanResultEmpty': return 'Пустой результат сканирования.';
			case 'meta.screenshot': return 'Скриншот';
			case 'meta.backupAndSync': return 'Резервное копирование и синхронизация';
			case 'meta.importSuccess': return 'Импорт выполнен успешно';
			case 'meta.rewriteConfirm': return 'Этот файл перезапишет существующую локальную конфигурацию. Продолжить?';
			case 'meta.importAndExport': return 'Импорт и экспорт';
			case 'meta.import': return 'Импорт';
			case 'meta.importFromUrl': return 'Импорт из URL';
			case 'meta.export': return 'Экспорт';
			case 'meta.send': return 'Передать';
			case 'meta.receive': return 'Принять';
			case 'meta.sendConfirm': return 'Подтверждаете передачу?';
			case 'meta.termOfUse': return 'Условия использования';
			case 'meta.privacyPolicy': return 'Политика конфиденциальности';
			case 'meta.log': return 'Журнал';
			case 'meta.coreLog': return 'Журнал ядра';
			case 'meta.core': return 'Ядро';
			case 'meta.help': return 'Помощь';
			case 'meta.tutorial': return 'Руководство';
			case 'meta.board': return 'Панель';
			case 'meta.boardOnline': return 'Использование онлайн-панели';
			case 'meta.boardOnlineUrl': return 'URL-адрес онлайн-панели';
			case 'meta.boardLocalPort': return 'Порт локальной панели';
			case 'meta.disableFontScaler': return 'Отключить масштабирование шрифта';
			case 'meta.autoOrientation': return 'Следовать за поворотом экрана';
			case 'meta.restartTakesEffect': return 'Требуется перезапуск';
			case 'meta.runtimeProfile': return 'Конфигурация времени выполнения';
			case 'meta.willCompleteAfterRebootInstall': return 'Пожалуйста, перезагрузите устройство, чтобы завершить установку расширения системы.';
			case 'meta.willCompleteAfterRebootUninstall': return 'Пожалуйста, перезагрузите устройство, чтобы завершить удаление системного расширения.';
			case 'meta.requestNeedsUserApproval': return 'Пожалуйста, [разрешите] Clash Mi устанавливать системные расширения в [Системные настройки] - [Конфиденциальность и безопасность] и переподключитесь после завершения установки.';
			case 'meta.FullDiskAccessPermissionRequired': return 'Включите разрешение clashmiServiceSE в [Системные настройки]-[Конфиденциальность и безопасность]-[Полный доступ к диску] и переподключитесь.';
			case 'meta.proxy': return 'Прокси';
			case 'meta.theme': return 'Тема';
			case 'meta.tvMode': return 'Режим ТВ';
			case 'meta.autoUpdate': return 'Автоматические обновления';
			case 'meta.updateChannel': return 'Канал автоматического обновления';
			case 'meta.hasNewVersion': return ({required Object p}) => 'Обновить версию ${p}';
			case 'meta.devOptions': return 'Параметры разработчика';
			case 'meta.about': return 'О приложении';
			case 'meta.name': return 'Название';
			case 'meta.version': return 'Версия';
			case 'meta.notice': return 'Уведомления';
			case 'meta.sort': return 'Отсортировать';
			case 'meta.recommended': return 'Рекомендуемые';
			case 'meta.innerError': return ({required Object p}) => 'Внутренняя ошибка:${p}';
			case 'meta.share': return 'Поделиться';
			case 'meta.importFromClipboard': return 'Импорт из буфера обмена';
			case 'meta.exportToClipboard': return 'Экспорт в буфер обмена';
			case 'meta.server': return 'Сервер';
			case 'meta.port': return 'Порт';
			case 'meta.donate': return 'Пожертвовать';
			case 'meta.setting': return 'Настройки';
			case 'meta.settingCore': return 'Настройки ядра';
			case 'meta.settingApp': return 'Настройки приложения';
			case 'meta.coreOverwrite': return 'Переопределение ядра';
			case 'meta.iCloud': return 'iCloud';
			case 'meta.webdav': return 'Webdav';
			case 'meta.lanSync': return 'Синхронизация по локальной сети';
			case 'meta.lanSyncNotQuitTips': return 'Не выходите из этого окна до завершения синхронизации.';
			case 'meta.deviceNoSpace': return 'Недостаточно места на диске';
			case 'meta.hideSystemApp': return 'Скрыть системные приложения';
			case 'meta.hideAppIcon': return 'Скрыть значок приложения';
			case 'meta.openDir': return 'Открыть каталог файлов';
			case 'meta.fileChoose': return 'Выбрать файл';
			case 'meta.filePathCannotEmpty': return 'Путь к файлу не может быть пустым';
			case 'meta.fileNotExist': return ({required Object p}) => 'Файла не существует:${p}';
			case 'meta.fileTypeInvalid': return ({required Object p}) => 'Неверный тип файла:${p}';
			case 'meta.uwpExemption': return 'Исключение из изоляции сети UWP';
			case 'meta.getProfile': return 'Получить конфигурацию';
			case 'meta.addProfile': return 'Добавить профиль';
			case 'meta.myProfiles': return 'Профили';
			case 'meta.profileEdit': return 'Редактирование профилей';
			case 'meta.profileEditReloadAfterProfileUpdate': return 'Перезагрузить после обновления профиля';
			case 'meta.profileImport': return 'Импорт файла конфигурации';
			case 'meta.profileAddUrlOrContent': return 'Добавление подписки';
			case 'meta.profileUrlOrContent': return 'Ссылка на подписку/содержание';
			case 'meta.profileUrlOrContentHit': return 'Ссылка на подписку/содержание [обязательно] (Поддерживаются Clash, V2ray(c пакетом поддержки), Stash, Karing, Sing-box, Shadowsocks, Sub; Ссылка на конфигурацию).';
			case 'meta.profileUrlOrContentCannotEmpty': return 'Ссылка на подписку не может быть пустой';
			case 'permission.camera': return 'Камера';
			case 'permission.screen': return 'Запись экрана';
			case 'permission.appQuery': return 'Получить список приложений';
			case 'permission.request': return ({required Object p}) => 'Включить разрешения [${p}]';
			case 'permission.requestNeed': return ({required Object p}) => 'Пожалуйста, включите разрешение [${p}]';
			case 'tls.insecure': return 'Пропустить проверку сертификата';
			case 'tls.certificate': return 'Сертификат';
			case 'tls.privateKey': return 'Закрытый ключ';
			case 'tls.customTrustCert': return 'Индивидуальные сертификаты';
			case 'tun.stack': return 'Сетевой стек';
			case 'tun.dnsHijack': return 'Перехват DNS';
			case 'tun.strictRoute': return 'Строгая маршрутизация';
			case 'tun.allowBypass': return 'Разрешить приложениям обходить VPN';
			case 'tun.appendHttpProxy': return 'Подключите HTTP-прокси к VPN';
			case 'tun.bypassHttpProxyDomain': return 'Домены, которым разрешено обходить HTTP-прокси';
			case 'dns.fakeIp': return 'fake-ip';
			case 'dns.fallback': return 'Fallback';
			case 'dns.preferH3': return 'Приоритет DoH H3';
			case 'dns.useHosts': return 'Использование хостов';
			case 'dns.useSystemHosts': return 'Использование системных хостов';
			case 'dns.enhancedMode': return 'Расширенный режим';
			case 'dns.fakeIPFilterMode': return '${_root.dns.fakeIp} режим фильтра';
			case 'dns.fakeIPFilter': return '${_root.dns.fakeIp} фильтрация';
			case 'dns.nameServer': return 'DNS-сервер';
			case 'dns.defaultNameServer': return '${_root.meta.byDefault} ${_root.dns.nameServer}';
			case 'dns.proxyNameServer': return '${_root.meta.proxy} ${_root.dns.nameServer}';
			case 'dns.directNameServer': return '${_root.meta.direct} ${_root.dns.nameServer}';
			case 'dns.fallbackNameServer': return '${_root.dns.fallback} ${_root.dns.nameServer}';
			case 'dns.fallbackGeoIp': return '${_root.dns.fallback} GeoIp';
			case 'dns.fallbackGeoIpCode': return '${_root.dns.fallback} GeoIpCode';
			case 'sniffer.overrideDest': return 'Переназначить';
			case 'profilePatchMode.currentSelected': return 'Текущий сервер';
			case 'profilePatchMode.overwrite': return 'Встроенная функция переопределения';
			case 'profilePatchMode.noOverwrite': return 'Встроенный - не перезаписывается';
			case 'protocolSniff': return 'Определение протокола';
			case 'protocolSniffOverrideDestination': return 'Обнаруженное имя домена перезаписывает целевой адрес подключения.';
			case 'edgeRuntimeNotInstalled': return 'Среда выполнения Edge WebView2 не установлена ​​на текущем устройстве, и страница не может быть отображена. Загрузите и установите среду выполнения Edge WebView2 (x64), перезапустите приложение и повторите попытку.';
			case 'locales.en': return 'English';
			case 'locales.zh-CN': return '简体中文';
			case 'locales.ar': return 'عربي';
			case 'locales.ru': return 'Русский';
			case 'locales.fa': return 'فارسی';
			default: return null;
		}
	}
}

