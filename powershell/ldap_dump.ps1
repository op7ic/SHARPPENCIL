function dump_all_ldap{

$strFilter = "user"
$ErrorActionPreference = 'SilentlyContinue'
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objDomain
$objSearcher.SearchScope = "Subtree"
$objSearcher.PageSize = 99999
$objSearcher.Filter = "(objectCategory=$strFilter)"
$colResults = $objSearcher.FindAll()
foreach ($i in $colResults)
{
      $objComputer = $i.GetDirectoryEntry()
	  $username =  $objComputer.name
	  write-host "[+] Dumping LDAP attributes for: $username"
	  $propertyNames = $objComputer.Properties.PropertyNames
	  foreach ($name in $propertyNames) {
	  $line = $name + " : " + $objComputer.Properties.Item($name)[0]
	  $line | out-file -Append ldap_dump.txt
	  }
}
}