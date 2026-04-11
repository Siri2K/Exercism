Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    Begin {

    }

    Process{
        # Clean the CleanedInput
        [string]$CleanedInput = $HeyBob.Trim()

        #Define Traits
        [bool]$IsSilence = [string]::IsNullOrWhiteSpace($CleanedInput)
        [bool]$IsQuestion = $CleanedInput.EndsWith('?')
        [bool]$IsYelling = ($CleanedInput -cmatch '[A-Z]') -and ($CleanedInput -ceq $CleanedInput.ToUpper())

        # 3. Determine Responses
        if ($IsSilence) {
            return "Fine. Be that way!"
        }
        if ($IsYelling -and $IsQuestion) {
            return "Calm down, I know what I'm doing!"
        }
        if ($IsYelling) {
            return "Whoa, chill out!"
        }
        if ($IsQuestion) {
            return "Sure."
        }
    
        return "Whatever."
    }

    End {
        # This runs once at the very end
    }
}
