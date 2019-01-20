# ExportMSDNStoFile #

Custom made script based on [Migrating a lot of zones from Microsoft DNS to BIND][source] article, but I improved it a lot.

I handled the errors and used DnsServer module insead of dnscmd.exe (because MS will be remove it in the future).

This script needs two input datas.
One of them is the location of the exported files, it is located on the root of the C:\ drive. Default folder is DNS. So, in this case, it will be save files to C:\DNS folder
> [ExportDNS]<[IN] Location (relative, default is 'DNS'): 

Another input data is the Source DNS server FQDN or ip This is defaults to DC, because I named my AD-DC to DC and you might do that too.
> [ExportDNS]<[IN] Source DNS server (default is 'DC'): 

---
You can learn more from me at [czompi.hu][czompi].

[czompi]: <https://czompi.hu>
[source]: <http://myitpath.blogspot.com/2011/10/migrating-lot-of-zones-from-microsoft.html>