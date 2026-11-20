# Web/Application Server Watchdog

PowerShell script that periodically checks Windows services and IIS application pools across one or more servers. It starts stopped resources and sends an SMTP alert describing each successful or failed start attempt.

## Checks performed

1. **Windows services**
   - Finds services in a stopped state.
   - Starts services that are configured for automatic startup.
   - Ignores services configured for disabled or manual startup.

2. **IIS application pools** *(IIS/web application servers only)*
   - Finds stopped application pools.
   - Attempts to start each stopped pool.
   - Reports successful and failed attempts.

3. **Email notifications**
   - Sends results by SMTP to one or more configured recipients.
   - Can be used to alert administrators about recovered or unavailable resources.

## Prerequisites

- Windows PowerShell 5.1 or PowerShell 7
- Administrative permissions on each monitored server
- IIS management modules for application-pool checks
- WinRM or remote-management access, if resources are checked from a central server
- SMTP access to a configured mail server

## Usage

```powershell
.\Watchdog.psm1 -Servers "SERVER01", "SERVER02" `
    -SmtpServer "smtp.example.com" `
    -From "monitor@example.com" `
    -To "admin@example.com"
```

Replace the placeholders and parameters with the names supported by the script.

## Configuration

Document each supported setting here:

| Setting | Description | Example |
|---|---|---|
| Server list | Servers to monitor | `SERVER01, SERVER02` |
| Services | Services to check | `W3SVC`, `MSSQLSERVER` |
| Application pools | Pools to check | `DefaultAppPool` |
| SMTP server | Mail relay or server | `smtp.example.com` |
| Recipients | Notification recipients | `admin@example.com` |
| Logging | Output or log location | `C:\Logs\Watchdog.log` |

## Scheduling

The script can be run manually or through Task Scheduler.

Recommended baseline:

- Run with a dedicated service account.
- Grant the account only the required remote and service permissions.
- Configure the task to run whether or not a user is logged on.
- Enable logging or route output to a persistent log file.
- Start with a short test interval in a non-production environment.

## Logging and notifications

The script should record:

- Server and resource name
- Previous state
- Requested action
- Result and error message
- Timestamp

Avoid sending secrets or passwords in email or command-line arguments.

## Troubleshooting

| Symptom | Likely cause | Check |
|---|---|---|
| Service cannot be started | Insufficient permissions | Account rights and UAC context |
| IIS pool is unavailable | IIS module or feature missing | IIS installation and management tools |
| Remote server cannot be reached | Firewall or WinRM issue | Remote management configuration |
| Email is not received | SMTP authentication or relay issue | Relay policy, credentials, and mail logs |

## Limitations

- Remote hosts must be reachable and permit the required management operations.
- The script should use short timeouts and avoid repeatedly starting resources in a tight loop.
- Unexpected service or pool states should be tested before the script is used in production.
- SMTP credentials, where required, should be stored securely rather than embedded in the script.
