Analysis Report

Introduction:
Following the deployment of ALX's System Engineering & DevOps project 0x19 at approximately 06:00 West African Time (WAT) in Nigeria, an outage occurred on an isolated Ubuntu 14.04 container running an Apache web server. GET requests on the server resulted in 500 Internal Server Errors instead of the expected response, which should have been an HTML file defining a simple Holberton WordPress site.

Investigation Process:
The bug was identified by Brennan (BDB) around 19:20 PST, who initiated the debugging process. Initial observations included checking running processes using 'ps aux,' revealing two properly functioning apache2 processes (root and www-data), and inspecting the sites-available folder in the /etc/apache2/ directory, indicating the server was serving content from /var/www/html/.

Further debugging involved running strace on the PID of the root Apache process while simultaneously sending a curl request to the server. The first attempt yielded no useful information, but a repeated process on the PID of the www-data process revealed an -1 ENOENT (No such file or directory) error when attempting to access the file /var/www/html/wp-includes/class-wp-locale.phpp.

Manual inspection of files in the /var/www/html/ directory using Vim pattern matching identified the erroneous .phpp file extension in the wp-settings.php file (Line 137, require_once( ABSPATH . WPINC . '/class-wp-locale.php' );). The solution involved removing the trailing 'p' from the line, followed by successful testing with another curl request.

To prevent future occurrences, a Puppet manifest (0-strace_is_your_friend.pp) was written to automate the correction of similar errors. The manifest replaces any 'phpp' extensions in the file /var/www/html/wp-settings.php with 'php.'

Conclusion:
In summary, the outage was caused by a typo in the WordPress app, specifically in the wp-settings.php file, where it encountered a critical error attempting to load the file class-wp-locale.phpp instead of the correct file, class-wp-locale.php, located in the wp-content directory of the application folder. The resolution involved a simple fix by removing the trailing 'p' from the typo.

Preventive Measures:
To avoid such outages in the future, the following recommendations are made:

Thorough Testing: Ensure rigorous testing of the application before deployment to identify and address errors at an early stage.

Status Monitoring: Implement an uptime-monitoring service such as UptimeRobot to receive instant alerts in the event of website outages.

Automation: Utilize automation tools, like Puppet manifests, to streamline error correction processes and enhance system reliability.
