# Memorize App
Thats a simple game of memorization. 
Created in IOS with Swift.

From [Stanford CS193p (2023)](https://cs193p.sites.stanford.edu/2023) course.


## Course Progress
- [x] Class 1
- [x] Class 2
- [ ] Class 3
- [ ] Class 4
- [ ] Class 5
- [ ] Class 6
- [ ] Class 7
- [ ] Class 8
- [ ] Class 9
- [ ] Class 10
- [ ] Class 11
- [ ] Class 12
- [ ] Class 13
- [ ] Class 14
- [ ] Class 15

## Notes

### States
- To create a simple states:
```swift
    @State var cardCount: Int = 8
```

### Functions
- We can create a function that returns a View, like this:
```swift
    func makeCardCountAdjuster(
        by offset: Int,
        symbol: String,
        label: String,
        alignment: HorizontalAlignment = HorizontalAlignment.leading
    ) -> some View {
        Button(
            action: {
                cardCount += offset
            },
            label: {
                VStack (alignment: alignment) {
                    Image(systemName: symbol)
                    Text(label)
                }
            }
        )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
```
- Using the function to create a button component:
```swift
    var CardRemover: some View {
        makeCardCountAdjuster(
            by: -1,
            symbol: "minus.square",
            label: "remove card"
        )
    }
```

- To use a component, we just need to add it in a View, Stack or Scrollview:
```swift
    var body: some View {
        VStack{
            ScrollView {
                Cards // A component responsible for list all cards
            }
            Spacer(minLength: 24)
            CardCountAdjusters // A wrapper component that contains the buttons
            
        }
        .padding()
    }
```

