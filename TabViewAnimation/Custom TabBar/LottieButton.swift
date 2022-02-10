//
//  LottieButton.swift
//  TabViewAnimation
//
//  Created by Basel Baragabah on 09/02/2022.
//

import SwiftUI
import Lottie

struct LottieButton : UIViewRepresentable {
    
    @State private var isPlayingDefault = true
    let filename: String
    let loopMode: LottieLoopMode
    let isPlaying: Binding<Bool>?
    
    init(filename: String, loopMode: LottieLoopMode = .loop, isPlaying: Binding<Bool>? = nil) {
        self.filename = filename
        self.loopMode = loopMode
        self.isPlaying = isPlaying
    }
    
    func makeUIView(context: Context) -> AnimationViewProxy {
        let playing = self.isPlaying ?? $isPlayingDefault
        return AnimationViewProxy(
            filename: filename, loopMode: loopMode, isPlaying: playing.wrappedValue
        )
    }
    
    func updateUIView(_ animationView: AnimationViewProxy, context: Context) {
        let playing = self.isPlaying ?? $isPlayingDefault
        if playing.wrappedValue {
            animationView.play()
        } else {
            animationView.stop()
        }
    }
    
    final class AnimationViewProxy : UIView  {
        
        private let animationView = AnimationView()
        private var isAnimationPlaying: Bool = true
        
        init(filename: String, loopMode: LottieLoopMode, isPlaying: Bool = true) {
            super.init(frame: .zero)
            
            animationView.animation = Animation.named(filename)
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = loopMode
            self.isAnimationPlaying = isPlaying
            
            if isPlaying {
                self.play()
            }
            
            self.addSubview(animationView)
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                animationView.widthAnchor.constraint(equalTo: self.widthAnchor),
                animationView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(applicationWillEnterForeground),
                                                   name: UIApplication.willEnterForegroundNotification,
                                                   object: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func play() {
            self.isAnimationPlaying = true
            self.animationView.play()
        }
        
        func stop() {
            self.isAnimationPlaying = false
            self.animationView.currentProgress = 0
            self.animationView.stop()
        }
        
        @objc private func applicationWillEnterForeground() {
            if self.isAnimationPlaying {
                self.animationView.play()
            }
        }
        
        override func willMove(toWindow newWindow: UIWindow?) {
            guard let _ = newWindow else {
                self.animationView.stop()
                return
            }
            
            if self.isAnimationPlaying {
                self.animationView.play()
            }
        }
    }
}
