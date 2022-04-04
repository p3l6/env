#! /usr/bin/env swift
import AppKit
import Foundation

func addAllLinks(_ text: String) -> AttributedString {
    var mdText = text
    if let pullRequestURLprefix = ProcessInfo.processInfo.environment["pullRequestURLprefix"] {
        mdText = mdText.replacingOccurrences(
            of: #"PR ?(\d+)"#,
            with: #"[$0]\(\#(pullRequestURLprefix)$1\)"#,
            options: .regularExpression
        )
    }

    if let jiraProjectprefixes = ProcessInfo.processInfo.environment["jiraProjectprefixes"],
       let jiraURLprefix = ProcessInfo.processInfo.environment["jiraURLprefix"] {
        for jiraPrefix in jiraProjectprefixes.split(separator: " ") {
            mdText = mdText.replacingOccurrences(
                of: #"(\#(jiraPrefix)-\d+)"#,
                with: #"[$0]\(\#(jiraURLprefix)$1\)"#,
                options: .regularExpression
            )
        }
    }

    let opts = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnly)

    do { return try AttributedString(markdown: mdText, options:opts) }
    catch {
        print("Error in link formatting: \(mdText)")
        return AttributedString(text)
    }
}

let pasteboard = NSPasteboard.general
if let mdText = pasteboard.string(forType: .string) {
    let text: AttributedString = addAllLinks(mdText)

    pasteboard.declareTypes([NSPasteboard.PasteboardType.rtf], owner: nil)
    // TODO: I think the bold is being lost here
    pasteboard.writeObjects([NSAttributedString(text)])
}

