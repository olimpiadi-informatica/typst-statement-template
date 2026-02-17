#let localization = (
  "Solution": "Rozwiązanie",
  "PageXofY": (count, total) => "Strona " + str(count) + " z " + str(total),
  "Subtask": it => "Podzadanie " + str(it),
  "Day": it => "Dzień " + str(it),
  "TimeLimit": "Limit czasu",
  "MemoryLimit": "Limit pamięci",
  "stdin": "standardowy wejście",
  "stdout": "standardowy wyjście",
  "Examples": "Przykłady",
  "Explanation": "Wyjaśnienie",
  "Implementation": "Implementacja",
  "Scoring": "Punktacja",
  "Constraints": "Ograniczenia",
  "points": n =>
    if n == 1 {
      "punkt"
    } else {
      if (calc.rem(n, 10) > 1 and calc.rem(n, 10) < 5) and not (10 <= calc.rem(n, 100) and calc.rem(n, 100) < 20) {
        "punkty"
      } else {
        "punktów"
      }
    },
  "IntentionallyBlankPage": "Ta strona została celowo pozostawiona pusta",
  "seconds": "sekundy",
  "SampleGrader": "Przykładowa sprawdzaczka",
  "Grader": "Sprawdzaczka",
)