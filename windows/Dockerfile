FROM microsoft/windowsservercore
MAINTAINER Raf Van Hoof <raf.vanhoof@gmail.com>

#Add .Net 3.5 Framework
ADD source /build
RUN DISM /Online /Add-Package /PackagePath:C:\build\microsoft-windows-netfx3-ondemand-package.cab & del C:\build\microsoft-windows-netfx3-ondemand-package.cab


