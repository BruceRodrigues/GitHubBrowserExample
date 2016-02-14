//
//  AuthenticationActions.swift
//  SwiftFlowGitHubBrowser
//
//  Created by Benji Encz on 1/5/16.
//  Copyright © 2016 Benji Encz. All rights reserved.
//

import ReSwift
import ReSwiftRouter
import OctoKit

func authenticateUser(state: State, store: Store<State>) -> Action? {
    guard let config = state.authenticationState.oAuthConfig else { return nil }

    let url = config.authenticate()

    if let url = url {
        store.dispatch(SetOAuthURL(oAuthUrl: url))
        store.dispatch(SetRouteAction([loginRoute, oAuthRoute]))
    }

    return nil
}

func handleOpenURL(url: NSURL) -> Store<State>.ActionCreator {
    return { state, store in
        state.authenticationState.oAuthConfig?.handleOpenURL(url) { (config: TokenConfiguration) in
            // TODO: Persist Login Information
            
            // Switch to the Main View Route
            store.dispatch(ReSwiftRouter.SetRouteAction([mainViewRoute]))
        }

        return nil
    }
}

struct SetOAuthURL: Action {
    let oAuthUrl: NSURL
}

struct UpdateLoggedInState: Action {
    let loggedInState: LoggedInState
}
