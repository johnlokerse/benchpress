## Steps to publish the Powershell Module

- Create Powershell module file
- Generate the Module manifest file
   ```
    New-ModuleManifest -Path C:\Users\Munish\Documents\Benchpress\BicepTest\BicepTest.psd1 -ModuleVersion "1.0" -Author "CSE"
    ```
- Test the Manifest
    ```
    Test-ModuleManifest .\BicepTest.psd1 
    ```
- Publish the module to the PS Gallery
    ```
    Publish-Module  -Path .\BicepTest\ -NuGetApiKey "qq"  -Verbose
    ```