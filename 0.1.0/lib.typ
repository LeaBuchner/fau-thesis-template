#import "/layout/titlepage.typ": *
#import "/layout/disclaimer.typ": *
#import "/layout/acknowledgement.typ": acknowledgement as acknowledgement_layout
#import "/layout/abstract.typ": *
#import "/utils/print_page_break.typ": *
#import "/layout/fonts.typ": *
#import "@preview/glossarium:0.5.4": make-glossary, register-glossary, print-glossary, gls, glspl

#let thesis(
  titleGerman: "",
  submissionDate: "",
  professor: "",
  professorship: "",
  title: "",
  degree: "",
  faculty: "",
  author: "",
  supervisor: "",
  abstract_en: "",
  abstract_de: "",
  is_print: false,
  body,
) = {

  titlepage(
    title: title,
    degree: degree,
    author: author,
    supervisor: supervisor,
    submissionDate: submissionDate,
    professorship: professorship,
    professor: professor,
    faculty: faculty,
  )

  print_page_break(print: is_print)
  print_page_break(print: is_print)

  disclaimer(
    title: title,
    degree: degree,
    author: author,
    submissionDate: submissionDate,
  )

  print_page_break(print: is_print)


  print_page_break(print: is_print)

  abstract(lang: "en")[#abstract_en]
  print_page_break(print: is_print)
  print_page_break(print: is_print)

  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body,
    size: 11pt,
    lang: "en"
  )

  show math.equation: set text(weight: 400)

  // --- Headings ---
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: fonts.body)
  show: make-glossary

  set heading(numbering: "1.1")
  // Reference first-level headings as "chapters"
  show ref: it => {
    let el = it.element
    if el != none and el.func() == heading and el.level == 1 {
      link(
        el.location(),
        [Chapter #numbering(
          el.numbering,
          ..counter(heading).at(el.location())
        )]
      )
    } else {
      it
    }
  }

  // --- Paragraphs ---
  set par(leading: 1em)

  // --- Citations ---
  set cite(style: "alphanumeric")

  // --- Figures ---
  show figure: set text(size: 0.85em)

  // --- Table of Contents ---
  show outline.entry.where(level: 1): it => {
    v(15pt, weak: true)
    strong(it)
  }
  outline(
    title: {
    v(20mm)
      text(font: fonts.body, 1.6em, weight: "semibold", "Contents")
      v(15mm)
    },
    indent: 2em
  )


  v(2.4fr)
  pagebreak()
  pagebreak()

    outline(
    title: {
    v(20mm)
      text(font: fonts.body, 1.6em, weight: "semibold", "List of Figures")
      v(15mm)
    }, target: figure.where(kind: image))

  pagebreak()

  pagebreak()


    outline(
    title: {
    v(20mm)
      text(font: fonts.body, 1.6em, weight: "semibold", "List of Tables")
      v(15mm)
    }, target: figure.where(kind: table))

    pagebreak()
    pagebreak()
    let entry-list = (
    (
      key: "kuleuven",
      short: "KU Leuven",
      long: "Katholieke Universiteit Leuven",
      description: "A university in Belgium.",
    ),
    // Add more terms
  )
  register-glossary(entry-list)
  // Your document body
  print-glossary(
   entry-list
  )


    // Main body. Reset page numbering.
  counter(page).update(1)
  set par(justify: true, first-line-indent: 2em)

  body


    bibliography("/thesis.bib")

}