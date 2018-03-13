# Downloads
---
![Download](images/download_noborder.jpg)

This page includes different download types for individual boards. See individual product pages for details on what to download.

See Release notes [here](release_notes.md).

Software status legend:

Status | Meaning
--- | ---
Production | Ready to be used commercially.
RC | Release Candidate, stable and can be field tested.
Beta | No more major changes, use for development.
Alpha | Use for trying things out and providing feedback. Major changes to come.

# Visual Studio Project System
The extension is what gets loaded on Visual Studio to allow it to communicate with a TinyCLR OS device. It also includes project templates.

File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.8.0.vsix) | 2018-02-01 | Alpha | 14DD9177FF89D6F400AD4E0E62AEDB2B
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.7.0.vsix) | 2018-01-04 | Alpha | 20CDDE5FE6C5B0FDD41ECE39BCD0C967
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.6.0.vsix) | 2017-08-31 | Alpha | 68E94D0720CCDAC1A3E9BDEF7704FAAA
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.5.0.vsix) | 2017-07-07 | Alpha | 58542CEB7DAF6445AD10083ABA73D834
[v0.4.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.4.0.vsix) | 2017-05-10 | Alpha | 4D463EA5991EA7698110B79EF4DB6B8B
[v0.3.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.3.0.vsix) | 2017-04-06 | Alpha | 6094565340EDF8F5445106C2A9B1441C
[v0.2.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.2.0.vsix) | 2017-03-07 | Alpha | A9CB8E88011AFF28AD88656E86C73A31
[v0.1.0](http://files.ghielectronics.com/downloads/TinyCLR/Extensions/TinyCLR%20OS%20Project%20System%20v0.1.0.vsix) | 2016-12-16 | Alpha | D93A8FF13900362FB4528F8036D46612

# Libraries
Libraries are hosted though a local NuGet feed for now as we are a lot of changes still. These libraries will be hosted on http://www.nuget.org/ in the future.

File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.8.0.zip) | 2018-02-01 | Alpha | C7B0B05EEB173AE2B16F6F8B079ED8EE 
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.7.0.zip) | 2018-01-04 | Alpha | 62E4255D2534545937B5AFA5C19F15D2 
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.6.0.zip) | 2017-08-31 | Alpha | CA9275032B3A2EA403738497C2C0C280 
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.5.0.zip) | 2017-07-07 | Alpha | C1768FF218AB1790BD902E52561C0CE5 
[v0.4.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.4.0.zip) | 2017-05-10 | Alpha | 1A8B0E28431927FA4716B44B774FDF90 
[v0.3.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.3.0.zip) | 2017-04-06 | Alpha | 21D3E9AD37285B231B1E6E605B7CA709 
[v0.2.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.2.0.zip) | 2017-03-07 | Alpha | 7CDE2D7ADDD3E490344B1DA8DB342F8D 
[v0.1.0](http://files.ghielectronics.com/downloads/TinyCLR/Libraries/TinyCLR%20OS%20Libraries%20v0.1.0.zip) | 2016-12-16 | Alpha | 9E843638A8A4793814D76B522F8CBF1A 

# TinyCLR Config
TinyCLR Config is a tool used to update and configure your TinyCLR device.

File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Config/TinyCLR%20Config%20Setup%20v0.8.0.msi) | 2018-02-01 | Alpha | 5F5E8835C81D43894582A6B755F28875
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Config/TinyCLR%20Config%20Setup%20v0.7.0.msi) | 2018-01-04 | Alpha | 329D4A24BA66423DD5D655202873B38C
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Config/TinyCLR%20Config%20Setup%20v0.6.0.msi) | 2017-08-31 | Alpha | 75743E33D1B98E6999BDCC9936479C14

# Firmwares
The Firmware is the TinyCLR OS that lives on your hardware. The firmware version loaded on the hardware must match the version number of the extension and the libraries. This will be easier managed once the libraries are hosted on http://www.nuget.org/

## FEZCLR
This is the reference firmware for TinyCLR OS and it runs on the [FEZ](../fez/intro.md).

File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/FEZCLR/FEZCLR%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | 1C219C675CF6F7CE28B3F3971E9385BF
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/FEZCLR/FEZCLR%20Firmware%20v0.7.0.glb) | 2018-01-04 | Alpha | A0D3B8449C6D5D03E3CA4259AD94204A
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/FEZCLR/FEZCLR%20Firmware%20v0.6.0.glb) | 2017-08-31 | Alpha | 3D66C9FF460591AA2DD4B002DE6D9B9A
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/FEZCLR/FEZCLR%20Firmware%20v0.5.0.glb) | 2017-07-07 | Alpha | 93094FF58D78DEB36D22FD9450737362

