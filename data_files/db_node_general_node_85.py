==============================
Node js  express req.session is undefined using express-session  
==============================
 Once you mount a router onto an Express app, 
any subsequently declared middleware on that app won't get called
 for any requests that target the router.

So if you have this:

app.use(router)
app.use(session(...));

The session middleware won't get called for any requests
 that get handled by router (even if you declare the routes that the router should handle at some later point).
 For that, you need to change the order:

app.use(session(...));
app.use(router);

An additional issue is that you're exporting router, 
which should probably be app (which is the instance that "holds" all the middleware, routers, etc):

module.exports = app;

  
==============================
85 at  2021-10-29T15:22:52.000Z
==============================
