/**
 * Renderable HBRS theme values.
 */

#let hbrs_theme = (
  page: (
    paper: "a4",
    columns: 1,
    margins: (
      left: 4cm,
      right: 2cm,
      top: 2.5cm,
      bottom: 1cm,
    ),
  ),
  text: (
    font: ("Arial", "Liberation Sans", "Noto Sans"),
    size: 11pt,
    top_edge: 0.8em,
    bottom_edge: -0.2em,
    justify: true,
  ),
  captions: (
    size: 10pt,
  ),
  headings: (
    numbering_pattern: "1.",
    levels: (
      level_1: (size: 12pt, weight: "bold", below: 0.8em),
      level_2: (size: 11pt, weight: "bold", below: 0.6em),
      level_3: (size: 11pt, weight: "bold", below: 0.6em),
      level_4: (size: 11pt, weight: "bold", below: 0.6em),
    ),
  ),
  page_numbering: (
    front_matter: (
      display_pattern: "i",
    ),
    main_matter: (
      display_pattern: "1",
      first_page_value: 1,
    ),
  ),
)
