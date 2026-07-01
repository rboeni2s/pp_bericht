/**
 * HBRS thesis template.
 */

#import "title_page.typ": hbrs_title_page
#import "theme.typ": hbrs_theme
#import "labels.typ": hbrs_labels

#import "@preview/abbr:0.3.0"


#let with-theme(meta, body) = {
  let theme = hbrs_theme

  [
    #set document(
      title: meta.title,
      author: (meta.author,),
    )

    #set text(
      lang: "de",
      font: theme.text.font,
      size: theme.text.size,
      top-edge: theme.text.top_edge,
      bottom-edge: theme.text.bottom_edge,
    )

    #set par(
      justify: theme.text.justify,
      leading: 0.2em,
    )

    #set page(
      paper: theme.page.paper,
      margin: theme.page.margins,
      columns: theme.page.columns,
      numbering: theme.page_numbering.main_matter.display_pattern,
      number-align: right,
    )

    #set heading(
      numbering: theme.headings.numbering_pattern,
    )

    #show heading.where(level: 1): it => block(below: theme.headings.levels.level_1.below)[
      #set text(
        size: theme.headings.levels.level_1.size,
        weight: theme.headings.levels.level_1.weight,
      )
      #it
    ]
    #show heading.where(level: 2): it => block(below: theme.headings.levels.level_2.below)[
      #set text(
        size: theme.headings.levels.level_2.size,
        weight: theme.headings.levels.level_2.weight,
      )
      #it
    ]
    #show heading.where(level: 3): it => block(below: theme.headings.levels.level_3.below)[
      #set text(
        size: theme.headings.levels.level_3.size,
        weight: theme.headings.levels.level_3.weight,
      )
      #it
    ]
    #show heading.where(level: 4): it => block(below: theme.headings.levels.level_4.below)[
      #set text(
        size: theme.headings.levels.level_4.size,
        weight: theme.headings.levels.level_4.weight,
      )
      #it
    ]

    #show figure: set text(
      style: "italic",
      size: theme.captions.size,
    )

    #set table(
      stroke: (x, y) => if y == 0 {
        (bottom: 0.7pt + black)
      },
      fill: (x, y) => if y > 0 and calc.odd(y) {
        rgb("#f2f2f2")
      },
      align: (x, y) => (
        if x > 0 { center } else { left }
      ),
    )
    #show table.cell: it => {
      set text(style: "normal")
      set par(justify: false)
      it
    }
    #show table.cell.where(y: 0): set text(weight: "bold")
    #show table.cell: set text(size: 9pt)
    #show table: set table(align: left)


    #show bibliography: set align(left)

    #set enum(numbering: "1.1)", full: true)

    #show: abbr.show-rule
    #abbr.config(style: it => text(it))
    #abbr.load("../abbr.csv", delimiter: ";")

    #body
  ]
}


#let render-title-page(meta, labels) = {
  let title_page = hbrs_title_page
  let document_type = labels.document_types.at(meta.kind)

  [
    #set page(margin: 0cm, numbering: none)
    #block(
      width: title_page.canvas.width,
      height: title_page.canvas.height,
    )[
      #place(
        top + left,
        dx: title_page.background.x,
        dy: title_page.background.y,
        image(
          title_page.assets.background_path,
          width: title_page.background.width,
          height: title_page.background.height,
        ),
      )

      #place(
        top + left,
        dx: title_page.logo.x,
        dy: title_page.logo.y,
        image(
          title_page.assets.logo_path,
          width: title_page.logo.width,
          height: title_page.logo.height,
        ),
      )

      #place(
        top + left,
        dx: title_page.blocks.content_group.x,
        dy: title_page.blocks.content_group.y,
        block(width: title_page.blocks.content_group.width)[
          #set align(center)

          #text(size: title_page.blocks.document_type.size, weight: "bold", document_type)
          \
          #text(size: title_page.blocks.study_program.size, labels.title_page.study_program_prefix)
          #text(size: title_page.blocks.study_program.size, meta.degree)
          #v(1.8cm)
          #text(size: title_page.blocks.thesis_title.size, weight: "bold", meta.title)
          #v(1.1cm)
          #text(size: title_page.blocks.author_label.size, labels.title_page.author_label)
          \
          #text(size: 14pt, weight: "light", [vorgelegt von]) \
          #text(size: 16pt, weight: "bold", meta.author)

        ],
      )

      #place(
        bottom + center,
        dy: -1cm,
        [
          #set text(size: title_page.blocks.metadata_table.size)
          #set align(left)
          *#labels.title_page.first_examiner Betreuer Hochschule :* #meta.first_examiner \
          *#labels.title_page.second_examiner Betreuer DGUV :* #meta.second_examiner \
          *#labels.title_page.submitted_on Eingereicht am :* #meta.submitted_on
        ],
      )
    ]
  ]
}

#let render_fbinf_Eidesstattliche_Erklaerung() = {
  return page(
    paper: hbrs_theme.page.paper,
    margin: 0cm,
    numbering: none,
    header: none,
    footer: none,
    columns: 1,
  )[
    #image(
      "../../info/fbinf_Eidesstattliche_Erklaerung_v0.0.pdf",
      width: 100%,
      height: 100%,
      fit: "contain",
    )
  ]
}

// Remove footnotes from the outline
#let display_fn = state("display_fn", (true,))
#let footnote(..args) = context if display_fn.get().last() { std.footnote(..args) }
#let clean_footnote(it) = context {
  display_fn.update(stack => (..stack, false))
  it
  display_fn.update(stack => stack.slice(0, -1))
}


#let template(meta: (), body) = {
  let theme = hbrs_theme
  let labels = hbrs_labels
  let bibliography_path = "../" + meta.bibliography

  with-theme(meta, [
    #render-title-page(meta, labels)
    #pagebreak()

    // #render_fbinf_Eidesstattliche_Erklaerung()
    // #pagebreak()

    #set page(
      numbering: theme.page_numbering.front_matter.display_pattern,
      number-align: right,
    )

    #show outline: clean_footnote

    #show outline.entry: it => {
      if it.element.body == [] or it.element.body == none {
        // Wenn die Überschrift leer ist, wird sie komplett ignoriert
      } else {
        it
      }
    }

    #outline()

    #pagebreak()

    #outline(
      title: [Abbildungsverzeichnis],
      target: figure,
    )

    #pagebreak()

    #{
      set heading(outlined: false, numbering: none)
      show table.cell: set text(weight: "regular")
      show table.cell.where(x: 0): strong
      show table.cell: set text(size: 9pt)
      show table: set table(align: left)
      abbr.list(title: [Abkürzungsverzeichniss], columns: 1)
    }

    #pagebreak()

    #counter(page).update(theme.page_numbering.main_matter.first_page_value)
    #set page(
      numbering: theme.page_numbering.main_matter.display_pattern,
      number-align: right,
    )

    #counter(heading).update(0)

    #body

    #pagebreak()
    #show bibliography: set heading(numbering: "1.")
    #bibliography(
      bibliography_path,
      style: "ieee",
    )
  ])
}

