$ErrorActionPreference = "Stop"

$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$tomcatDir = Join-Path $projectDir "apache-tomcat-9.0.73"
$classesDir = Join-Path $projectDir "build\classes"
$warDir = Join-Path $projectDir "build\war"
$appDir = Join-Path $tomcatDir "webapps\HospitalManagementSystem"

New-Item -ItemType Directory -Force -Path $classesDir | Out-Null
New-Item -ItemType Directory -Force -Path $warDir | Out-Null

$sources = Get-ChildItem -Recurse -Filter *.java (Join-Path $projectDir "src\main\java") |
    ForEach-Object { $_.FullName }

$classpath = @(
    Join-Path $projectDir "lib\javax.servlet-api-4.0.1.jar"
    Join-Path $projectDir "src\main\webapp\WEB-INF\lib\mysql-connector-j-9.7.0.jar"
    Join-Path $tomcatDir "lib\jsp-api.jar"
    Join-Path $tomcatDir "lib\servlet-api.jar"
) -join ";"

javac -cp $classpath -d $classesDir $sources

Copy-Item -Recurse -Force (Join-Path $projectDir "src\main\webapp\*") $warDir
New-Item -ItemType Directory -Force -Path (Join-Path $warDir "WEB-INF\classes") | Out-Null
Copy-Item -Recurse -Force (Join-Path $classesDir "*") (Join-Path $warDir "WEB-INF\classes")

if (Test-Path $appDir) {
    Remove-Item -Recurse -Force $appDir
}

Copy-Item -Recurse -Force $warDir $appDir

Write-Host "Build and deploy complete."
Write-Host "Run .\run-tomcat.bat and open http://localhost:8081/HospitalManagementSystem/login.jsp"
