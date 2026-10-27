# Tagesroutine

© 2026 Benedikt Diel

Tägliche Routinen abhaken: Duschen, 2× Zähne putzen, Wasser trinken und alles, was jeden Tag dazugehört. Mit Zählern für Dinge, die mehrmals am Tag anstehen, Tageszeiten, Wochentagen, Wochenübersicht und Serie.

## Die App in allen Varianten

| Gerät | Variante | Wo |
|---|---|---|
| iPhone, iPad | Web-App | `https://darklord-0405.github.io/Tagesroutine/` in Safari öffnen → Teilen → „Zum Home-Bildschirm“ |
| Mac | Web-App | Link in Safari öffnen → Ablage → „Zum Dock hinzufügen“ |
| Android | APK | *Releases* → `Tagesroutine-<version>.apk` |
| iPhone, iPad | Native App (IPA) | *Releases* → `Tagesroutine-<version>.ipa`, Installation siehe unten |
| Jeder Browser | HTML-Datei | *Releases* → `Tagesroutine-<version>.html` oder `web/index.html` |

Die Web-App läuft nach dem ersten Öffnen auch offline. Alle Varianten benutzen denselben Code aus dem Ordner `web`.

## Einrichtung (einmalig)

1. **Settings → Pages → Source:** „GitHub Actions“ wählen.
2. Unter **Actions** beide Workflows einmal laufen lassen („Run workflow“), falls sie nicht von selbst starten.

Danach baut jeder Push auf `main` die Web-App neu und legt ein Release mit APK, IPA und HTML an.

## Installation

**Android:** APK aus *Releases* herunterladen und öffnen. Einmalig die Installation aus dieser Quelle erlauben.

**iPhone als Web-App (empfohlen):** Link in Safari öffnen → Teilen-Symbol → „Zum Home-Bildschirm“. Kein Apple-Konto, keine Ablaufzeit.

**iPhone als echte App (IPA):** Apple erlaubt Apps außerhalb des App Stores nur mit eigener Signatur. Die IPA aus *Releases* ist unsigniert und wird beim Installieren mit deiner Apple-ID signiert:

- Mit **Sideloadly** oder **AltStore** (Mac oder Windows): IPA auswählen, Apple-ID eingeben, iPhone per Kabel verbinden. Mit einer kostenlosen Apple-ID läuft die App 7 Tage und muss dann neu signiert werden; mit einem bezahlten Entwicklerkonto (99 €/Jahr) ein Jahr.
- Oder mit **Xcode** auf dem Mac: `brew install xcodegen`, dann im Ordner `ios` `xcodegen generate` ausführen, `Tagesroutine.xcodeproj` öffnen, unter *Signing & Capabilities* dein Team wählen und auf dem angeschlossenen iPhone starten.

## Daten zwischen Geräten übertragen

Die Apps speichern auf dem jeweiligen Gerät. Zum Mitnehmen gibt es die Karte **„Daten übertragen“**: Code kopieren, auf dem anderen Gerät einfügen, zweimal auf „Übernehmen“ tippen.

Automatischer Sync zwischen allen Geräten gibt es in der Claude-Version der App, weil sie den Speicher von Claude nutzt. In den Apps aus diesem Repository ist er nicht verfügbar.

## Versionen

Die Version steht in `APP_VERSION` in `web/index.html`. Daraus entstehen die Anzeige in der Fußzeile, `versionName`/`versionCode` der APK, die Version der IPA und der Name des Releases. Bei einem Update zusätzlich die Version in `web/sw.js` (Offline-Cache) und `web/manifest.webmanifest` anpassen.

| Version | Änderung |
|---|---|
| 1.0.0 | Erste Version: Routinen mit Zählern, Tageszeiten, Wochentagen, Serie, Datenübertragung per Code; Web-App, APK, IPA, HTML |

## Hinweis zur Signatur

`android/app/release.keystore` signiert die APK. Er muss bei jedem Update gleich bleiben, sonst lässt Android die neue Version nicht über die alte installieren. Da er im öffentlichen Repository liegt, könnte ihn jemand anderes nutzen. Für eine private App ist das unkritisch; für den Play Store bräuchte es einen geheimen Schlüssel.
