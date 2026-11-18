Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie für den Austausch zwischen Hausarztpraxis und Notfallstation."

// 1: Ich beschränke das Profil auf genau eine Kategorie: Arzneimittel.
* category 1..1
* category = #medication

// 2: Der klinische Status ist für jede Allergie verpflichtend.
* clinicalStatus 1..1

// 3: Das extensible Binding lässt bei fehlendem passenden Begriff eine Alternative zu.
* code 1..1
* code from $ch-allergy-vs (extensible)

// 4: Für die Notfallstation verlange ich die Kritikalität und Must Support.
* criticality 1..1 MS

// 5: Den Beginn lasse ich optional als Datum oder Alter zu.
* onset[x] only dateTime or Age
* onset[x] MS

// 6: Die erfassende Person muss als CH Core Practitioner referenziert sein.
* recorder 1..1
* recorder only Reference(CHCorePractitioner)

// 7: Reaktionen bleiben optional, müssen aber von den Systemen unterstützt werden.
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

// Die vorgegebene Invariante verlangt bei bestätigter Allergie eine Reaktion.
* obeys dg-allergy-1
