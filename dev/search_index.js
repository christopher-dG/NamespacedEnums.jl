var documenterSearchIndex = {"docs":
[{"location":"#","page":"Home","title":"Home","text":"CurrentModule = NamespacedEnums","category":"page"},{"location":"#NamespacedEnums-1","page":"Home","title":"NamespacedEnums","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"","category":"page"},{"location":"#","page":"Home","title":"Home","text":"Modules = [NamespacedEnums]","category":"page"},{"location":"#NamespacedEnums.@nsenum-Tuple","page":"Home","title":"NamespacedEnums.@nsenum","text":"@nsenum [T=T] EnumName[::BaseType] value1[=x] value2[=y]\n\nCreate a namespaced enum. This enum works similarly to a regular Enum, but its values are hidden behind a module. To access the values, use EnumName.value1. To access the enum itself, use EnumName.T.\n\njulia> using NamespacedEnums\n\njulia> @nsenum Fruit apple=1 orange=2 kiwi=3;\n\njulia> f(x::Fruit.T) = \"I'm a Fruit with value: $(Int(x))\";\n\njulia> f(apple)\nERROR: UndefVarError: apple not defined\n\njulia> f(Fruit.apple)\n\"I'm a Fruit with value: 1\"\n\n\n\n\n\n","category":"macro"}]
}
