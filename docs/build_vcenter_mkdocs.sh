#/bin/bash
cat /home/dennis/Documents/MkDocs/vcenter-mkdocs/docs/index_header.txt > index.md
echo "## 🖥 Host Information 🖥" >> index.md
echo "\`\`\`\`bash" >> index.md
pwsh -F /home/dennis/Documents/MkDocs/vcenter-mkdocs/docs/get-vmhost-pwsh.ps1
echo "\`\`\`\`" >> index.md
echo "## 🫙 VM Information 🫙" >> index.md
echo "\`\`\`\`bash" >> index.md
pwsh -F /home/dennis/Documents/MkDocs/vcenter-mkdocs/docs/get-vm-pwsh.ps1
echo "\`\`\`\`" >> index.md
echo "## 💾 Datastore Information 💾" >> index.md
echo "\`\`\`\`bash" >> index.md
pwsh -F /home/dennis/Documents/MkDocs/vcenter-mkdocs/docs/get-datastore-pwsh.ps1
echo "\`\`\`\`" >> index.md
echo "## 🔌 vSwitch 🔌 " >> index.md
echo "\`\`\`\`bash" >> index.md
pwsh -F /home/dennis/Documents/MkDocs/vcenter-mkdocs/docs/get-virtualswitch-pwsh.ps1
echo "\`\`\`\`" >> index.md

