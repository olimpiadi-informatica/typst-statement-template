#let localization = (
  "Solution": "Sprendimas",
  "PageXofY": (count, total) => "Puslapis " + str(count) + " iš " + str(total),
  "Subtask": it => "Dalinė užduotis " + str(it),
  "Day": it => str(it) + " diena",
  "TimeLimit": "Laiko apribojimas",
  "MemoryLimit": "Atminties apribojimas",
  "stdin": "standartinė įvestis",
  "stdout": "standartinė išvestis",
  "Examples": "Pavyzdžiai",
  "Explanation": "Paaiškinimas",
  "Implementation": "Implementacija",
  "Scoring": "Vertinimas",
  "Constraints": "Apribojimai",
  "points": n => if calc.rem(n, 10) == 1 and calc.rem(n, 100) != 11 {
    "taškas"
  } else if calc.rem(n, 10) >= 2
    and (calc.rem(n, 100) < 10 or calc.rem(n, 100) >= 20) {
    "taškai"
  } else {
    "taškų"
  },
  "IntentionallyBlankPage": "Šis puslapis paliktas tuščias specialiai",
  "seconds": "sekundės",
  "SampleGrader": "Pavyzdinis graderis",
  "Grader": "Graderis",
)
