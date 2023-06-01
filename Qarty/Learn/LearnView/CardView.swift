//
//  CardView.swift
//  Qarty
//
//  Created by Irakli Nozadze on 31.05.23.
//

import SwiftUI

struct CardView: View {
  let flashCard: FlashCard
  @Binding var cardColor: Color
  @State var revealed = false
  @State var offset: CGSize = .zero
  @GestureState var isLongPressed = false
  
  typealias CardDrag = (_ card: FlashCard, _ direction: DiscardedDirection) -> Void
  let dragged: CardDrag
  
  init(_ card: FlashCard, cardColor: Binding<Color>, onDrag dragged: @escaping CardDrag = {_,_  in } ) {
    flashCard = card
    _cardColor = cardColor
    self.dragged = dragged
  }
  
  var body: some View {
    let drag = DragGesture()
      .onChanged { offset = $0.translation }
      .onEnded {
        if $0.translation.width < -100 {
          offset = .init(width: -1000, height: 0)
          dragged(flashCard, .left)
        } else if $0.translation.width > 100 {
          offset = .init(width: 1000, height: 0)
          dragged(flashCard, .right)
        } else {
          offset = .zero
        }
      }
    
    let longPress = LongPressGesture()
      .updating($isLongPressed) { value, state, transition in
        state = value
      }
      .simultaneously(with: drag)
    
    return ZStack {
      Rectangle()
        .fill(cardColor)
        .frame(width: 320, height: 210)
        .cornerRadius(12)
      VStack {
        Spacer()
        Text(flashCard.card.question)
          .font(.largeTitle)
          .foregroundColor(.white)
        if revealed {
          Text(flashCard.card.answer)
            .font(.caption)
            .foregroundColor(.white)
        }
        Spacer()
      }
    }
    .shadow(radius: 8)
    .frame(width: 320, height: 210)
    .animation(.spring(), value: offset)
    .offset(offset)
    .gesture(longPress)
    .scaleEffect(isLongPressed ? 1.1 : 1)
    .animation(.easeInOut(duration: 0.3), value: isLongPressed)
    .simultaneousGesture(TapGesture()
      .onEnded {
        withAnimation(.easeIn, {
          revealed.toggle()
        })
    })
  }
}

struct CardView_Previews: PreviewProvider {
  @State static var cardColor = Color.red
  
  static var previews: some View {
    let card = FlashCard(
      card: Challenge(
        question: "გამარჯობა",
        pronunciation: "Gamarjoba",
        answer: "Hello"
      )
    )
    return CardView(card, cardColor: $cardColor)
  }
}
