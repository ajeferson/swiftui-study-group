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
- Why SwiftUI?
    - Storyboards can cause crashs because elements are weakly typed;
- SwiftUI encourajes you to creat small reusable views and add modifers on a per context basis;
- SwiftUI views are highly optimized and there's no significative performance hit in creating smalls reusable views;
- The order of modifiers matters;
- You should always have a single source of truth;
- You should not have duplicate state;
- Property wrappers augment the behavior of variables: `@State`, `@ObservedObject`, `@Binding`, `@EnvironmentObject`;
- `@Binding` declares a dependency on a @State owned by another view;
- `@ObservedObject` declares a dependency on a reference type that conforms to `ObservableObject` protocol;
- You normally don't use `@State` in reusable views;
- `@State` properties are usually private;



## Tips & Tricks
- Command + Enter to hide preview;
- Command + Option + Enter to show preview;
- Command + Option + P to refresh preview;
- Command + Shift + L to open library;
- Commant + Click in code to embed view in stacks (works for single views only and canvas must be open);
- Command + Click in code Extract Subviews;
- Command + Click in preview to inspect and change views;
- Right-click in the Live preview button to Debug Preview;
- Bug: you need to have a NavigationView at top level to see changes done with .environment modifier;
- List of built-in Environment values: https://developer.apple.com/documentation/swiftui/environmentvalues;
- Debuggin in Xcode 11: https://developer.apple.com/videos/play/wwdc2019/412/?time=539;

