#Path of Horizon View Persona Profiles
$XMLPaths = (Get-ChildItem "C:\Profiles\*\AppData\Roaming\Trillian\" -Recurse -Force | Where-Object {$_.Name -contains 'Events.xml'} | Select FullName).FullName



Foreach($XMLPath in $XMLPaths) {
$XML = [xml](Get-Content $XMLPath)
$node = $xml.events.prefs.setting | Where {$_.Name -eq 'Sounds'}
$node.value = '0'
$XML.Save($XMLPath)
$XMLPath
$node
}