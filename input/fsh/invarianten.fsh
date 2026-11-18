// Vorgegebene Invariante aus dem Aufgabenblatt. Ich binde sie im Profil
// mit obeys ein; der IG Publisher prüft sie bei der Beispielvalidierung.

Invariant: dg-allergy-1
Description: "Eine bestätigte Allergie muss mindestens eine Reaktion dokumentieren."
Severity: #error
Expression: "verificationStatus.coding.where(code = 'confirmed').exists() implies reaction.exists()"
