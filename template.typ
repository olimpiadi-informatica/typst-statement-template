#import "@preview/unify:0.7.0": *

#let override_localization = state("locale_override", (:))

#let localization_it = (
  "Solution": "Soluzione",
  "PageXofY": (count, total) => "Pagina " + str(count) + " di " + str(total),
  "Subtask": it => "Subtask " + str(it),
  "Day": it => "Giorno " + str(it),
  "TimeLimit": "Limite di tempo",
  "MemoryLimit": "Limite di memoria",
  "stdin": "standard input",
  "stdout": "standard output",
  "Examples": "Esempi di input/output",
  "Explanation": "Spiegazione",
  "Implementation": "Implementazione",
  "Scoring": "Assegnazione del punteggio",
  "Constraints": "Assunzioni",
  "points": "punti",
  "IntentionallyBlankPage": "pagina intenzionalmente vuota",
  "seconds": "secondi",
  "SampleGrader": "Grader di prova",
  "Grader": "Grader",
)

#let localization_en = (
  "Solution": "Solution",
  "PageXofY": (count, total) => "Page " + str(count) + " of " + str(total),
  "Subtask": it => "Subtask " + str(it),
  "Day": it => "Day " + str(it),
  "TimeLimit": "Time limit",
  "MemoryLimit": "Memory limit",
  "stdin": "standard input",
  "stdout": "standard output",
  "Examples": "Examples",
  "Explanation": "Explanation",
  "Implementation": "Implementation",
  "Scoring": "Scoring",
  "Constraints": "Constraints",
  "points": "points",
  "IntentionallyBlankPage": "This page is intentionally left blank",
  "seconds": "seconds",
  "SampleGrader": "Sample Grader",
  "Grader": "Grader",
)

// Section names, with translations
#let localize(lang, string) = {
  let override = override_localization.get()
  if (
    type(override) == dictionary and override.at(string, default: none) != none
  ) {
    override.at(string)
  } else if lang == "it" {
    localization_it.at(string)
  } else if lang == "en" {
    localization_en.at(string)
  } else {
    import "locale/" + lang + ".typ": localization
    localization.at(string)
  }
}

#let implementation = context [ == #localize(
  text.lang,
  "Implementation",
) <implementation> ]
#let samplegrader = context [ == #localize(
  text.lang,
  "SampleGrader",
) <samplegrader> ]
#let constraints = context [ == #localize(
  text.lang,
  "Constraints",
) <constraint> ]
#let scoring = context [ == #localize(text.lang, "Scoring") <scoring> ]
#let explanation = context [ == #localize(
  text.lang,
  "Explanation",
) <explanation> ]
#let solution = context [ == #localize(text.lang, "Solution") <solution> ]

// Main show rule for statements
#let statement(doc, title: none) = {
  show math.equation.where(block: false): it => box(it)
  set text(
    size: 11pt,
    font: if ((context text.lang) != "ar") {
      ("Latin Modern Roman",)
    } else {
      "Sakkal Majalla,"
    },
  )
  // raw text defaults to 80% smaller, undo that.
  show raw: set text(size: 1.25em, font: "Latin Modern Mono")
  set par(justify: true)
  set list(indent: 17pt, body-indent: 7pt)
  set enum(indent: 17pt, body-indent: 7pt)
  show heading.where(level: 1): h => [ #h #v(7pt) ]

  let contest_yaml = sys.inputs.at("contest_yaml", default: none)
  let contest_yaml = if contest_yaml != none {
    yaml(contest_yaml)
  } else {
    (logo: none)
  }

  let contest_description = contest_yaml.at("description", default: none)
  let contest_location = contest_yaml.at("location", default: none)
  let date = contest_yaml.at("date", default: none)
  let logo = contest_yaml.at("logo", default: none)
  let show_summary = contest_yaml.at("show_summary", default: false)

  let task_yaml = yaml(sys.inputs.at("task_yaml", default: "../task.yaml"))
  let name = task_yaml.at("name", default: "noname")
  let title = if (title == none) [
    #set text(dir: ltr)
    #task_yaml.at("title", default: "No Name")
  ] else {
    title
  }
  let time_limit = task_yaml.at("time_limit", default: 0)
  let memory_limit = task_yaml.at("memory_limit", default: 0)
  let syllabus = task_yaml.at(
    "syllabuslevel",
    // incoherence between tmr internal serializer and task.yaml
    default: task_yaml.at("syllabus_level", default: none),
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
    #h(1fr) #strong(raw(name)) #h(3pt) #sym.circle.filled #h(3pt) #strong(raw(
      upper(text.lang),
    ))
  ]

  let footer_text = context [
    #set text(size: 10pt)
    #line(length: 100%, stroke: 0.1pt)
    #v(-5pt)
    #raw(name) #h(1fr) #localize(text.lang, "PageXofY")(
      here().page(),
      counter(page).final().at(0),
    )
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
    set text(dir: ltr)
    grid(
      columns: 2,
      rows: 50pt,
      image(logo), header_text,
      column-gutter: 5pt,
      align: horizon,
    )
  } else {
    set text(dir: ltr)
    block(height: 50pt, header_text)
  }

  heading([
    #title
    #[
      #set text(dir: ltr)
      (#raw(name))
    ]
  ])

  if show_summary {
    summary_text
  }

  doc
}