## G30
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.8.0.ghi) | 2018-02-01 | Alpha | E6406D0BE2324897119EEBC7BAD5451F 
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.7.0.ghi) | 2018-01-04 | Alpha | 38F66032AB3F0728BED99EB3F204CD39 
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.6.0.ghi) | 2017-08-31 | Alpha | 6AF63423B229CF5A30B6B7E83D877FF9 
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.5.0.ghi) | 2017-07-07 | Alpha | 4A8479E0D431868ED047CB7C482511CE 
[v0.4.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.4.0.ghi) | 2017-05-10 | Alpha | FCBACDAB7C02E1A855375BF776EEE2FB
[v0.3.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.3.0.ghi) | 2017-04-06 | Alpha | 59A994B1F4F60FB3AE6CD8F91AB01650
[v0.2.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.2.0.ghi) | 2017-03-07 | Alpha | 6E5BB699634D78DD64FFFB69D547A58F
[v0.1.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G30/G30%20Firmware%20v0.1.0.ghi) | 2016-12-16 | Alpha | 6347B73E93FF9BF7D52ECE142D9F2ECB

## G80
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.8.0.ghi) | 2018-02-01 | Alpha | C4F546807FF741F19D8A318E36FEA158 
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.7.0.ghi) | 2018-01-04 | Alpha | 3873B974BD1871CE81B94CA0C9759C0A 
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.6.0.ghi) | 2017-08-31 | Alpha | 61759AB6015BD2B2FE1D9D5B4209BC6A 
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.5.0.ghi) | 2017-07-07 | Alpha | E9256BDB4A0FA61A30BF9B5294354618 
[v0.4.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.4.0.ghi) | 2017-05-10 | Alpha | E6EB8C753C4CE9A6197EC06F3C4CB848
[v0.3.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.3.0.ghi) | 2017-04-06 | Alpha | EDB489B34BC8E249D47160EA3AFE466C
[v0.2.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.2.0.ghi) | 2017-03-07 | Alpha | 4EAA86216B6FFCDE937D1CCFD9558356
[v0.1.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G80/G80%20Firmware%20v0.1.0.ghi) | 2016-12-16 | Alpha | 5C93CCA961904F25BB56A9B9AD7C501A

## G120
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G120/G120%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | 53277EBA90E4966F1AB1EB484F987B38
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G120/G120%20Firmware%20v0.7.0.glb) | 2018-01-04 | Alpha | 54F03A598791E8062096EE67ACA8C25A
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G120/G120%20Firmware%20v0.6.0.glb) | 2017-08-31 | Alpha | 9418A57C0B5F655F3FD35CBED0CEC16F
[v0.4.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G120/G120%20Firmware%20v0.4.0.ghi) | 2017-05-10 | Alpha | 1C09A3C7D5305B03F0FF51884ACBD2F2
[v0.3.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G120/G120%20Firmware%20v0.3.0.ghi) | 2017-04-06 | Alpha | 57836246074A8E729EE3D6C6BCF76F55
[v0.2.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G120/G120%20Firmware%20v0.2.0.ghi) | 2017-03-07 | Alpha | 66EAA71A4A7D1B96AC9CD7C892DAA3CE

## G400
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G400/G400%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | 7CC4E057095FA9BCD7D99523BC90839C
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G400/G400%20Firmware%20v0.7.0.glb) | 2018-01-04 | Alpha | B70F85903208040DB50C7862ACBE5A7D
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G400/G400%20Firmware%20v0.6.0.glb) | 2017-09-13 | Alpha | 81F063028D379699ECE969F45757C801
[v0.4.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G400/G400%20Firmware%20v0.4.0.ghi) | 2017-05-10 | Alpha | 03859F270F8B16CE4D40245918065E88
[v0.3.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/G400/G400%20Firmware%20v0.3.0.ghi) | 2017-04-06 | Alpha | 8AA7E83ED7A62A94F0833569A6A12FEE

## EMX
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/EMX/EMX%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | 6A9638C2EE1B4E90A2FA08B7E16B61AF
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/EMX/EMX%20Firmware%20v0.7.0.glb) | 2018-01-04 | Alpha | 2565650A2A476D61FF49EBC37BA6842B
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/EMX/EMX%20Firmware%20v0.6.0.glb) | 2017-08-31 | Alpha | EA9C0E782CB3AA34EE4852E7538F6138

