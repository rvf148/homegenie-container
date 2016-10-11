docker build -t rafvanhoof/homegenie-linux:latest --file ./Dockerfile D:\Source\GITHOMEGENIECONTAINER\homegenie-container\linux
Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")