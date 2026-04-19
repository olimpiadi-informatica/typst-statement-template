#let localization = (
  "Solution": "Řešení",
  "PageXofY": (count, total) => "Strana " + str(count) + " z " + str(total),
  "Subtask": it => "Podúloha " + str(it),
  "Day": it => "Den " + str(it),
  "TimeLimit": "Časový limit",
  "MemoryLimit": "Paměťový limit",
  "stdin": "standardní vstup",
  "stdout": "standardní výstup",
  "Examples": "Příklady",
  "Explanation": "Vysvětlení",
  "Implementation": "Implementace",
  "Scoring": "Bodování",
  "Constraints": "Omezení",
  "points": n => if n == 1 { "bod" } else if n >= 2 and n <= 4 { "body" } else {
    "bodů"
  },
  "IntentionallyBlankPage": "Tato stránka je záměrně prázdná",
  "seconds": "sekund",
  "SampleGrader": "Ukázkový grader",
  "Grader": "Grader",
)
