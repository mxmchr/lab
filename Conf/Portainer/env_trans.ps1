param (
    [string]$EnvFile = ".env"
)

if (!(Test-Path $EnvFile)) {
    Write-Error "Fichier introuvable : $EnvFile"
    exit 1
}

$lines = Get-Content $EnvFile
$result = @()

foreach ($line in $lines) {
    $line = $line.Trim()

    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    if ($line.StartsWith("#")) { continue }

    if ($line -match "^\s*([^=]+)\s*=\s*(.*)\s*$") {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim()

        # ❌ NE PAS toucher aux backslashes
        # ❌ NE PAS ajouter d'échappement automatique

        # Retire uniquement guillemets entourants si présents
        if ($value.StartsWith('"') -and $value.EndsWith('"')) {
            $value = $value.Substring(1, $value.Length - 2)
        }

        # Optionnel : escape uniquement guillemets internes HCL
        $value = $value -replace '"', '\"'

        $result += @"
        {
            name  = "$key"
            value = "$value"
        }
"@
    }
}

$output = @"
env = [
$($result -join ",`n")
]
"@

Write-Output $output