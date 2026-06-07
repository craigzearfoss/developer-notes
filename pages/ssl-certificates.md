### Request an SSL certificate from AWS Certificate Manager
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

*References*

[How to Implement AWS Certificate Manager for SSL/TLS](https://awsight.com/tutorials/18-certificate-manager.html)