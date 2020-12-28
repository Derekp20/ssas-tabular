$connectTestResult = Test-NetConnection -ComputerName indiciatrainingfiles.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"indiciatrainingfiles.file.core.windows.net`" /user:`"Azure\indiciatrainingfiles`" /pass:`"byXpye0wJtYJ25s6uW2QiypqEALgVZL7YNVNgolUDkMM7bz/CW6lAhnKXbY9I3b1ewa6N22u5Pu22uG7hBaaEQ==`""
    # Mount the drive
    New-PSDrive -Name E -PSProvider FileSystem -Root "\\indiciatrainingfiles.file.core.windows.net\classfiles" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
