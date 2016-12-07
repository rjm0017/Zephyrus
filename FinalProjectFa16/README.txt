Basically an NSURL tut to get the upload and
download functionality of the speedtest figured
out.

NSURL object - represents URL that can potentially
contain location of resource or remote server,
path of local file, or encoded data (pretty broad)

URL objects - can be used to construct URLs and
access their parts.
** you can pass URL obj to other APIs to retrieve
their contents.

Classes to access contents of remote resources:
- URLSession
- NSURLConnection
- NSURLDownload
** this is most likely a good start for my app

- > Use LAMP server to have the HTML portions
    that are easy to access via URL like at
    ADTRAN?

    Made. IP: 138.197.30.160

    Then it should be possible to have an image
    in the app (assets folder) and in the LAMP
    server (htdocs(?) folder), and make it so
    the server deletes contents of the inbound
    folder after each test
    ^- that may be handled on the app's side

Basically have the app make HTTP GET and POST
requests to upload and download the images,
and record the time it takes for each action
to complete. Divide that into # bits in the
image, and you have a (really, really rough)
estimate of the speed of the connection

Note: All files accessible by URL should be
placed in /var/www/html in the LAMP server
- made subdirectories 'inbound' and 'outbound'
  to partition data incoming and outgoing
  when speed tests are perfomed.
** Need to find a way to clear inbound after
   each test runs!

/var/www/html/outbound
/var/www/html/inbound

** PICS ARE UP! The three pictures are in the
outbound folder ready to be used in a download
speed test hooray!

User made with permissions to r/w in /var/www/html
-> zephyr::zephyr <-
Avoids letting app have complete root access to server


* Change app icon and intro picture to the cyclone frog
dude from wind waker (CYCLOS!)
