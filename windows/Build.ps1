docker build -t rafvanhoof/homegenie-windows:latest --file ./Dockerfile D:\Source\GITHOMEGENIECONTAINER\homegenie-container\windows
Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")