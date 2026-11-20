# PowerShell XML to CSV Converter

A PowerShell utility that processes one or more XML files and exports their contents into a CSV file.

## Prerequisites

- Windows PowerShell 5.1 or PowerShell 7+
- Read access to the XML source directory
- Write access to the CSV destination directory

## Usage

```powershell
.\Convert-XmlToCsv.ps1 `
    -Path ".\input" `
    -OutputFile ".\output\converted.csv"
```

Use `-Recurse` to include XML files in subdirectories:

```powershell
.\Convert-XmlToCsv.ps1 `
    -Path ".\input" `
    -OutputFile ".\output\converted.csv" `
    -Recurse
```

## Parameters

| Parameter | Description |
| --- | --- |
| `Path` | XML file or directory to process. |
| `OutputFile` | Destination CSV file. |
| `Recurse` | Optional. Searches subdirectories for XML files. |

## Input

XML files must contain data supported by the converter.

## Output

The generated CSV contains one row per XML record. Column names are derived from the XML structure or configured field mappings.

## Troubleshooting

- **Script cannot run:** Check the PowerShell execution policy.
- **XML parsing fails:** Validate the file's XML structure.
- **CSV is missing rows:** Confirm that the XPath or XML element names match the input.
- **File is locked:** Close the destination CSV before running the script.

## Contributing

Contributions should include updated documentation and a sample XML file when changing the conversion behavior.
