# AgentTerminalNeo

A Swift package that renders markdown as styled text with a retro green terminal aesthetic. Includes a drop-in SwiftUI view for displaying rendered output on macOS.

## Requirements

- macOS 14+
- Swift 6.4+
- No external dependencies (AppKit + SwiftUI only)

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/AgentiLoop/AgentTerminalNeo.git", from: "1.37.9")
]
```

## Usage

### SwiftUI View

```swift
import AgentTerminalNeo

struct ContentView: View {
    var body: some View {
        TerminalNeoTextView(text: "# Hello\n\nThis is **bold** and *italic*.")
    }
}
```

With height tracking:

```swift
TerminalNeoTextView(text: markdownString, onContentHeight: { height in
    print("Content height: \(height)")
})
```

### Direct Rendering

```swift
import AgentTerminalNeo

let attributed = TerminalNeoRenderer.render("# Heading\n\nSome **bold** text.")
```

### Theme Colors

```swift
let textColor = TerminalNeoTheme.text      // Green terminal text
let dimColor = TerminalNeoTheme.dim        // Dimmed green
let brightColor = TerminalNeoTheme.bright  // Bright green for headers
```

## Markdown Support

| Feature | Syntax |
|---|---|
| Headers | `# H1` through `###### H6` |
| Bold | `**text**` |
| Italic | `*text*` |
| Bold + Italic | `***text***` |
| Inline code | `` `code` `` |
| Code blocks | ` ``` ` fenced blocks |
| Tables | Pipe-delimited markdown tables (rendered with NSTextTable) |
| Bullet lists | `- item` or `* item` |
| Numbered lists | `1. item` |
| Horizontal rules | `---` |

## Public API

### TerminalNeoTextView

SwiftUI `NSViewRepresentable` wrapper around NSTextView.

```swift
public struct TerminalNeoTextView: NSViewRepresentable {
    public init(text: String, onContentHeight: ((CGFloat) -> Void)? = nil)
}
```

- Non-editable text display (no scroll machinery — caller wraps as needed)
- Automatic link detection
- Transparent background (inherits parent styling)

### TerminalNeoRenderer

Converts markdown strings to styled `NSAttributedString`.

| Method / Property | Description |
|---|---|
| `render(_:)` | Convert markdown to attributed string |
| `font` | 11pt monospaced system font |
| `boldFont` | 11pt bold monospaced system font |
| `isTableSeparator(_:)` | Check if a line is a table separator |
| `parseTableRow(_:)` | Extract cells from a table row |

### TerminalNeoTheme

Retro green terminal color palette. All colors adapt to system dark/light mode.

| Color | Dark Mode | Light Mode |
|---|---|---|
| `text` | Green on dark | Dark green on light |
| `bright` | Bright green | Bold dark green |
| `dim` | Muted green | Soft green |
| `border` | Dark green border | Light green border |
| `headerBg` | Dark green fill | Light green fill |
| `codeBg` | Near-black | Light gray-green |

## Part of AgentiLoop Agent!

AgentTerminalNeo is one of the open-source building blocks of **[AgentiLoop Agent!](https://github.com/AgentiLoop/Agent)**, the native AI agent for macOS 14.6+ on Apple Silicon and Intel. Agent! codes in Xcode, drives any Mac app, runs shell as you or as root, and works with 23 LLM providers plus on-device Apple Intelligence.

🌐 [agentiloop.ai](https://agentiloop.ai/) · ⬇️ [Download Agent!](https://github.com/AgentiLoop/Agent/releases/latest) · 🍺 `brew install --cask agentiloop-agent` · 💻 CLIs: [Rust](https://github.com/AgentiLoop/AgentiLoopCLI) / [Go](https://github.com/AgentiLoop/AgentiLoopGo)

**More Agent! packages:** [AgentAccess](https://github.com/AgentiLoop/AgentAccess) · [AgentAudit](https://github.com/AgentiLoop/AgentAudit) · [AgentColorSyntax](https://github.com/AgentiLoop/AgentColorSyntax) · [AgentD1F](https://github.com/AgentiLoop/AgentD1F) · [AgentEventBridges](https://github.com/AgentiLoop/AgentEventBridges) · [AgentLLM](https://github.com/AgentiLoop/AgentLLM) · [AgentMCP](https://github.com/AgentiLoop/AgentMCP) · [AgentSwift](https://github.com/AgentiLoop/AgentSwift) · [AgentTools](https://github.com/AgentiLoop/AgentTools) · [AgentScripts](https://github.com/AgentiLoop/AgentScripts)

## License

MIT
