Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
$Password = Get-Content "/home/dennis/Documents/MkDocs/vcenter-mkdocs/docs/clear_password.txt"
Connect-viserver -server 192.168.1.55 -user administrator@vsphere.local -password $Password
Get-datastore | Format-Table >> /home/dennis/Documents/MkDocs/vcenter-mkdocs/docs/index.md
