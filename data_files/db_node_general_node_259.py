==============================
 Invalid plugin options for "gatsby-plugin-manifest": - "value" must contain at least one of [icon, icons]  
==============================
In your options for the gatsby-plugin-manifest, point to the directory of your logo            resolve: `gatsby-plugin-manifest`,       options: {         icon: `src/assets/images/logo.png`, // This path is relative to the root of the site.             },
  
==============================
259 at  2021-10-29T15:22:52.000Z
==============================
