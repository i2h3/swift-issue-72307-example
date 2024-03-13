import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct SignpostMacro: DeclarationMacro {
    public static func expansion(of _: some SwiftSyntax.FreestandingMacroExpansionSyntax, in _: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        [
            DeclSyntax(
                stringLiteral: """
                let signpostID = signposter.makeSignpostID()
                let signpostIntervalState = signposter.beginInterval(#function, id: signpostID)

                defer {
                    signposter.endInterval(#function, signpostIntervalState)
                }
                """
            ),
        ]
    }
}

@main
struct SignpostPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        SignpostMacro.self,
    ]
}
