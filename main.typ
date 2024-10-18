#import "template.typ": *

#show: project.with(
  title: "TITLE",
  authors: (
    (
      name: "Wonderland",
      email: "example@com"
    ),
  ),
)


= Section

段落以及基本的 markup 语法

== Sub-section

Now we *know* _how_ to #highlight[mark files] as intentionally #text(red)[untracked] (ignored).

- First, you should never check automatically generated files
- Second, there are temporary files and by-products specific to ones's toolchain
	+ `.vim`
	+ `.bashrc`

We could use `.gitignore` to ignore file change.

```bash
/.vim/ #highlight
.bashrc
```

Noticed, we use `/.vim.` to ignore `.vim` dir only in project root dir.


= admonition (alert box)

#info-box(blue, "NOTE")[
	需要指定 「颜色」，「标题」和「内容」
]

= Figure

@a is a figrue in 40% ratio

#figure(
	image("./pipeline1.png", width: 40%),
	caption: "流水线"
) <a>

#align(center)[双栏图]

#vsp(
"./pipeline1.png",  "流水线", 70%,
"./pipeline1.png",  "流水线", 70%
)

= 网格、栈与列表

== Grid

#set rect(width: 100%)
#align(center)[
	#grid(
      columns: (1em,) * 32,
      rows: (0.75em, 2em),
      text(size: 8pt,  "31"),
      grid.cell(
        colspan: 5,
        ""
      ),
      text(size: 8pt,  "25"),
      text(size: 8pt,  "24"),
      grid.cell(
        colspan: 3,
        ""
      ),
      text(size: 8pt,  "20"),
      text(size: 8pt,  "19"),
      grid.cell(
        colspan: 3,
        ""
      ),
      text(size: 8pt,  "15"),
      text(size: 8pt,  "14"),
      grid.cell(
        colspan: 1,
        ""
      ),
      text(size: 8pt,  "12"),
      text(size: 8pt,  "11"),
      grid.cell(
        colspan: 3,
        ""
      ),
      text(size: 8pt,  "7"),
      text(size: 8pt,  "6"),
      grid.cell(
        colspan: 5,
        ""
      ),
      text(size: 8pt,  "0"),
      grid.cell(
        colspan: 7,
        rect("0000001")
      ),
      grid.cell(
        colspan: 5,
        rect("rs2")
      ),
      grid.cell(
        colspan: 5,
        rect("rs1")
      ),
      grid.cell(
        colspan: 3,
        rect("111")
      ),
      grid.cell(
        colspan: 5,
        rect("rd")
      ),
      grid.cell(
        colspan: 7,
        rect("0110011")
      ),
   )
   *REM* instruction layout
]

== 栈

#stack(
	dir: ltr,
	rect(width: 25%, "PPN1"),
	rect(width: 25%, "PPN2"),
	rect(width: 25%, "PPN3"),
	rect(width: 25%, "OFF"),
)

== 表格

#let n = 6
#let yield_cells(n) = {
  for i in range(0, n + 1) {
    for j in range(0, n + 1) {
      // this is an array, for loops merge them together
      // into one large array of cells
      (
        table.cell(
          fill: if i == 0 { blue} // top right corner
          else if j == 0 { blue }
          else {white},
          " "),
      )
    }
  }
}

#align(center)[#table(
  columns: (0.6cm,) * (n + 1), 
  rows: (0.6cm,) * (n + 1), 
  ..yield_cells(n),
)]

= 数学

_Proof_: 

Assume we have another fixed point x, i.e. $x=f(x)$

By the definition of $bot$, we have $bot subset.eq.sq x$

Induction begins:

As f is monotonic, we have 
$ f(bot) subset.eq.sq f(x) $

Assume $f^i (bot) subset.eq.sq f^i (x)$, as f is monotonic,we have
$ f^(i+1) (bot) subset.eq.sq f^(i+1)(x) $

Thus by induction, we have
$ f^(i) (bot) subset.eq.sq f^(i)(x) #[#set text(blue); induction completed here] $

Thus $f^(i)(bot) subset.eq.sq f^i (x) = x$
$ f^(#[fix]) = f^k(bot) subset.eq.sq x $

Then we prove $bot$ is the least fixed-point.
