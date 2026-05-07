# ThinkJuliaTurtles.jl

A terminal-based turtle graphics package for working through the [Think Julia](https://BenLauwens.github.io/ThinkJulia.jl/latest/book.html) book. Replaces the broken `ThinkJulia.jl` / Luxor turtle graphics with a UnicodePlots-based alternative that actually works on modern Julia.

## Installation

```julia
] add https://github.com/gilgulgamesh/ThinkJuliaTurtles.jl
```

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

## Functions

- `Turtle()` — create a new turtle at the origin
- `forward(t, dist)` — move turtle forward by `dist` units
- `turn(t, angle)` — turn turtle by `angle` degrees (positive = left, negative = right)
- `penup(t)` — lift pen (turtle moves without drawing)
- `pendown(t)` — lower pen (turtle draws when moving)
- `@draw begin ... end` — draw block, mirrors the `@svg begin ... end` syntax from the book

## Notes

- Animation is terminal-based using UnicodePlots — no graphics window needed
- The turtle is shown as a directional character (▲▶▼◀ etc.) in green
- Drawing bounds are -200 to 200 in both x and y
- Requires a terminal that supports Unicode and ANSI escape codes (Windows Terminal works well)


Made by llm mostly
