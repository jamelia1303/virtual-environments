Write-Host "Set antivirus parameters"
Set-MpPreference -ScanAvgCPULoadFactor 5 -ExclusionPath "D:\", "C:\"

Write-Host "Disable Antivirus"
Set-MpPreference -DisableRealtimeMonitoring $true

$atpRegPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection'
if (Test-Path $atpRegPath) {
    Set-ItemProperty -Path $atpRegPath -Name 'ForceDefenderPassiveMode' -Value '1' -Type 'DWORD'
}
