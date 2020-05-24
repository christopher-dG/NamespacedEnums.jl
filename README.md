# NamespacedEnums

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://christopher-dG.github.io/NamespacedEnums.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://christopher-dG.github.io/NamespacedEnums.jl/dev)
[![Build Status](https://travis-ci.com/christopher-dG/NamespacedEnums.jl.svg?branch=master)](https://travis-ci.com/christopher-dG/NamespacedEnums.jl)

If your module has a lot of enums, you might run into a few problems:

- Your module's namespace becomes polluted with loads of names
- You can't use the same name for two different enums
- You can't tell which enum a value belongs to
- Tab completion is not helpful for finding instances of a certain enum

NamespacedEnums' `@nsenum` works similarly a regular `Enum`, but its values are hidden behind a module.
To access the values, use `EnumName.value1`.
To access the enum itself, use `EnumName.T`.

```jl
julia> using NamespacedEnums

julia> @nsenum Fruit apple=1 orange=2 kiwi=3;

julia> f(x::Fruit.T) = "I'm a Fruit with value: \$(Int(x))";

julia> f(apple)
ERROR: UndefVarError: apple not defined

julia> f(Fruit.apple)
"I'm a Fruit with value: 1"
```
