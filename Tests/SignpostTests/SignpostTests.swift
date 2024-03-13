import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(SignpostMacros)
import SignpostMacros

let testMacros: [String: Macro.Type] = [
    "signpost": SignpostMacro.self,
]
#endif

final class SignpostTests: XCTestCase {
    func testMacro() throws {
        #if canImport(SignpostMacros)
        assertMacroExpansion(
            """
            #signpost
            """,
            expandedSource: """
            let signpostID = signposter.makeSignpostID()
            let signpostIntervalState = signposter.beginInterval(#function, id: signpostID)

            defer {
                signposter.endInterval(#function, signpostIntervalState)
            }
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
