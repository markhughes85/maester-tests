Describe "AzureMark.ConditionalAccess" {
    It "Block access to the Azure portal for non-admin users" {
        $userId = (Get-MgUser -UserId 'berry.green@azuremark.co').Id
        $azureAppId = 'c44b4083-3bb0-49c1-b47d-974e53cbdf3c'
        $policiesEnforced = Test-MtConditionalAccessWhatIf -UserId $userId `
            -IncludeApplications $azureAppId
        $policiesEnforced.grantControls.builtInControls | Should -Contain "block"
    }
}
