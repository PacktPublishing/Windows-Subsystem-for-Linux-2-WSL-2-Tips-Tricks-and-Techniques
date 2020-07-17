#
# This function is intended to be added to your $PROFILE
#

function Set-Prompt {
    param (
        # Specifies a path to one or more locations.
        [Parameter(Mandatory=$true,
                   ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [string]
        $PromptText
    )
    $Host.UI.RawUI.WindowTitle = $PromptText
}
