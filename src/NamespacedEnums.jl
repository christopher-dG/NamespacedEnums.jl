module NamespacedEnums

export @nsenum

"""
    @nsenum [T=T] EnumName[::BaseType] value1[=x] value2[=y]

Create a namespaced enum.
This enum works similarly to a regular `Enum`, but its values are hidden behind a module.
To access the values, use `EnumName.value1`.
To access the enum itself, use `EnumName.T`.

```julia-repl
julia> using NamespacedEnums

julia> @nsenum Fruit apple=1 orange=2 kiwi=3;

julia> f(x::Fruit.T) = "I'm a Fruit with value: \$(Int(x))";

julia> f(apple)
ERROR: UndefVarError: apple not defined

julia> f(Fruit.apple)
"I'm a Fruit with value: 1"
```
"""
macro nsenum(exs...)
    return esc(nsenum(exs...))
end

function nsenum(exs...)
    T, name_idx = exs[1] isa Expr && exs[1].head === :(=) ? (exs[1].args[2], 2) : (:T, 1)
    name = exs[name_idx]
    if exs[name_idx] isa Expr
        T = Expr(:(::), T, exs[name_idx].args[2])
        name = name.args[1]
    end
    vals = exs[name_idx+1:end]
    M = gensym(name)
    return Expr(
        :block,
        Expr(:toplevel, :(module $M @enum $T $(vals...) end)),
        :(const $name = $M),
    )
end

end
