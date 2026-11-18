Instance: PenicillinAllergieAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Bestätigte Penicillinallergie bei Anna Muster"
Description: "Penicillinallergie mit Urtikaria und Beginn im Alter von 30 Jahren. Die hohe Kritikalität ist eine angenommene ärztliche Einschätzung."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#confirmed
* code = $sct#91936005 "Allergy to penicillin (finding)"
* criticality = #high
* onsetAge = 30 'a' "Jahre"
* recorder = Reference(DrSaraKeller)
* reaction.manifestation = $sct#126485001 "Urticaria (disorder)"

Instance: BenzylpenicillinVerdachtAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Unbestätigte Benzylpenicillinallergie bei Anna Muster"
Description: "Alternatives, fiktives Beispiel: Allergieverdacht mit bekanntem Beginnjahr, noch ohne dokumentierte Reaktion."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#unconfirmed
* code = $sct#294499007 "Allergy to benzylpenicillin (finding)"
* criticality = #unable-to-assess
* onsetDateTime = "2015"
* recorder = Reference(DrSaraKeller)