// Main show rule for editorials
#let editorial(doc) = {
  show math.equation.where(block: false): it => box(it)
  set text(
    size: 11pt,
    font: if ((context text.lang) != "ar") {
      ("Latin Modern Roman",)
    } else {
      "Sakkal Majalla,"
    },
  )
  // raw text defaults to 80% smaller, undo that.
  show raw: set text(size: 1.25em, font: "Latin Modern Mono")
  set par(justify: true)
  set list(indent: 17pt, body-indent: 7pt)
  set enum(indent: 17pt, body-indent: 7pt)
  show heading.where(level: 1): h => [ #h #v(7pt) ]

  let contest_yaml = sys.inputs.at("contest_yaml", default: none)
  let contest_yaml = if contest_yaml != none {
    yaml(contest_yaml)
  } else {
    (logo: none)
  }

  let show_solution_contest_yaml = contest_yaml.at(
    "show_solutions",
    default: false,
  )

  let task_yaml = yaml(sys.inputs.at("task_yaml", default: "../task.yaml"))
  let name = task_yaml.at("name", default: "noname")

  let footer_text = context [
    #set text(size: 10pt)
    #line(length: 100%, stroke: 0.1pt)
    #v(-5pt)
    #raw(name) #h(1fr) Pagina #here().page() di #counter(page).final().at(0)
  ]

  set page(margin: 2cm, footer: footer_text, fill: luma(200))

  let show_solution = sys.inputs.at("show_solutions", default: none)
  if show_solution == none and not show_solution_contest_yaml {
    return
  }

  // Since multiple statements could be condensed into
  // a single booklet, we pagebreak before every new task
  pagebreak(weak: true)

  solution

  doc
}

#let infile = {
  let file = yaml(sys.inputs.at("task_yaml", default: "../task.yaml")).at(
    "infile",
    default: "",
  )
  if file == "" { "stdin" } else { file }
}

#let outfile = {
  let file = yaml(sys.inputs.at("task_yaml", default: "../task.yaml")).at(
    "outfile",
    default: "",
  )
  if file == "" { "stdout" } else { file }
}

#let task_name = yaml("../task.yaml").at("name", default: "");

// Subtask constraints and scores

#let constraint = {
  let constraints = if sys.inputs.at("gen_toml", default: none) != none {
    let gen_toml = sys.inputs.at("gen_toml")
    let constraints = toml(gen_toml)
    constraints.subtask = constraints.subtask.values()
    constraints
  } else {
    let constraints_yaml = sys.inputs.at(
      "constraints_yaml",
      default: "../gen/constraints.yaml",
    )
    yaml(constraints_yaml)
  }

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

#let subtask_scores = {
  if sys.inputs.at("gen_toml", default: none) != none {
    let gen_toml = sys.inputs.at("gen_toml")
    let constraints = toml(gen_toml)
    constraints.subtask.values().map(l => l.score)
  } else {
    let gen_gen = sys.inputs.at("gen_gen", default: "../gen/GEN")
    let gen_gen = read(gen_gen)
    let lines = gen_gen.split("\n")
    let scores = lines
      .filter(l => l.starts-with("#ST:"))
      .map(l => int(l.slice(5).trim()))
    assert.eq(
      scores.len(),
      constraint.subtask.len() - 1,
    )
    scores
  }
}

