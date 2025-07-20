#import "@preview/unify:0.7.0": *

// Section names, with translations
#let localize(lang, string) = {
  let localization = (
    "Solution": (
      "nl": "Oplossing",
      "en": "Solution",
      "fr": "Solution",
      "de": "Lösung",
      "hu": "Megoldás",
      "it": "Soluzione",
      "pt": "Solução",
      "es": "Solución",
      "lb": "Léisung",
    ),
    "PageXofY": (
      "nl": (count, total) => "Pagina " + str(count) + " van " + str(total),
      "en": (count, total) => "Page " + str(count) + " of " + str(total),
      "fr": (count, total) => "Page  " + str(count) + " de " + str(total),
      "de": (count, total) => "Seite " + str(count) + " von " + str(total),
      "hu": (count, total) => str(count) + " / " + str(total) + ". oldal",
      "it": (count, total) => "Pagina " + str(count) + " di " + str(total),
      "pt": (count, total) => "Página " + str(count) + " de " + str(total),
      "es": (count, total) => "Página " + str(count) + " de " + str(total),
      "lb": (count, total) => "Säit " + str(count) + " vun " + str(total),
    ),
    "Subtask": (
      "nl": it => "Subtask " + str(it),
      "en": it => "Subtask " + str(it),
      "fr": it => "Sous-tâche " + str(it),
      "de": it => "Teilaufgabe " + str(it),
      "hu": it => str(it) + ". Részfeladat",
      "it": it => "Subtask " + str(it),
      "pt": it => "Subtarefa " + str(it),
      "es": it => "Subtask " + str(it),
      "lb": it => "Subtask " + str(it),
    ),
    "Day": (
      "nl": it => "Dag " + str(it),
      "en": it => "Day " + str(it),
      "fr": it => "Jour " + str(it),
      "de": it => "Tag " + str(it),
      "hu": it => str(it) + ". Nap",
      "it": it => "Giorno " + str(it),
      "pt": it => "Dia " + str(it),
      "es": it => "Día " + str(it),
      "lb": it => "Dag " + str(it),
    ),
    "Problem": (
      "nl": it => "Probleem " + str(it),
      "en": it => "Problem " + str(it),
      "fr": it => "Problème " + str(it),
      "de": it => "Aufgabe " + str(it),
      "hu": it => str(it) + ". Feladat",
      "it": it => "Problema " + str(it),
      "pt": it => "Problema " + str(it),
      "es": it => "Problema " + str(it),
      "lb": it => "Problem " + str(it),
    ),
    "ProblemAuthor": (
      "nl": "Auteur",
      "en": "Author",
      "fr": "Auteur",
      "de": "Autor",
      "hu": "Szerző",
      "it": "Autore",
      "pt": "Autor",
      "es": "Autor",
      "lb": "Auteur",
    ),
    "ProblemOrigin": (
      "nl": "Bron",
      "en": "Origin",
      "fr": "Origine",
      "de": "Herkunft",
      "hu": "Forrás",
      "it": "Origine",
      "pt": "Origem",
      "es": "Origen",
      "lb": "Origine",
    ),
    "InputFileName": (
      "nl": "Input file",
      "en": "Input file",
      "fr": "Fichier d'entrée",
      "de": "Eingabedatei",
      "hu": "Bemeneti fájl",
      "it": "File di input",
      "pt": "Ficheiro de input",
      "es": "Archivo de entrada",
      "lb": "Input-Fichier",
    ),
    "OutputFileName": (
      "nl": "Output file",
      "en": "Output file",
      "fr": "Fichier de sortie",
      "de": "Ausgabedatei",
      "hu": "Kimeneti fájl",
      "it": "File di output",
      "pt": "Ficheiro de output",
      "es": "Archivo de salida",
      "lb": "Output-Fichier",
    ),
    "TimeLimit": (
      "nl": "Tijdslimiet",
      "en": "Time limit",
      "fr": "Limite de temps",
      "de": "Zeitlimit",
      "hu": "Időlimit",
      "it": "Limite di tempo",
      "pt": "Limite de tempo",
      "es": "Límite de tiempo",
      "lb": "Zäitlimitt",
    ),
    "MemoryLimit": (
      "nl": "Geheugenlimiet",
      "en": "Memory limit",
      "fr": "Limite de mémoire",
      "de": "Speicherlimit",
      "hu": "Memória limit",
      "it": "Limite di memoria",
      "pt": "Limite de memória",
      "es": "Límite de memoria",
      "lb": "Späicherlimitt",
    ),
    "Difficulty": (
      "nl": "Moeilijkheid",
      "en": "Difficulty",
      "fr": "Difficulté",
      "de": "Schwierigkeitsgrad",
      "hu": "Nehézségi szint",
      "it": "Difficoltà",
      "pt": "Dificuldade",
      "es": "Dificultad",
      "lb": "Schwieregkeetsgrad",
    ),
    "Feedback": (
      "nl": "Feedback",
      "en": "Feedback",
      "fr": "Retour",
      "de": "Feedback",
      "hu": "Visszajelzés",
      "it": "Feedback",
      "pt": "Feedback",
      "es": "Feedback",
      "lb": "Feedback",
    ),
    "stdin": (
      "nl": "standard input",
      "en": "standard input",
      "fr": "entrée standard",
      "de": "Standardeigabe",
      "hu": "standard bemenet",
      "it": "standard input",
      "pt": "standard input",
      "es": "standard input",
      "lb": "Standard Input",
    ),
    "stdout": (
      "nl": "standard output",
      "en": "standard output",
      "fr": "sortie standard",
      "de": "Standardausgabe",
      "hu": "standard kimenet",
      "it": "standard output",
      "pt": "standard output",
      "es": "standard output",
      "lb": "Standard Output",
    ),
    "Specification": (
      "nl": "Specificatie",
      "en": "Specification",
      "fr": "Spécification",
      "de": "Spezifikation",
      "hu": "Specifikáció",
      "it": "Descrizione",
      "pt": "Especificação",
      "es": "Descripción",
      "lb": "Beschreiwung",
    ),
    "Input": (
      "nl": "Invoer",
      "en": "Input",
      "fr": "Entrée",
      "de": "Eingabe",
      "hu": "Bemenet",
      "it": "Dati di input",
      "pt": "Input",
      "es": "Datos de entrada",
      "lb": "Input",
    ),
    "Output": (
      "nl": "Uitvoer",
      "en": "Output",
      "fr": "Sortie",
      "de": "Ausgabe",
      "hu": "Kimenet",
      "it": "Dati di output",
      "pt": "Output",
      "es": "Datos de salida",
      "lb": "Output",
    ),
    "Example": (
      "nl": "Voorbeeld",
      "en": "Example",
      "fr": "Exemple",
      "de": "Beispiel",
      "hu": "Példa",
      "it": "Esempio di input/output",
      "pt": "Exemplo",
      "es": "Ejemplo de entrada/salida",
      "lb": "Beispill",
    ),
    "Examples": (
      "nl": "Voorbeelden",
      "en": "Examples",
      "fr": "Exemples",
      "de": "Beispiele",
      "hu": "Példák",
      "it": "Esempi di input/output",
      "pt": "Exemplos",
      "es": "Ejemplos de entrada/salida",
      "lb": "Beispiller",
    ),
    "ExampleNotes": (
      "nl": "Let op",
      "en": "Notes",
      "fr": "Notes",
      "de": "Bemerkungen",
      "hu": "Megjegyzések",
      "it": "Note",
      "pt": "Notas",
      "es": "Notas",
      "lb": "Bemierkungen",
    ),
    "Explanation": (
      "nl": "Uitleg",
      "en": "Explanation",
      "fr": "Explication",
      "de": "Erklärung",
      "hu": "Magyarázat",
      "it": "Spiegazione",
      "pt": "Explicação",
      "es": "Explicación",
      "lb": "Erklärung",
    ),
    "Explanations": (
      "nl": "Uitleg",
      "en": "Explanations",
      "fr": "Explications",
      "de": "Erklärungen",
      "hu": "Magyarázat",
      "it": "Spiegazioni",
      "pt": "Explicações",
      "es": "Explicaciones",
      "lb": "Erklärungen",
    ),
    "Illustration": (
      "nl": "Illustratie",
      "en": "Illustration",
      "fr": "Illustration",
      "de": "Abbildung",
      "hu": "Szemléltetés",
      "it": "Illustrazione",
      "pt": "Ilustração",
      "es": "Ilustración",
      "lb": "Illustratioun",
    ),
    "Implementation": (
      "nl": "Implementatie",
      "en": "Implementation",
      "fr": "Implémentation",
      "de": "Implementierung",
      "hu": "Implementáció",
      "it": "Implementazione",
      "pt": "Implementação",
      "es": "Implementación",
      "lb": "Implementéirung",
    ),
    "Scoring": (
      "nl": "Scoring",
      "en": "Scoring",
      "fr": "Score",
      "de": "Punktevergabe",
      "hu": "Pontozás",
      "it": "Assegnazione del punteggio",
      "pt": "Pontuação",
      "es": "Puntuación",
      "lb": "Punkteverdeelung",
    ),
    "Note": (
      "nl": "Let op",
      "en": "Note",
      "fr": "Note",
      "de": "Bemerkung",
      "hu": "Megjegyzés",
      "it": "Note",
      "pt": "Nota",
      "es": "Notas",
      "lb": "Bemierkung",
    ),
    "Notes": (
      "nl": "Let op",
      "en": "Notes",
      "fr": "Notes",
      "de": "Bemerkungen",
      "hu": "Megjegyzések",
      "it": "Note",
      "pt": "Notas",
      "es": "Notas",
      "lb": "Bemierkungen",
    ),
    "Constraints": (
      "nl": "Randvoorwaarden",
      "en": "Constraints",
      "fr": "Contraintes",
      "de": "Einschränkungen",
      "hu": "Korlátok",
      "it": "Assunzioni",
      "pt": "Restrições",
      "es": "Restricciones",
      "lb": "Contrainten",
    ),
    "points": (
      "nl": "punten",
      "en": "points",
      "fr": "points",
      "de": "Punkte",
      "hu": "pont",
      "it": "punti",
      "pt": "pontos",
      "es": "puntos",
      "lb": "Punkten",
    ),
    "notstated": (
      "nl": "niet vermeld",
      "en": "not stated",
      "fr": "non déclaré",
      "de": "not stated",
      "hu": "nincs tisztázva",
      "it": "non specificato",
      "pt": "não indicado",
      "es": "no especificado",
      "lb": "net uginn",
    ),
    "IntentionallyBlankPage": (
      "nl": "Deze pagina is bewust leeg",
      "en": "This page is intentionally left blank",
      "fr": "Cette page est intentionnellement laissée vide",
      "de": "Diese Seite ist absichtlich leer gelassen",
      "hu": "Ez az oldal szándékosan maradt üresen",
      "it": "pagina intenzionalmente vuota",
      "pt": "Esta página foi intencionalmente deixada em branco",
      "es": "página intencionalmente en blanco",
      "lb": "Dës Säit ass absichtlech wäiss",
    ),
    "defaultinputname": (
      "nl": "test",
      "en": "test",
      "fr": "test",
      "de": "Test",
      "hu": "teszteset",
      "it": "test",
      "pt": "teste",
      "es": "test",
      "lb": "Test",
    ),
    "defaultoutputname": (
      "nl": "antwoord",
      "en": "answer",
      "fr": "answer",
      "de": "Antwort",
      "hu": "válasz",
      "it": "risposta",
      "pt": "resposta",
      "es": "respuesta",
      "lb": "Äntwert",
    ),
    "revision": (
      "nl": "v",
      "en": "v",
      "fr": "v",
      "de": "v",
      "hu": "v",
      "it": "v",
      "pt": "v",
      "es": "v",
      "lb": "v",
    ),
    "seconds": (
      "nl": "seconden",
      "en": "seconds",
      "fr": "secondes",
      "de": "Sekunden",
      "hu": "másodperc",
      "it": "secondi",
      "pt": "segundos",
      "es": "segundos",
      "lb": "Sekunden",
    ),
    "SampleGrader": (
      "nl": "Voorbeeld Grader",
      "en": "Sample Grader",
      "fr": "Évaluateur",
      "de": "Beispielgrader",
      "hu": "Minta Értékelő",
      "it": "Grader di prova",
      "pt": "Avaliador Padrão",
      "es": "Sample Grader",
      "lb": "Beispill-Grader",
    ),
    "Grader": (
      "nl": "Grader",
      "en": "Grader",
      "fr": "Évaluateur",
      "de": "Grader",
      "hu": "Értékelő",
      "it": "Grader",
      "pt": "Avaliador",
      "es": "Grader",
      "lb": "Grader",
    ),
  )

  let english = localization.at(string).at("en")
  localization.at(string).at(lang, default: english)
}

