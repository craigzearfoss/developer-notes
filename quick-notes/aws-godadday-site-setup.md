## Configure a GoDaddy site on AWS

### Add the domain to the hosted zones
- [ ] Log into AWS console.
- [ ] Select a region from the dropdown list in the top right corner. For example, us-east-1 or us-east-2.
- [ ] Go to the Route 53 dashboard.
- [ ] On the **Route 53 Dashboard** under *DNS management* click on "Hosted zones".
- [ ] Click on the orange "Create hosted zone" button.
- [ ] On the **Create hosted zone** page:
    - **Hosted zone configuration**
        - **Domain**
            - Enter the domain name.
        - **Description**
            - Optional.
        - **Type**
            - Select "Public hosted zone".
        - Click on the orange "Create hosted zone" button in the bottom right.

### Add subdomains to A records
- On the Route 53 Host zones page click on the domain.
- In the records table click on the orange "Create record" button at the top right.
- On the Create record page fill out the following fields.
    - **Record name**
      - Enter the subdomain name.
    - **Record type**
      - Select "A".
    - **Check "Alias"**
      - Select "Alias to Application and Classic Load Balancer".
      - Select your region, for example "US East (N. Virginia)".
      - Select your load balancer. For example, dualstack.zearfoss-elb-1159102711.us-east-1.elb.amazonaws.com
    - **TTL (seconds)**
        - Keep it low for sites in development. 300, which is 5 minutes should be fine.
    - **Routing policy**
        - Select "Simple routing".
- Click on "Create record".

### Get SSL certificate
- Log into the AWS console.
- Search for "Certificate Manager" in the services search.
- Click "AWS Certificate Manager".
  - **Critical**: For CloudFront, ensure you're in us-east-1 (N. Virginia) region.
- Click the orange "Request" button at the top right.
- Check "Request a public certificate" and click "Next".
- On the Request public certificate page:
  - **Domain names**
    - Enter the fully qualified domain name
   **Allow export**-
    - Check **Disable export**.
  - **Validation method**
    - Check "DNS validation".
  - **Key algorithm**
    - Use the default.
  - Click the orange "Request" button.

### Point the DNS to AWS
- [ ] Log into AWS console.
- [ ] Select a region from the dropdown list in the top right corner. For example, us-east-1 or us-east-2.
- [ ] Go to the Route 53 dashboard.
- [ ] Select "Hosted zones" from the left menu.
- [ ] Click on the hosted zone for the domain.
- [ ] In the Records table select the domain.
- [ ] Make a note of the **Value/Route traffic to** records for the "NS" **Type**.
  -  These are also displayed on the right side of the page.
- [ ] Log into **GoDaddy.com**.
- [ ] Click on you initial icon in the top right and select "My Products".
- [ ] Click on the domain you want to update.
- [ ] In the left menu click on "Domain"
- [ ] Select the "DNS" tab and then the "Nameservers".
- [ ] Click on the "Change Nameservers" button at the right.
- [ ] Replace the nameservers with the values from AWS in the earlier previous section. (Don't include the trailing period.)

### Get the name servers from GoDaddy
- [ ] Log ino the GoDaddy account.
- [ ] Under the top right drop down menu select "My Products".
- [ ] Click on the domain that you want to point to AWS.
- [ ] In the left menu click on "Domain"
- [ ] Click on the "DNS" tab a the top of the page.
- [ ] Click on the "Nameservers" tab.

