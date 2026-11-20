# PowerShell Scripts

A collection of reusable PowerShell scripts for Windows server and desktop administration.

## Script Header

Use the following header for new scripts:

```powershell
#-------------------------------------------------------------------------------------------#
# Author:       Dev Name
# Description:  Describe what the script does
# Version:      1.0
#-------------------------------------------------------------------------------------------#

# Changelog
# Version | Modified Date | Modified By | Change
# --------|---------------|-------------|----------------
# 1.0     | 2026-01-01    | Dev Name    | Original build
#-------------------------------------------------------------------------------------------#
```

## Available Scripts

### XML Parser

Loops through multiple XML files and exports their data into a CSV file.

### Server Health Monitor

Checks the health of one or more servers, including:

- Windows services
- IIS application pools, when applicable
- Optional event or resource checks

### Server Reboots

Reboots servers sequentially:

1. Reboots one server.
2. Waits for the server to become available again.
3. Proceeds to the next server.

### Desktop Support

Provides a simple graphical interface that allows users to select a common computer issue and submit a support ticket through email.

## Usage

Replace the placeholder below with the script's actual usage instructions:

```powershell
.\ScriptName.ps1
```

Include a description of required parameters, configuration files, and administrative privileges when each script is finalized.

## Requirements

- Windows PowerShell 5.1 or PowerShell 7+
- Required modules, Windows features, and permissions
- Network access to target servers or services, where applicable
````
