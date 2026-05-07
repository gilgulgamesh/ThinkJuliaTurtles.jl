module ThinkJuliaTurtles

using UnicodePlots
for name in names(UnicodePlots)
    @eval export $name
end

export Turtle, forward, turn, penup, pendown, @draw

mutable struct Turtle
    x::Float64
    y::Float64
    angle::Float64
    pen::Bool
    xs::Vector{Float64}
    ys::Vector{Float64}
end

Turtle() = Turtle(0.0, 0.0, 90.0, true, [0.0], [0.0])

function turtle_marker(angle)
    a = mod(angle, 360)
    markers = ['▷', '◹', '△', '◸', '◁', '◺', '▽', '◿']
    idx = round(Int, a / 45) % 8 + 1
    return markers[idx]
end

function forward(t::Turtle, dist)
    steps = max(1, round(Int, abs(dist)))
    step_size = dist / steps
    for i in 1:steps
        t.x += step_size * cosd(t.angle)
        t.y += step_size * sind(t.angle)
        if t.pen
            push!(t.xs, t.x)
            push!(t.ys, t.y)
        end
        print("\e[2J\e[H")
        flush(stdout)
rows, cols = displaysize(stdout)
w = (cols ÷ 2) * 1.6 - 5
h = w ÷ 2
p = lineplot(t.xs, t.ys, xlim=(-200, 200), ylim=(-200, 200),
             width=w, height=h)
        UnicodePlots.scatterplot!(p, [t.x], [t.y],
                                  marker=string(turtle_marker(t.angle)),
                                  color=:green)
        display(p)
        flush(stdout)
        sleep(0.01)
    end
end

function turn(t::Turtle, angle)
    t.angle += angle
end

function penup(t::Turtle)
    t.pen = false
end

function pendown(t::Turtle)
    t.pen = true
end

macro draw(block)
    quote
        $(esc(block))
    end
end

end # module
