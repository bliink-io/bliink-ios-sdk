//
//  Constants.swift
//  BliinkSample
//
//  Created by bliink on 15/06/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

public class Constants {
    
    public static let TAG_ID: Int = 99
    
    enum OPTIONS: String {
        case MODE_TEST_KEY = "test"
        case PAGE_TITLE_KEY = "pageTitle"
        case PAGE_DESCRIPTION_KEY = "pageDescription"
        case IMAGE_URL_KEY = "imageUrl"
        case PAGE_URL_KEY = "pageUrl"
        case KEYWORDS_KEY = "keywords"
        case PAGE_TITLE_VALUE = "BLIINK - Technology"
        case PAGE_DESCRIPTION_VALUE = "Open up a whole new range of possibilities through our in-image technology"
        case IMAGE_URL_VALUE = "https://bliink.io/img/bg/bg--technology.jpg"
        case TRUE = "true"
        case PAGE_URL_VALUE = "https://bliink.io/technology"
        case KEYWORDS_VALUE = "bliink, technology"
    }

    enum IAB: String {
        case CONSENT_STRING = "IABConsent_ConsentString"
        case HAS_CONSENT_STRING = "IABConsent_CMPPresent"
        case EXAMPLE_STRING = "BOQ7WlgOQ7WlgABABwAAABJOACgACAAQABA"
    }
}
