$Folder = split-path -parent $MyInvocation.MyCommand.Definition;
Get-ChildItem -path $Folder -ErrorAction silentlycontinue -Recurse |
Sort-Object -Property length -Descending |
Format-Table -autosize -wrap -property `
    @{Label=”Last access”;Expression={($_.lastwritetime).ToshortDateString()}},
    @{label=”size in megabytes”;Expression={“{0:N2}” -f ($_.Length / 1MB)}},
    fullname