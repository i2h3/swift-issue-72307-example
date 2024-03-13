@freestanding(declaration, names: named(signpostID), named(signpostIntervalState))
public macro signpost() = #externalMacro(module: "SignpostMacros", type: "SignpostMacro")