#let subtasks(subtask_descriptions, index_start: 0) = {
  assert.eq(
    subtask_scores.len(),
    subtask_descriptions.len(),
  )
  let indices = array.range(subtask_scores.len())

  context {
    let st = localize(text.lang, "Subtask")

    let max_subtask_idx_len = indices
      .map(idx => {
        measure([*#{ st(idx + index_start) }*]).width
      })
      .sorted()
      .last()
    let max_subtask_score_len = subtask_scores
      .map(score => {
        measure([*#score*]).width
      })
      .sorted()
      .last()
    let subtasks = array
      .zip(
        constraint.subtask.slice(1),
        subtask_scores,
        subtask_descriptions,
        indices,
      )
      .map(((cnst, score, desc, index)) => {
        for (key, value) in constraint {
          if key != "subtask" and cnst.at(key, default: none) == none {
            cnst.insert(key, value)
          }
        }
        let description = desc(cnst)
        let stidx = box(width: max_subtask_idx_len, [#{
          st(index + index_start)
        }])
        let score = [#box(width: max_subtask_score_len, [#h(
              1fr,
            ) #score]) #localize(text.lang, "points")]
        let subtask_intro = [#stidx [#score]]
        (subtask_intro, description)
      })
    let max_intro_len = subtasks
      .map(((intro, _)) => {
        measure([*#intro*:]).width
      })
      .sorted()
      .last()
    for (intro, description) in subtasks {
      [- #box(width: max_intro_len, [*#intro*:]) #description]
    }
  }
}

#let ois_subtasks(
  subtask_descriptions,
  subtask_syllabus_levels,
  index_start: 1,
) = {
  assert.eq(
    subtask_scores.len(),
    subtask_descriptions.len(),
  )
  assert.eq(
    subtask_scores.len(),
    subtask_syllabus_levels.len(),
  )

  let indices = array.range(subtask_scores.len())

  context {
    let st = localize(text.lang, "Subtask")

    let subtasks = array
      .zip(
        constraint.subtask.slice(1),
        subtask_scores,
        subtask_descriptions,
        indices,
      )
      .map(((cnst, score, desc, index)) => {
        for (key, value) in constraint {
          if key != "subtask" and cnst.at(key, default: none) == none {
            cnst.insert(key, value)
          }
        }
        let description = desc(cnst)
        let stidx = [#st(index + index_start)]
        let score = [(#score #localize(text.lang, "points"))]
        let subtask_intro = [*#stidx* #score]
        (subtask_intro, description)
      })
    for ((intro, description), syllabus) in subtasks.zip(
      subtask_syllabus_levels,
    ) {
      [
        - #grid(
            columns: (1fr, 2.2fr),
            rows: (1em, 1.6em),
            [#intro],
            grid.cell(
              rowspan: 2,
              [#description],
            ),
            {
              for _ in range(0, syllabus) {
                text("🕮", fill: orange)
              }
              for _ in range(syllabus, 5) {
                text("🕮", fill: gray)
              }
            },
          )
      ]
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
      [], icon, content,
    ),
  )
}

#let note(content) = {
  template_box(
    luma(123),
    none,
    text(size: 1.7em, if ((context text.dir) != rtl) {
      sym.arrow.r.stroked
    } else {
      sym.arrow.l.stroked
    }),
    content,
  )
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
        #place(horizon + center, dy: -0.6em, text(
          size: 5em,
          sym.triangle.t.stroked,
        ))
      ],
    ),
    content,
  )
}

#let signatures(language_signatures, highlight: true) = {
  set text(dir: ltr)
  if type(language_signatures) == str {
    table(
      columns: (1fr,),
      stroke: 0.1pt + black,
      fill: luma(240),
      inset: 8pt,
      align: (horizon),
      raw(language_signatures),
    )
  } else {
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
      "rs": "Rust",
    )
    table(
      columns: (70pt, 1fr),
      stroke: 0.1pt + black,
      fill: luma(240),
      inset: 8pt,
      align: (center + horizon, horizon),
      ..for (lang, sig) in language_signatures {
        (
          lang_name.at(lang),
          if highlight { raw(sig, lang: lang) } else { raw(sig) },
        )
      }
    )
  }
}

#let examples(num, infile: infile, outfile: outfile) = {
  context [== #localize(text.lang, "Examples") <examples>]

  let name = yaml("../task.yaml").name
  set text(dir: ltr)

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
    table.header(raw(infile), raw(outfile)),
    ..for i in array.range(num) {
      let infile = name + ".input" + str(i) + ".txt"
      let outfile = name + ".output" + str(i) + ".txt"
      (box(raw(read(infile))), box(raw(read(outfile))))
    },
  )
}

#let examples-interactive(num) = {
  context [== #localize(text.lang, "Examples") <examples>]

  let name = yaml("../task.yaml").name
  set text(dir: ltr)

  for i in array.range(num) {
    let file = name + ".interaction" + str(i) + ".txt"
    let lines = ()
    for line in read(file).split("\n") {
      if line.len() < 1 {
        continue
      }
      if line.starts-with("<") {
        if lines.len() == 0 or not lines.at(lines.len() - 1).at(1) {
          lines.push(((), true))
        }
      } else if line.starts-with(">") {
        if lines.len() == 0 or lines.at(lines.len() - 1).at(1) {
          lines.push(((), false))
        }
      } else {
        panic(
          "Example "
            + str(i + 1)
            + ": line "
            + line
            + " starts with neither < nor >",
        )
      }
      lines.at(lines.len() - 1).at(0).push(line.slice(1))
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
          let cell = table.cell(
            stroke: 0.1pt + black,
            colspan: 2,
            fill: luma(250),
            raw(l.join("\n")),
          )
          let pat-col = luma(245)
          let pat-col2 = luma(255)
          let pat = tiling(
            size: (15pt, 15pt),
            relative: "parent",
            rect(
              fill: gradient
                .linear(angle: 45deg, pat-col, pat-col2, pat-col, pat-col2)
                .sharp(4),
            ),
          )
          let placeholder = table.cell(fill: pat, [])
          if is_input {
            (cell, placeholder)
          } else {
            (placeholder, cell)
          }
        },
      ),
    )
  }
}

#if sys.inputs.at("gen_toml", default: none) != none {
  let gen_toml = sys.inputs.at("gen_toml")
  let constraints = toml(gen_toml)
  let num = if type(constraints.samples) == int {
    constraints.samples
  } else {
    constraints.samples.num
  }
  examples = (infile: infile, outfile: outfile) => examples(
    num,
    infile: infile,
    outfile: outfile,
  )
  examples-interactive = () => examples-interactive(num)
}
