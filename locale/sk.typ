#let localization = (
  "Solution": "Riešenie",
  "PageXofY": (count, total) => "Strana " + str(count) + " z " + str(total),
  "Subtask": it => "Podúloha " + str(it),
  "Day": it => "Deň " + str(it),
  "TimeLimit": "Časový limit",
  "MemoryLimit": "Pamäťový limit",
  "stdin": "štandardný vstup",
  "stdout": "štandardný výstup",
  "Examples": "Príklady",
  "Explanation": "Vysvetlenie",
  "Implementation": "Implementácia",
  "Scoring": "Bodovanie",
  "Constraints": "Obmedzenia",
  "points": n => if n == 1 { "bod" } else if n >= 2 and n <= 4 { "body" } else {
    "bodov"
  },
  "IntentionallyBlankPage": "Táto strana je zámerne prázdna",
  "seconds": "sekúnd",
  "SampleGrader": "Ukážkový grader",
  "Grader": "Grader",
)
