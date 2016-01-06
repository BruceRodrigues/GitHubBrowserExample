//
//  State.swift
//  SwiftFlowGitHubBrowser
//
//  Created by Benji Encz on 1/5/16.
//  Copyright © 2016 Benji Encz. All rights reserved.
//

import SwiftFlow
import SwiftFlowRouter
import OctoKit
import RequestKit

struct State: StateType, HasNavigationState {
    var navigationState: NavigationState
    var authenticationState: AuthenticationState
    var repositories: Response<Repository>?
}