## Embedded Master
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/EmbeddedMaster/EmbeddedMaster%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | CB254215C3D9499ABA58847324F55351
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/EmbeddedMaster/EmbeddedMaster%20Firmware%20v0.7.0.glb) | 2018-01-04 | Alpha | FDC1B41FA77A70FFF4DEDD696007F72F
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/EmbeddedMaster/EmbeddedMaster%20Firmware%20v0.6.0.glb) | 2017-08-31 | Alpha | AD4E022B7F493B60BEEA3EBE685AB525

## USBizi
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/USBizi/USBizi%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | 7F738C57B223709B18E935BD6EC586A5
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/USBizi/USBizi%20Firmware%20v0.7.0.glb) | 2018-01-04 | Alpha | 7165508B530FE2C004B98B1AC9C6FB4B
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/USBizi/USBizi%20Firmware%20v0.6.0.glb) | 2017-08-31 | Alpha | 20748AD886D5C20C8EF7B93AD8C522E9

## Cerb
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Cerb/Cerb%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | CA45384A7AB32DBAA393577D713FB639 
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Cerb/Cerb%20Firmware%20v0.7.0.glb) | 2018-01-04 | Alpha | 3DA2F43F1791051EAB92816AFCF7F0A9 
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Cerb/Cerb%20Firmware%20v0.6.0.glb) | 2017-08-31 | Alpha | 92BB5C076086AB581A1C64B40248297D 
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Cerb/Cerb%20Firmware%20v0.5.0.glb) | 2017-07-07 | Alpha | 4F8C039EC6D0206D7FC97083E8765EC7 

## FEZ Hydra
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/FEZHydra/FEZHydra%20Firmware%20v0.8.0.glb) | 2018-02-01 | Alpha | 027E3CF379D81D9BE76B719FD470D52A 

## netduino 3
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/netduino3/netduino3%20Firmware%20v0.8.0.hex) | 2018-02-01 | Alpha | 60205AB9866D0E0D9C23B790A278661A
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/netduino3/netduino3%20Firmware%20v0.7.0.hex) | 2018-01-04 | Alpha | 7A561E09BF56A486786DB3B06A0A6D44
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/netduino3/netduino3%20Firmware%20v0.6.0.hex) | 2017-08-31 | Alpha | 5FBCCADDDCF1663E64FA2DDE3A16B745
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/netduino3/netduino3%20Firmware%20v0.5.0.hex) | 2017-07-07 | Alpha | F6C51E2E7286262D4652D40CAAB1731A

## Quail
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Quail/Quail%20Firmware%20v0.8.0.hex) | 2018-02-01 | Alpha | 65FD3FCFFFE739266ECB9A97CF688C5E
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Quail/Quail%20Firmware%20v0.7.0.hex) | 2018-01-04 | Alpha | 661C6D577EF29CE7B55E64247B1D44FE
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Quail/Quail%20Firmware%20v0.6.0.hex) | 2017-08-31 | Alpha | F6E6C9D6C05084AB87B79ECA76D867BC
[v0.5.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/Quail/Quail%20Firmware%20v0.5.0.hex) | 2017-07-07 | Alpha | 714AD4715964A7B6CA3A23C67370A5EA

## clicker
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/clicker/clicker%20Firmware%20v0.8.0.hex) | 2018-02-01 | Alpha | 185BB5F8FEF14B502669DEA8B6D3B33B
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/clicker/clicker%20Firmware%20v0.7.0.hex) | 2018-01-04 | Alpha | 51F9CB3ABC3919A5C2457F2DB8767B9E
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/clicker/clicker%20Firmware%20v0.6.0.hex) | 2017-08-31 | Alpha | 6A28632B898EEF7DF56A73D1034FED97

## clicker 2
File | Date | Status | MD5
--- | --- | --- | ---
[v0.8.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/clicker2/clicker2%20Firmware%20v0.8.0.hex) | 2018-02-01 | Alpha | FC9043D746B798CCC56BD0719FEB4124
[v0.7.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/clicker2/clicker2%20Firmware%20v0.7.0.hex) | 2018-01-04 | Alpha | B57669816F36BB258E6FA38716FC2489
[v0.6.0](http://files.ghielectronics.com/downloads/TinyCLR/Firmwares/clicker2/clicker2%20Firmware%20v0.6.0.hex) | 2017-08-31 | Alpha | EAC2085E921759ED81E60973C00A0DF5

***

Visit our main website at [**www.ghielectronics.com**](http://www.ghielectronics.com) and our community forums at [**forums.ghielectronics.com**](https://forums.ghielectronics.com/).