#let implementation = context [
  == #localize(text.lang, "Implementation") <implementation>
]
#let samplegrader = context [
  == #localize(text.lang, "SampleGrader") <samplegrader>
]
#let constraints = context [
  == #localize(text.lang, "Constraints") <constraint>
]
#let scoring = context [
  == #localize(text.lang, "Scoring") <scoring>
]
#let explanation = context [
  == #localize(text.lang, "Explanation") <explanation>
]
#let solution = context [
  == #localize(text.lang, "Solution") <solution>
]


// Main show rule for statements
#let statement(doc) = {
  show math.equation.where(block: false): it => box(it)
  set text(size: 11pt, font: ("Latin Modern Roman",))
  // raw text defaults to 80% smaller, undo that.
  show raw: set text(size: 1.25em, font: ("Latin Modern Mono"))
  set par(justify: true)
  set list(indent: 17pt, body-indent: 7pt)
  set enum(indent: 17pt, body-indent: 7pt)
  show heading.where(level: 1): h => [ #h #v(7pt) ]
  
  let contest_yaml = sys.inputs.at("contest_yaml", default: none);
  let contest_yaml = if contest_yaml != none {
    yaml(contest_yaml);
  } else {
    (logo: none)
  }

  let contest_description = contest_yaml.at("description", default: none);
  let contest_location = contest_yaml.at("location", default: none);
  let date = contest_yaml.at("date", default: none); 
  let logo = contest_yaml.at("logo", default: none);
  let show_summary = contest_yaml.at("show_summary", default: false)

  let task_yaml = yaml(sys.inputs.at("task_yaml", default: "../task.yaml"));
  let name = task_yaml.at("name", default: "noname");
  let title = task_yaml.at("title", default: "No Name");
  let time_limit = task_yaml.at("time_limit", default: 0);
  let memory_limit = task_yaml.at("memory_limit", default: 0);
  let syllabus = task_yaml.at(
    "syllabuslevel", 
    // incoherence between tmr internal serializer and task.yaml
    default: task_yaml.at("syllabus_level", default: none)
  )

  let syllabus_text = context {
    if syllabus != none {
      for _ in range(0, syllabus) {
        text("🕮", fill: orange)
      }
      for _ in range(syllabus, 5) {
        text("🕮", fill: gray)
      }
    }
  }

  let header_text = context [
    #set text(size: 15pt)
    #contest_description #h(1fr) #syllabus_text

    #v(-7pt)
    #line(length: 100%, stroke: 0.1pt)
    #v(-5pt)

    #set text(size: 11pt)
    #{
      if contest_location != none and date != none {
        [#contest_location, #date]
      } else {
        [#contest_location #date]
      }
    }
    #h(1fr) #strong(raw(name)) #h(3pt) #sym.circle.filled #h(3pt) #strong(raw(upper(text.lang)))
  ];

  let footer_text = context [
    #set text(size: 10pt)
    #line(length: 100%, stroke: 0.1pt)
    #v(-5pt)
    #raw(name) #h(1fr) #localize(text.lang, "PageXofY")(here().page(), counter(page).final().at(0))
  ]

  let summary_text = context [
    #h(1cm) #localize(text.lang, "TimeLimit"): $#time_limit$ #localize(text.lang, "seconds") \
    #h(1cm) #localize(text.lang, "MemoryLimit"): $#memory_limit" MiB"$\
  ]

  set page(margin: 2cm, footer: footer_text)

  // Since multiple statements could be condensed into
  // a single booklet, we pagebreak before every new task
  pagebreak(weak: true)

  if logo != none {
    grid(columns: 2, rows: (50pt), image(logo), header_text,
      column-gutter: 5pt,
      align: horizon
    )
  } else {
    block(height: 50pt, header_text)
  }

  heading([ #title (#raw(name)) ])

  if show_summary {
    summary_text
  }

  doc
}

// Main show rule for editorials
#let editorial(doc) = {
  show math.equation.where(block: false): it => box(it)
  set text(size: 11pt, font: ("Latin Modern Roman",))
  // raw text defaults to 80% smaller, undo that.
  show raw: set text(size: 1.25em, font: ("Latin Modern Mono"))
  set par(justify: true)
  set list(indent: 17pt, body-indent: 7pt)
  set enum(indent: 17pt, body-indent: 7pt)
  show heading.where(level: 1): h => [ #h #v(7pt) ]

  let contest_yaml = sys.inputs.at("contest_yaml", default: none);
  let contest_yaml = if contest_yaml != none {
    yaml(contest_yaml);
  } else {
    (logo: none)
  }

  let show_solution_contest_yaml = contest_yaml.at("show_solutions", default: false)
  
  let task_yaml = yaml(sys.inputs.at("task_yaml", default: "../task.yaml"));
  let name = task_yaml.at("name", default: "noname");

  let footer_text = context [
    #set text(size: 10pt)
    #line(length: 100%, stroke: 0.1pt)
    #v(-5pt)
    #raw(name) #h(1fr) Pagina #here().page() di #counter(page).final().at(0)
  ]

  set page(margin: 2cm, footer: footer_text, fill: luma(200))

  let show_solution = sys.inputs.at("show_solutions", default: none)
  if show_solution == none and not show_solution_contest_yaml {
    return;
  }

  // Since multiple statements could be condensed into
  // a single booklet, we pagebreak before every new task
  pagebreak(weak: true)

  solution

  doc
}

#let infile = {
  let file = yaml(sys.inputs.at("task_yaml", default: "../task.yaml")).at("infile", default: "");
  if file == "" { "stdin" } else { file }
}

#let outfile = {
  let file = yaml(sys.inputs.at("task_yaml", default: "../task.yaml")).at("outfile", default: "");
  if file == "" { "stdout" } else { file }
}

#let task_name = yaml("../task.yaml").at("name", default: "");

// Subtask constraints and scores

#let constraint = {
  let constraints_yaml = sys.inputs.at("constraints_yaml", default: "../gen/constraints.yaml")
  let constraints = yaml(constraints_yaml)

  for (name, constraint) in constraints.pairs() {
    if type(constraint) == int and constraint >= 10000 {
      constraints.insert(name, num(constraint, thousandsep: "#h(0.133333em)"))
    }
  }

  for (i, subtask) in constraints.subtask.enumerate() {
    for (name, constraint) in subtask.pairs() {
      if type(constraint) == int and constraint >= 10000 {
        subtask.insert(name, num(constraint, thousandsep: "#h(0.133333em)"))
      }
    }
    constraints.subtask.at(i) = subtask
  }

  constraints
}

