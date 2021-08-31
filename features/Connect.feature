Feature: Connect

    The Asset Tracker should connect to the Azure IoT Hub

    Background:

        Given I am run after the "Run the firmware" feature

    Scenario: Read reported state

        Then the reported state of the device "{deviceId}" matches
        """
        {
            "dev": {
                "v": {
                    "modV": "mfw_nrf9160_1.3.0",
                    "brdV": "nrf9160dk_nrf9160",
                    "appV": "{appVersion}-upgraded"
                }
            },
            "cfg": {
                "gpst": 60,
                "act": true,
                "actwt": 120,
                "mvres": 120,
                "mvt": 3600,
                "acct": 10
            }
        }
        """
