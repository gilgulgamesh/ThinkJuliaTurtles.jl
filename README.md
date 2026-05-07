# ThinkJuliaTurtles.jl

A terminal-based turtle graphics package for working through the [Think Julia](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html) book. Replaces the broken `ThinkJulia.jl` / Luxor turtle graphics with a UnicodePlots-based alternative that works on modern Julia.

Made mostly with LLM. I'll test and improve it as i follow the book... and learn julia

## Installation

```julia
] add https://github.com/gilgulgamesh/ThinkJuliaTurtles.jl
```

No need to install UnicodePlots separately, it's included.

## Usage

```julia
using ThinkJuliaTurtles

🐢 = Turtle()
@draw begin
    forward(🐢, 100)
    turn(🐢, -90)
    forward(🐢, 100)
end
```

## Sizing

The plot defaults to 100x50 characters. Adjust to fit your terminal:

```julia
set_turtle_size(80, 40)
```

A good rule of thumb is height = width ÷ 2 for a square aspect ratio.

## Functions

- `Turtle()` — create a new turtle at the origin
- `forward(t, dist)` — move turtle forward by `dist` units, animating each step
- `turn(t, angle)` — turn by `angle` degrees (positive = left, negative = right)
- `penup(t)` — lift pen (move without drawing)
- `pendown(t)` — lower pen (draw when moving)
- `@draw begin ... end` — mirrors the `@svg begin ... end` syntax from the book
- `set_turtle_size(w, h)` — set plot width and height in terminal characters

## Notes

- Animation redraws the terminal in place — requires a terminal that supports ANSI escape codes (Windows Terminal works well, the default Windows command prompt may not)
- The turtle marker shows current direction
- Drawing bounds are -200 to 200 in both x and y
- Inside functions, use turtle functions directly rather than `@draw` — the macro is best suited for top-level use
- Tested on Julia 1.10+
