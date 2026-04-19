#let localization = (
  "Solution": "Rješenje",
  "PageXofY": (count, total) => "Stranica " + str(count) + " od " + str(total),
  "Subtask": it => "Podzadatak " + str(it),
  "Day": it => "Dan " + str(it),
  "TimeLimit": "Vremensko ograničenje",
  "MemoryLimit": "Memorijsko ograničenje",
  "stdin": "standardni ulaz",
  "stdout": "standardni izlaz",
  "Examples": "Primjeri",
  "Explanation": "Objašnjenje",
  "Implementation": "Implementacija",
  "Scoring": "Bodovanje",
  "Constraints": "Ograničenja",
  "points": n => if n == 1 { "bod" } else if n >= 2 and n <= 4 { "boda" } else {
    "bodova"
  },
  "IntentionallyBlankPage": "Ova stranica je namjerno ostavljena prazna",
  "seconds": "sekundi",
  "SampleGrader": "Primjer gradera",
  "Grader": "Grader",
)
