#import "@preview/showybox:2.0.1": showybox
#let project(
  title: "",
  authors: (),
  abstract: none,
  keywords: (),
  body
) = {
  let zh_shusong = ("FZShuSong-Z01", "FZShuSong-Z01S")
  let zh_xiaobiansong = ("FZXiaoBiaoSong-B05", "FZXiaoBiaoSong-B05S")
  let zh_kai = ("FZKai-Z03", "FZKai-Z03S")
  let zh_hei = ("FZHei-B01", "FZHei-B01S")
  let zh_fangsong = ("FZFangSong-Z02", "FZFangSong-Z02S")
  let en_sans_serif = "Courier New"
  let en_serif = "New Computer Modern"
  let en_typewriter = "Courier New"
  let en_code = "JetBrainsMono NF"
  let en_reguler = "New Computer Modern"
  // Moidfy the following to change the font.
  let title-font = (en_reguler, ..zh_hei)
  let author-font = (en_typewriter, ..zh_fangsong)
  let body-font = en_reguler
  let heading-font = (en_reguler, ..zh_xiaobiansong)
  let caption-font = (en_serif, ..zh_kai)
  let header-font = (en_serif, ..zh_kai)
  let strong-font = (en_serif, ..zh_hei)
  let emph-font = (en_serif, ..zh_kai)
  let raw-font = (en_code, ..zh_hei)
  
  set document(author: authors.map(author => author.name), title: title)
  set heading(numbering: "1.")
  set page(numbering: "1", number-align: center)

	// set language
  set text(font: body-font, lang: "en")

  set bibliography(style: "gb-7714-2015-numeric")
  
  show heading: it => box(width: 100%)[
    #v(0.50em)
    #if it.numbering != none { counter(heading).display() }
    #set text(font: heading-font)
    #h(0.75em)
    #it.body
  ]

  show heading.where(
    level: 1
  ): it => box(width: 100%)[
    #v(0.5em)
    #set align(left)
    #it
    #v(0.75em)
  ]

  // Title
  align(center)[
    #block(text(font: title-font, weight: "bold", 1.75em, title))
    #v(0.5em)
  ]

  // Display the authors list.
  for i in range(calc.ceil(authors.len() / 3)) {
    let end = calc.min((i + 1) * 3, authors.len())
    let is-last = authors.len() == end
    let slice = authors.slice(i * 3, end)
    grid(
      columns: slice.len() * (1fr,),
      gutter: 12pt,
      ..slice.map(author => align(center, {
        text(12pt, author.name, font: author-font)
        if "organization" in author [
          \ #text(author.organization, font: author-font)
        ]
        if "email" in author [
          \ #text(link("mailto:" + author.email), font: author-font)
        ]
      }))
    )

    if not is-last {
      v(16pt, weak: true)
    }
  }
  v(2em, weak: true)

  // Main body
  set enum(indent: 2em)
  set list(indent: 2em)
  set figure(gap: 0.8cm)

  // 定义空白段，解决首段缩进问题
  let blank_par = par()[#text()[#v(0em, weak: true)];#text()[#h(0em)]]

  show figure: it => [
    #v(12pt)
    #set text(font: caption-font)
    #it
    #blank_par
    #v(12pt)
  ]

  show image: it => [
    #it
    #blank_par
  ]

  show list: it => [
    #it
    #blank_par
  ]

  show enum: it => [
    #it
    #blank_par
  ]

  show table: it => [
    #set text(font: body-font)
    #it
    #blank_par
  ]
  show strong: set text(font: strong-font)
  show emph: set text(font: emph-font)
  show ref: set text(red)
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(240),
    inset: 10pt,
  )

  show raw.where(block: true): it => [
    #it
    #blank_par
  ]

  show raw: set text(font: raw-font)
  show link: underline
  show link: set text(blue)
	// showing line number

	show raw.where(block: true): code => {
		show raw.line: line => {
      box(
        stack(
        dir: ltr,
        box(width: 15pt)[#text(fill: gray)[#line.number]],
        if (line.text.ends-with("highlight")) {
          highlight(line.body)
        } else {
          line.body
        }
      ))
      
		}
		code
	}	
// cancel indent
// set par(first-line-indent: 2em, justify: true)

	set par(justify: true)

  if abstract != none [
    #v(2pt)
    #h(2em) *摘要：* #abstract

    #if keywords!= () [
      *关键字：* #keywords.join("；")
    ]
    #v(2pt)
  ]

  body
}
#let problem-counter = counter("problem")
#problem-counter.step()

#let problem(body) = {
  problem-counter.step()
  set enum(numbering: "(1)")
  block(
    fill: rgb(241, 241, 255),
    inset: 8pt,
    radius: 2pt,
    width: 100%,
  )[*题目 #problem-counter.display().* #h(0.75em) #body]
}

#let solution(body) = {
  set enum(numbering: "(1)")
  block(
    inset: 8pt,
    width: 100%
  )[*解答.* #h(0.75em) #body]
}


// using set rules to set parameters for given function, avoiding repeated claim arguments.
// show also do this

// display alert(admonition box)
#let info-box(color, title, content) = showybox(
		title-style: (
			weight: 900,
			color: black,
			sep-thickness: 0pt,
			align: left
		),
		frame: (
			title-color: color.lighten(80%),
			border-color: color.darken(40%),
			thickness: (left: 1pt),
			radius: 0pt
		),
		title: title
	)[
		#content
	]

// alias for figure
#let pic(fig, caption, ratio) = figure(
			image(fig, width: ratio),
			caption: caption
	) 

// column view of figure
#let vsp(figure1, caption1, ratio1, figure2, caption2, ratio2) = columns(2)[
		#pic(figure1, caption1, ratio1)
		#colbreak()
		#pic(figure2, caption2, ratio2) 
	] 

//#import "template.typ": *
//
//#show: project.with(
  //title: "TITLE",
  //authors: (
    //(
      //name: "NAME",
      //email: "EMAIL"
    //),
  //),
//)

