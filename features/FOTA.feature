Feature: Upgrade the firmware

    The Asset Tracker should have upgraded the firmware

    Scenario: The upgraded firmware should have been run

        Then the Firmware CI run device log should contain
        """
        azure_iot_hub_integration: cloud_wrap_init:  Version:      {appVersion}-upgraded
        """