---
title: "BitBalloon vs Amazon S3"
layout: post
author: Matthias Biilmann
description: How Amazon S3 and BitBalloon compares as a static site hosting platform.
image: /img/posts/apple-orange.jpg
---

![Apples to Oranges](/img/posts/apple-orange.jpg)

This morning's inbox had an email from a potential reseller customer, asking how BitBalloon compares to Amazon S3. It's not the first time we've gotten this question, so I decided to take the opportunity to do a proper writeup about the differences between BitBalloon and S3.

In short: S3 manages files. BitBalloon manages sites.

<!-- excerpt -->

### Level of Abstraction

S3, as it's name implies, is a low-level utility. Beyond the "bucket" you upload files to, S3 makes no assumptions about files you upload to it and the role they play in composing an actual website.

BitBalloon is the other way around. It solves specific challenges around publishing and managing actual static sites by dealing with files you upload to it in a "site aware" manner.

If you’re looking to add static site publishing component into a SaaS web authoring tool, it's possible to do with S3, but there's a surprising number of gotchas you have to work around.

The first one is that Amazon by default limits you to 100 Buckets per account, and each site uses one up. For a few sites this obviously won’t be a problem, but if you’re looking to build a tool that publishes websites at a large scale, this could spell trouble.

### Latency

On it's own, S3 will give you poor latency, since it's not optimized for that. So if you use S3 for static hosting you should always combine it with Cloudfront (or another CDN).

### Vary: Accept-Encoding HTTP header

S3 also does not provide proper support for the Vary: Accept-Encoding HTTP header. So for mobile sites (or sites supporting older browsers) you might find that serving gzipped content in that setting is more trouble than it's worth.

BitBalloon automatically creates a gzipped version of everything and supports this header, so a path like /my-large-js-app.js will return either the gzipped version of the file or the plain text version of the file depending on whether or not the browser supports gzip compressed content.

When using S3 for static sites, you’ll have to decide whether to serve gzipped or plain text content to all browsers, regardless of gzip support. You’ll also have to do the gzipping up front if you chose to serve the compressed version.

### Atomic Deploys

S3 doesn’t do atomic deploys. So typically if you deploy a new version of the site there'll be a time where the site is in a half-deployed state with old and new assets mixed together. With BitBalloon no part of a deploy ever goes live before all the files in the deploy have been uploaded and processed.

### Build Automation

BitBalloon will process all your assets during each deploy and create unique urls for each piece of content, set far future caching headers and update the HTML to refer to the CDN URLs of the new bundled, minified and cache-optimized assets. We also run all images through lossless image optimization.

Often sites deployed to BitBalloon will get close to 100/100 score on Pingdom Speed Test tool because of all those web performance optimizations. Obviously if you want to achieve a similar result on S3/Cloudfront, it takes quite a bit of work to get it all right.

### Form processing

BitBalloon parses the uploaded HTML for forms and automatically connects them up to an API-accessible database. All the other HTML tags work on static sites, forms should work too! There's nothing like this for S3.

### Versioning

S3 can enable versioning for individual files. BitBalloon automatically stores a complete version for each deploy, so you can always review or rollback to a earlier version.

### Stay tuned for more

We have lots more features on the roadmap as well and we're always open to your suggestions for what else we can do to create the ultimate platform for static site hosting.
