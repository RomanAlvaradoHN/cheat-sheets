# Using `curl` and `wget` commands

<br>

---

## curl
API calls, authentication, payload delivery (POST/PUT), inspecting HTTP headers, shell script integration.

---

##### HTTP Requests & REST APIs (CRUD)

```bash
# GET: If you only type a URL, curl will download and show the HTML code  
# or the JSON that is returned by de page.
curl https://api.github.com/users/octocat
```

```bash
# POST: Send JSON payload
curl -X POST https://httpbin.org/post \
    -H "Content-Type: application/json" \
    -d '{"service": "auth-api", "status": "active"}'
```

```bash
# PUT: Update an existing resource
curl -X PUT https://jsonplaceholder.typicode.com/posts/1 \
    -H "Content-Type: application/json" \
    -d '{"id": 1, "title": "Updated Title", "body": "New content"}'
```

```bash
# DELETE: Remove a resource
curl -X DELETE https://jsonplaceholder.typicode.com/posts/1
```

##### Save files
```bash
# Save with a custom filename (-o)
curl -o response.json https://api.github.com/users/octocat
```

```bash
# Save with original filename (-O)
curl -O https://api.github.com/users/octocat
```


##### Authentication & Headers

```bash
# Bearer / JWT Token
curl -H "Authorization: Bearer YOUR_TOKEN_HERE" https://api.github.com/user
```

```bash
# Basic Authentication
curl -u "username:password" https://httpbin.org/basic-auth/username/password
```

```bash
# Send Custom Headers & Cookies
curl -H "X-API-Version: 2" -b "session_id=xyz123" https://httpbin.org/headers
```


##### Network Diagnostics & SysAdmin Troubleshooting

```bash
# Inspect HTTP Response Headers only (Status Code, Server Type, CORS)
curl -I https://www.cloudflare.com
```

```bash
# Verbose Mode: Debug DNS lookup, TLS/SSL Handshake, and raw headers.  
# It shows all the proccess: conection, handshake SSL, Headers, etc.
curl -v https://api.github.com
```

```bash
# Ignore Self-Signed / Invalid SSL Certificates (Dev/Staging environments)
curl -k https://localhost:8443
```

```bash
# If a URL redirects (HTTP 301/302), curl stops by default.  
# -L tells curl to follow the redirection.
curl -L https://google.com
```


##### Best practices for DevOps and Scripts
Use: `curl -sfL`
- `-s` (Silent):  Hide progress bars
- `-f` (Fail): Ensure returned code (HTTP 4xx/5xx) in case of fail.
- `-L` (Location): Follow redirections automatically  



```bash
# Recommended pattern for remote installations:
curl -sfL https://get.k3s.io | sh -
```


##### Latency and performance
```bash
# Measure server response performance directly in the terminal
curl -o /dev/null -s -w "\nDNS Lookup: %{time_namelookup}s\nConnect: %{time_connect}s\nTTFB: %{time_starttransfer}s\nTotal Time: %{time_total}s\n" https://www.cloudflare.com
```





</br></br>

---

## wget
Large or background file downloads, automatic retries, recursive directory mirroring.

---

##### Downloads & Mirroring

```bash
# Download and save with original filename
wget https://releases.ubuntu.com/22.04/ubuntu-22.04.4-live-server-amd64.iso
```

```bash
# Rename output file
wget -O custom_ubuntu.iso https://releases.ubuntu.com/22.04/ubuntu-22.04.4-live-server-amd64.iso
```

```bash
# Resume an interrupted download (Essential for large files!)
wget -c https://releases.ubuntu.com/22.04/ubuntu-22.04.4-live-server-amd64.iso
```

```bash
# Download multiple files listed in a text file
wget -i download_list.txt
```

```bash
# Download in background (logs output to wget-log)
wget -b https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.tar.xz
```

```bash
# Mirror a full public documentation directory
wget --mirror --convert-links --page-requisites --no-parent https://docs.python.org/3/tutorial/
```