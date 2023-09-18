
# Create the header
echo "# vCenter Automagic MkDocs Documentation" > index.md
echo "" >> index.md
echo "For full documentation visit [mkdocs.org](https://www.mkdocs.org)." >> index.md

# Login to vCenter
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
$Password = Get-Content "/home/dennis/Documents/MkDocs/vcenter-v2/docs/clear_password.txt"
Connect-viserver -server 192.168.1.55 -user administrator@vsphere.local -password $Password

# Build the host information
echo "## 🖥 Host Information 🖥" >> index.md
echo "````````bash" >> index.md
Get-VMHost | select Name,NumCpu,ProcessorType,CpuUsageMhz,MemoryUsageGB,Version |  Format-Table >> /home/dennis/Documents/MkDocs/vcenter-v2/docs/index.md
echo "````````" >> index.md

# Build the VM information
echo "## 🫙 VM Information 🫙" >> index.md
echo "````````bash" >> index.md
Get-VM |select Name,NumCpu,MemoryGB,PowerState | Format-Table >> /home/dennis/Documents/MkDocs/vcenter-v2/docs/index.md
echo "````````" >> index.md


# Build the Datastore information
echo "## 💾 Datastore Information 💾" >> index.md
echo "````````bash" >> index.md
Get-datastore | Format-Table >> /home/dennis/Documents/MkDocs/vcenter-v2/docs/index.md
echo "````````" >> index.md


# Build the vSwitch information
echo "## 🔌 vSwitch 🔌 " >> index.md
echo "````````bash" >> index.md
Get-virtualswitch | Format-Table >> /home/dennis/Documents/MkDocs/vcenter-v2/docs/index.md
echo "````````" >> index.md

# Build the documentation web site
cd /home/dennis/Documents/MkDocs/vcenter-v2
mkdocs build

# Copy the site to the web server
scp -r /home/dennis/Documents/MkDocs/vcenter-v2/site/* dennis@plex-addons:/var/www/html/mkdocs/

