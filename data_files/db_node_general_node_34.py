==============================
difference between ajax get and post  
==============================

136

GET is designed for getting data from the server. POST (and lesser-known friends PUT and DELETE) are designed for modifying data on the server.

A GET request should never cause data to be removed from an application. If you have a link you can click on with a GET to remove data, then Google spidering your site could click on all your "Delete" links.

The canonical answer can be found here, which quotes the HTML 2.0 spec:

    If the processing of a form is idempotent (i.e. it has no lasting observable effect on the state of the world), then the form method should be GET. Many database searches have no visible side-effects and make ideal applications of query forms.

    If the service associated with the processing of a form has side effects (for example, modification of a database or subscription to a service), the method should be POST.

In your AJAX call, you need to use whatever method your server supports. You should always design your server so that operations that modify data are called by POST/PUT/DELETE. Other comments have links to REST, which generally maps C/R/U/D to "POST or PUT"(Create)/GET(Read)/PUT(Update)/DELETE(Delete).


If you're sending large amounts of data, or sensitive data over HTTPS, you will want to use POST. If it's just a simple parameter, I would use GET.

GET requests have a limit to the amount of data that can be sent. I forget the exact number, but this can cause issues if you're sending anything substantial.

Basically the difference between GET and POST is that in a GET request, the parameters are passed in the URL where as in a POST, the parameters are included in the message body.
  
==============================
34 at  2021-10-29T15:22:52.000Z
==============================
