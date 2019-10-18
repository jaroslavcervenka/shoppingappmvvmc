//
// Created by Jaroslavc Cervenka on 17/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

enum GeneralEndpoints {

    class FetchTranslations: ApiRequest<TranslationsResponse> {
        init() {
            super.init(resource: "translations")
        }
    }
}