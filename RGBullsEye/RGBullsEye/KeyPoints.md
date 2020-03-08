# Key points

## Summary
- SwiftUI is declarative;
- When @State variable changes, view invalidates its appearance and recomputes its `body`;
- You should strive for reusing views as SwfitUI is optimized for that;
- Xcode 11 doesn't provide landscape previews as of now;
- @State values are the sources of truth;
- Views depend on the state, not on a sequence events;
- Bindings are read-write values and you can use $ as a shortcut in @State;
- Use bindings for data that are not owned by the view they are within;



## Tips & Tricks
- Command + Enter to hide preview;
- Command + Option + Enter to show preview;
- Command + Option + P to refresh preview;
- Command + Shift + L to open library;
- Commant + Click in code to embed view in stacks (works for single views only);
- Command + Click in code Extract Subviews;
- Command + Click in preview to inspect and change views;
