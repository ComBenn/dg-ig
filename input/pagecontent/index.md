### Use Case

Eine Hausarztpraxis dokumentiert Arzneimittelallergien strukturiert. Eine Notfallstation liest diese Angaben, um bekannte Allergien bei der Medikamentenwahl zu berücksichtigen. Übermittelt werden das Allergen, der klinische Status, die Kritikalität, der bekannte Beginn, die erfassende Person und dokumentierte Reaktionen.

### Scope

Dieses Implementation Guide beschreibt einzelne Arzneimittelallergien auf Basis von FHIR R4 und CH Core. Andere Allergiekategorien, die vollständige Medikationsliste, diagnostische Abläufe und automatische Therapieempfehlungen liegen ausserhalb des Umfangs. Alle Beispieldaten sind fiktiv; die beiden Allergiebeispiele zeigen alternative Dokumentationssituationen.

### Profilentscheidungen

| Anforderung | Umsetzung und Begründung |
|---|---|
| Arzneimittelallergie | Genau eine Kategorie mit dem Wert `medication`. |
| Klinischer Status | `clinicalStatus` ist verpflichtend. |
| Schweizer Allergieliste | `code` ist verpflichtend und extensible gebunden. Ein passender ValueSet-Code muss verwendet werden; fehlt ein passender Begriff, sind andere Codes oder eine textuelle Erfassung möglich. |
| Kritikalität | `criticality` ist verpflichtend und Must Support. Bei fehlender Einschätzbarkeit wird `unable-to-assess` verwendet. |
| Beginn | Optional als `dateTime` oder `Age`, mit Must Support. Unbekannter Beginn darf fehlen; ein Datum darf auch nur das bekannte Jahr enthalten. |
| Erfassende Person | `recorder` ist verpflichtend und verweist auf CH Core Practitioner. Die ärztliche Qualifikation muss im erfassenden System organisatorisch geprüft werden; der Ressourcentyp allein weist sie nicht nach. |
| Reaktionen | `reaction` und `reaction.manifestation` sind Must Support. Symptome sind extensible an die Schweizer Symptomliste gebunden. Eine vorhandene Reaktion muss gemäss FHIR mindestens eine Manifestation enthalten. |

Must Support verpflichtet in diesem IG schreibende Systeme, die gekennzeichneten Angaben bei Verfügbarkeit zu erfassen und zu übermitteln. Lesende Systeme müssen sie verarbeiten und für die fachliche Beurteilung zugänglich machen. Must Support allein verpflichtet nicht zur Angabe in jeder Instanz.

Die vorgegebene Invariante `dg-allergy-1` verlangt bei einer bestätigten Allergie mindestens eine Reaktion. Bei unbestätigten Allergien bleiben Reaktionen optional. Ein Verdacht wird nicht allein wegen fehlender Reaktionsdaten als bestätigt dokumentiert.

### Artefakte

* [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html): Profil für den Austausch von Arzneimittelallergien.
* [Bestätigte Penicillinallergie](AllergyIntolerance-PenicillinAllergieAnna.html): Beispiel mit Urtikaria und Beginn im Alter von 30 Jahren. Die hohe Kritikalität ist eine angenommene ärztliche Einschätzung und folgt nicht automatisch aus der Urtikaria.
* [Unbestätigte Benzylpenicillinallergie](AllergyIntolerance-BenzylpenicillinVerdachtAnna.html): Alternatives Beispiel ohne bekannte Reaktion, mit Beginnjahr 2015 und noch nicht einschätzbarer Kritikalität.

Die Patientin Anna Muster und die Ärztin Dr. Sara Keller werden aus den vorgegebenen CH-Core-Basisbeispielen referenziert.

### Abhängigkeiten

* FHIR R4, Version 4.0.1
* [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/)
* [CH Term 3.3.0](https://fhir.ch/ig/ch-term/3.3.0/)

### Autor

Benjamin Kaiser, ZHAW, Modul Data Standards in Healthcare, HS26.

Dieser Implementation Guide ist eine Übungsarbeit und kein offizieller Standard.

### Technische Abhängigkeiten

{% include dependency-table.xhtml %}

{% include globals-table.xhtml %}

### Terminologie und Nutzungsrechte

{% include ip-statements.xhtml %}

### FHIR-Versionen

{% include cross-version-analysis-inline.xhtml %}
