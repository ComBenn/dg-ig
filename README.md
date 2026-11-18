# Arzneimittelallergie – Implementation Guide

Benjamin Kaiser · ZHAW · Data Standards in Healthcare · HS26

Im Rahmen des Labs habe ich ein Implementation Guide auf Basis von CH Core erstellt. Es beschreibt, wie eine Hausarztpraxis Arzneimittelallergien erfasst und einer Notfallstation zur Verfügung stellt.

* [Veröffentlichtes IG](https://combenn.github.io/dg-ig/)
* [QA-Report](https://combenn.github.io/dg-ig/qa.html)
* [Aufgabenblatt](./DG_Lab_IG_FSH_Aufgabenblatt.pdf)

## Umsetzung

Das Profil schränkt CH Core AllergyIntolerance auf Arzneimittelallergien ein. Klinischer Status, Allergiecode, Kritikalität und erfassende Person sind verpflichtend. Den Beginn lasse ich optional als Datum oder Alter zu.

Für die Schweizer Allergie- und Symptomlisten verwende ich extensible Bindings. So muss ein passender Code aus der jeweiligen Liste verwendet werden; fehlt ein geeigneter Begriff, bleibt eine alternative Erfassung möglich. Die vorgegebene Invariante verlangt für bestätigte Allergien mindestens eine dokumentierte Reaktion.

Die beiden fiktiven Beispiele zeigen eine bestätigte Penicillinallergie mit Urtikaria und einen unbestätigten Verdacht auf eine Benzylpenicillinallergie ohne dokumentierte Reaktion. Die Patientin, die Ärztin und die Praxis stammen aus der Lab-Vorlage.

## Projektaufbau

| Datei | Inhalt |
|---|---|
| [sushi-config.yaml](./sushi-config.yaml) | Metadaten und Abhängigkeiten des IG |
| [profil.fsh](./input/fsh/profil.fsh) | Profil mit den sieben Anforderungen |
| [invarianten.fsh](./input/fsh/invarianten.fsh) | Vorgegebene Regel für bestätigte Allergien |
| [beispiele.fsh](./input/fsh/beispiele.fsh) | Zwei Beispiele zum Profil |
| [basis-beispiele.fsh](./input/fsh/basis-beispiele.fsh) | Vorgegebene Patientin, Ärztin, Praxis und ärztliche Rolle |
| [aliases.fsh](./input/fsh/aliases.fsh) | Aliase für CodeSystems und ValueSets |
| [index.md](./input/pagecontent/index.md) | Startseite mit Use Case, Scope und Profilentscheidungen |
| [ignoreWarnings.txt](./input/ignoreWarnings.txt) | Einzeln geprüfte Warnungen mit Begründungen |
| [build-ig.yml](./.github/workflows/build-ig.yml) | Build und Veröffentlichung über GitHub Actions |

## Build und Validierung

Für die lokale Prüfung verwende ich SUSHI 3.21.0 mit Node.js:

```sh
npm install -g fsh-sushi@3.21.0
sushi build .
```

Bei jedem Push auf `main` kompiliert der Workflow die FSH-Dateien, erstellt mit dem IG Publisher die Website und veröffentlicht sie auf GitHub Pages. Die Prüfung der Beispiele gegen das Profil und die Invariante erfolgt im IG Publisher.

Der abgeschlossene Lösungsbuild hatte keine SUSHI-Fehler oder -Warnungen und im QA-Report keine Errors oder defekten Links. Neun geprüfte Warnungen zur generierten Suchseite und zur vorgegebenen CH-Term-Version sind mit Begründung hinterlegt. Drei Hinweise betreffen OIDs und eine geerbte veraltete Extension. Der aktuelle Prüfstand steht im verlinkten QA-Report.

## Grundlagen

* FHIR R4 4.0.1
* [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/)
* [CH Term 3.3.0](https://fhir.ch/ig/ch-term/3.3.0/)
* [FHIR Shorthand](https://hl7.org/fhir/uv/shorthand/)

Diese Arbeit ist eine Übungsabgabe und kein offizieller Standard.
