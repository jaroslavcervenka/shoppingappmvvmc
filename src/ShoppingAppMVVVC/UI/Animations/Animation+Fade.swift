//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import XCoordinator

extension Animation {
    static let fade = Animation(
            presentation: InteractiveTransitionAnimation.fade,
            dismissal: InteractiveTransitionAnimation.fade
    )
}

extension InteractiveTransitionAnimation {
    fileprivate static let fade = InteractiveTransitionAnimation(duration: Constants.animation.defaultAnimationDuration) { transitionContext in
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!

        toView.alpha = 0.0
        containerView.addSubview(toView)

        UIView.animate(withDuration: Constants.animation.defaultAnimationDuration, delay: 0, options: [.curveLinear], animations: {
            toView.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

