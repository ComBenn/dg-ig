Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie für den Austausch zwischen Hausarztpraxis und Notfallstation."

// 1: Genau eine Kategorie; ausschliesslich Arzneimittel.
* category 1..1
* category = #medication

// 2: Der klinische Status muss immer vorhanden sein.
* clinicalStatus 1..1

// 3: Passende Schweizer Codes verwenden; Ausweichmöglichkeit bleibt.
* code 1..1
* code from $ch-allergy-vs (extensible)

// 4: Kritikalität muss angegeben und unterstützt werden.
* criticality 1..1 MS

// 5: Beginn optional als Datum oder Alter.
* onset[x] only dateTime or Age
* onset[x] MS

// 6: Die erfassende Person ist verpflichtend.
* recorder 1..1
* recorder only Reference(CHCorePractitioner)

// 7: Bekannte Reaktionen und ihre Symptome unterstützen.
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

* obeys dg-allergy-1
