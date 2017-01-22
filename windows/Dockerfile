FROM microsoft/windowsservercore
MAINTAINER Raf Van Hoof <raf.vanhoof@gmail.com>

ENV HOMEGENIE_FOLDER v1.1-beta.525
ENV HOMEGENIE_SETUP HomeGenie_1_1_beta_r525.exe

#set default shell to powershell
SHELL ["powershell"]

#download and install homegeie
RUN powershell Sleep 2 ; \
    powershell New-Item C:\Install -type directory; \
    powershell New-Item C:\HomeGenie -type directory; \
    powershell wget -Uri https://github.com/genielabs/HomeGenie/releases/download/$env:HOMEGENIE_FOLDER/$env:HOMEGENIE_SETUP -OutFile C:\Install\$env:HOMEGENIE_SETUP; \
    powershell Start-Process C:\install\$env:HOMEGENIE_SETUP -ArgumentList '/VERYSILENT /LANG=Englisch /DIR=C:\HomeGenie /NOICONS /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS' -Wait; \
    powershell Remove-Item c:\install\* -recurse;
     
#Run homegenie
EXPOSE 80

ENTRYPOINT [ "C:\\HomeGenie\\HomeGenie.exe" ]

CMD Write-Host Homegenie Started... ; \
    while ($true) { Start-Sleep -Seconds 3600 }