#let subtasks(subtask_descriptions, index_start: 1) = {
  let gen_gen = sys.inputs.at("gen_gen", default: "../gen/GEN");
  let gen_gen = read(gen_gen)
  let lines = gen_gen.split("\n");
  let scores = lines.filter(l => l.starts-with("#ST:")).map(l => int(l.slice(5).trim()))
  assert.eq(
    scores.len(),
    constraint.subtask.len() - 1,
  );
  assert.eq(
    scores.len(),
    subtask_descriptions.len(),
  );

  let indices = array.range(scores.len());

  context {
    let st = localize(text.lang, "Subtask");

    let max_subtask_idx_len = indices.map(idx => {
      measure([*#{st(idx+index_start)}*]).width
    }).sorted().last();
    let max_subtask_score_len = scores.map(score => {
      measure([*#score*]).width
    }).sorted().last();
    let subtasks = array.zip(
      constraint.subtask.slice(1),
      scores,
      subtask_descriptions,
      indices
    ).map(((cnst, score, desc, index)) => {
      for (key, value) in constraint {
        if key != "subtask" and cnst.at(key, default: none) == none {
          cnst.insert(key, value);
        }
      }
      let description = desc(cnst);
      let stidx = box(width: max_subtask_idx_len, [#{st(index+index_start)}])
      let score = [#box(width: max_subtask_score_len, [#h(1fr) #score]) #localize(text.lang, "points")];
      let subtask_intro = [#stidx [#score]];
      (subtask_intro, description)
    });
    let max_intro_len = subtasks.map(((intro, _)) => {
      measure([*#intro*:]).width
    }).sorted().last();
    for (intro, description) in subtasks {
      [ - #box(width: max_intro_len, [*#intro*:]) #description ]
    }
  }
}

#let ois_subtasks(subtask_descriptions, subtask_syllabus_levels, index_start: 1) = {
  let gen_gen = sys.inputs.at("gen_gen", default: "../gen/GEN");
  let gen_gen = read(gen_gen)
  let lines = gen_gen.split("\n");
  let scores = lines.filter(l => l.starts-with("#ST:")).map(l => int(l.slice(5)))
  assert.eq(
    scores.len(),
    constraint.subtask.len() - 1,
  );
  assert.eq(
    scores.len(),
    subtask_descriptions.len(),
  );
  assert.eq(
    scores.len(),
    subtask_syllabus_levels.len(),
  );

  let indices = array.range(scores.len());

  context {
    let st = localize(text.lang, "Subtask");

    let subtasks = array.zip(
      constraint.subtask.slice(1),
      scores,
      subtask_descriptions,
      indices
    ).map(((cnst, score, desc, index)) => {
      for (key, value) in constraint {
        if key != "subtask" and cnst.at(key, default: none) == none {
          cnst.insert(key, value);
        }
      }
      let description = desc(cnst);
      let stidx = [#st(index+index_start)]
      let score = [(#score #localize(text.lang, "points"))];
      let subtask_intro = [*#stidx* #score];
      (subtask_intro, description)
    });
    for ((intro, description), syllabus) in subtasks.zip(subtask_syllabus_levels) {
      [ - #grid(
        columns: (1fr, 2.2fr),
        rows: (1em, 1.6em),
        [#intro],
        grid.cell(
          rowspan: 2,
          [#description]
        ),
        {
          for _ in range(0, syllabus) {
            text("🕮", fill: orange)
          }
          for _ in range(syllabus, 5) {
            text("🕮", fill: gray)
          }
        }
      )]
    }
  }
}

// Useful commands

#let template_box(stroke_color, background_color, icon, content) = {
  block(
    stroke: 2pt + stroke_color,
    fill: background_color,
    inset: 8pt,
    radius: 2pt,
    grid(
      columns: (0pt, 20pt, 1fr),
      rows: 1,
      column-gutter: (5pt, 10pt),
      align: (auto, horizon + center, horizon),
      [],
      icon,
      content
    )
  )
}

#let note(content) = {
  template_box(luma(123), none, text(size: 1.7em, sym.arrow.r.stroked), content)
}

#let warn(content) = {
  template_box(
    orange,
    rgb(255, 0, 0, 50), 
    block(
      width: 2em,
      height: 2em,
      [
        #place(horizon + center, dy: 0.1em, text(size: 1.5em, [*!*]))
        #place(horizon + center, dy: -0.6em, text(size: 5em, sym.triangle.t.stroked))
      ]
    ),
    content
  )
}

#let signatures(language_signatures) = {
  let lang_name = (
    "c": "C",
    "cpp": "C++",
    "cs": "C#",
    "go": "Go",
    "hs": "Haskell",
    "java": "Java",
    "js": "Javascript",
    "pas": "Pascal",
    "py": "Python",
    "rs": "Rust"
  );
  table(
    columns: (70pt, 1fr),
    stroke: 0.1pt + black,
    fill: luma(240),
    inset: 8pt,
    align: (center + horizon, horizon),
    ..for (lang, sig) in language_signatures { (lang_name.at(lang), raw(sig, lang: lang)) }
  )
}

#let examples(num) = {
  context [== #localize(text.lang, "Examples") <examples>]

  let name = yaml("../task.yaml").name;

  table(
    columns: (1fr, 1fr), 
    rows: num + 1,
    stroke: 0.1pt + black,
    align: (x, y) => {
      if y == 0 { center } else { auto }
    },
    fill: (x, y) => {
      if y == 0 { luma(240) } else { luma(250) }
    },
    table.header(
      raw(infile),
      raw(outfile),
    ),
    ..for i in array.range(num) {
      let infile = name + ".input" + str(i) + ".txt";
      let outfile = name + ".output" + str(i) + ".txt";
      (box(raw(read(infile))), box(raw(read(outfile))))
    }
  )
}

#let examples-interactive(num) = {
  context [== #localize(text.lang, "Examples") <examples>]

  let name = yaml("../task.yaml").name;

  for i in array.range(num) {
    let file = name + ".interaction" + str(i) + ".txt";
    let lines = ();
    for line in read(file).split("\n") {
      if line.len() < 1 {
        continue;
      }
      if line.starts-with("<") {
        if lines.len() == 0 or not lines.at(lines.len()-1).at(1) {
          lines.push(((), true))
        }
      } else if line.starts-with(">") {
        if lines.len() == 0 or lines.at(lines.len()-1).at(1) {
          lines.push(((), false))
        }
      } else {
        panic("Example " + str(i+1) + ": line " + line + " starts with neither < nor >")
      }
      lines.at(lines.len()-1).at(0).push(line.slice(1));
    }

    block(
      breakable: false,
      table(
        columns: (1fr, 0.0fr, 1fr),
        stroke: none,
        row-gutter: 3pt,
        align: (x, y) => {
          if y == 0 { center } else { auto }
        },
        table.header(
          context strong(localize(text.lang, "Grader")),
          [],
          context strong(localize(text.lang, "Solution")),
        ),
        ..for (l, is_input) in lines {
          let cell = table.cell(stroke: 0.1pt + black, colspan: 2, fill: luma(250), raw(l.join("\n")));
          let pat-col = luma(245);
          let pat-col2 = luma(255);
          let pat = tiling(
            size: (15pt, 15pt),
            relative: "parent",
            rect(fill: gradient.linear(angle: 45deg, pat-col, pat-col2, pat-col, pat-col2).sharp(4))
          );
          let placeholder = table.cell(fill: pat, []);
          if is_input {
            (cell, placeholder)
          } else {
            (placeholder, cell)
          }
        }
      )
    )
  }
}
