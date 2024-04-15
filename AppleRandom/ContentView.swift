import SwiftUI

struct ContentView: View {
    @State private var appleLogoPosition: CGPoint = .zero
    
    @State private var logoColorIndex = 1

    private var logoColors: [Color] = [.red, .green, .blue, .orange, .yellow, .red, .pink, .gray, .brown, .mint, .cyan]


    var body: some View {
        ZStack {
            Color(.black)

            VStack {
                Image(systemName: "applelogo")
                    .foregroundColor(logoColors[logoColorIndex]) // change couleur via tableau
                    .font(.system(size: 110))
                    .position(appleLogoPosition)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                appleLogoPosition = randomPosition()
                                cycleLogoColor()
                                
                            } // fin in
                    )
            } // fin VStack
        } // fin ZStack
        .ignoresSafeArea()
    } // fin body

    // Fonction pour générer une nouvelle position aléatoire dans la vue
    private func randomPosition() -> CGPoint {
        let maxX = UIScreen.main.bounds.width
        let maxY = UIScreen.main.bounds.height

        let randomX = CGFloat.random(in: 1..<maxX)
        let randomY = CGFloat.random(in: 1..<maxY)
        return CGPoint(x: randomX, y: randomY)
    } // func random
    
    private func cycleLogoColor() {
        logoColorIndex = (logoColorIndex + 1) % logoColors.count

       } // fin func
    
    
    
    
} // struct



#Preview {
    ContentView()
}
