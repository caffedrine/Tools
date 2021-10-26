## I. Cloud computing concepts

#### Types of cloud computing
- IaaS (Infrastructure as a Service) - virtual machines, HwAB OSes (computing power, data storage, etc)
- PaaS (Platform as a Service) - development tools, config management (e.g. Windows Azure)
- SaaS (Software as a Service) - sofrware to subscribers (e.g. Google Docs, Calendar, etc)
- IDaaS (Identity as a Service) - cloud based authentication, multifactor authentication (OneLogin, Okta)
- SECaaS (Security as a Service) - peenetration testing, authentication, intrusiuon detection, anti-malware, security incident, etc in the cloud (McAfee Managed Security)
- CaaS (Container as a Service) - virtualization  of container enginees (Docker, AWS EC2, Kubernets)
- FaaS (Function as a Service) - functions to run microservices
- XaaS - Anything as a Service

#### Cloud deployment models
- Public cloud - services open for public use
- Private cloud - cloud infrastructure operated by single organization only
- Community cloud - shared infrastructure between organizations from a specific community (security, compliance, etc)
- Hybrid cloud - combination of multiple clouds (e.g. public + private cloud)
- Multi cloud - environment that uses cloud from multiple providers


#### Cloud computing actors
- Cloud consumer - person/org that uses cloud
- Cloud provider - person/org providing cloud resources
- Cloud carrier - intermediary for providing connectivity, transport services, etc.
- Cloud auditor - entity for making independent assesments of cloud service controls (security audit, privacy audit, performance audit)
- Cloud broker - entity that manages cloud services in terrms of use, performance, delivery. Maintains the relationship between cloud provider and end user.


#### Cloud storage architecture
- Front-end - public APIs for data and management
- Midleware - object storage, virtual servers, etc
- Back-end - phisical storage servers

## II. containers technology

#### Containers architecture
- Tier-1 - Developer machines for image creation and testing
- Tier-2 - Testing and accreditation systems
- Tier-3 - Registries
- Tier-4 - Orchestrators 
- Tier-5 - Hosts

## III. Cloud computing threats

OWASP Top 10 Cloud Security Risks

- R1 - Accountability and Data Ownership
- R2 - User Identity Federation
- R3 - Regulatory Compliance
- R4 - Business continuity and Resilliency
- R5 - User Privacy and Secondary Usage of Data
- R6 - Service and Data integration
- R7 - Multi Tenacy and Phisical Security
- R8 - Incidence Analysis and Forensics Support
- R9 - Infrastructure Security
- R10 - Non-production environment exposure


1. Side-Channel Attacks
2. Wrapping Attack - intercepting SOAP message and send back response as a legitimate one
3. MitC (Man-in-the-Cloud) attack - abuse cloud synchronization services (Google Drive, Dropbox, etc)
4. Cloud Hopper Attack - infiltrate fake MSPs (Managed Services PRoviders) to gain access to other conpanies info.
5. Cloud Cryptojacking - use victim to mine digital assets
6. Cloudborne Attacks - vulnerability in bare-metal cloud servers that allow attackers to implant malicious code in the firmwares.


## IV. Cloud hacking

1. Vulnerability scan using **Trivy**
2. Kubernets vuln scanner using **Sysdiag**
3. Enumerating S3 buckets using **Spyse**
4. Reverse IP search using bing (aka other service shosted on same ip)
5. Using dorks
6. Identify open S3 Buckets using **S3Scanner**
7. Enumerate Kubernetes **etcd** ( disitrbuted database where object, apis, etc are stored)
8. Enumerate AWS Account IDs (using errors messages, code repo, screens, RDS, etc)
9. Enumerating IAM roles (from error messages, etc)
10. Enummetering bucket permissions using **S3Inspector**
11. Exploit cloud infrastructure using **Nimbostratus** (tool used for fingerprinting and exploiting)
12. Exploit misconfigured AWS S3 buckets 
13. Compromising AQS IAM Credentials 
14. Hijack misconfigured IAR Roles using **Pacu**
15. Crack AWS Access Keys using **DumpsterDriver**
16. Exploit Docket Containers on AWS using **CCAT (Cloud Container Attack Tool)**
17. Exploiting Docker Remote API
18. Hacking container volumes by exploiting weak or default configurations by Accesing Master Nodes, Accesing Nodes or Accessing container.
19. Use **CloudGoat AWS** to test cloud hacking skills.
20. Gain access by Exploiting SSRF Vulnerability
21. AWS IAM Privilege Escalation Techniques
	- Create new policy version
	- Assign the default policy version to an exiating version
	- Create an EC2 instance with an existing instance profile
	- Create a new user access key
	- Create/update login profile
	- Attach a policy to a user/group/role
	- Create/Update an inline policy for user/group/role
	- Add a user to a group
22. Escalating Privileged on google Storage Buckets using **GCPBucketBrute**
23. Backdooring Docker Images using **dockerscan**
24. AWS Hacking Tool: **AWS pwn**


## V. Kubernetes Vulnerabilities
1. No certificate revocation
2. Unauthorized HTTPS connections
3. Exposed Bearer Tokens in Logs
4. Exposure of sensitive Data via Environment Variables
5. Secrets at Rest not Encrypted by Default
6. Non-constant Time Password comparision
7. Hardcoded Credential PAths
8. Log rotation is not Atomic
9. No Back-off process for scheduling
10. No Non-repudiation

## VI. Tools


#### Cloud security tools
1. Qualys cloud Platform
2. CloudPassage Halo
3. Aqua
4. Sysdiag Falco
5. Anchore
6. NeuVector
7. Lacework
8. Teneable.io container Security


#### Kubernetes Security Tools
1. Kube-bench
2. Alcide Advisor
3. Stackrox
4. Aqua Kubernetes Security
5. CubeXray
6. Sumo Logic

#### Serverless Application Security Solutions
1. Protego
2. Synk
3. Twistlock
4. Aqua
5. Prisma cloud
6. Dashbird
