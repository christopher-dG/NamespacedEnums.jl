using NamespacedEnums
using Documenter

makedocs(;
    modules=[NamespacedEnums],
    authors="Chris de Graaf <me@cdg.dev> and contributors",
    repo="https://github.com/christopher-dG/NamespacedEnums.jl/blob/{commit}{path}#L{line}",
    sitename="NamespacedEnums.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://christopher-dG.github.io/NamespacedEnums.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/christopher-dG/NamespacedEnums.jl",
)
