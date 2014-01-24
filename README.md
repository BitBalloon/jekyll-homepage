# The BitBalloon home page

This is the full public site of BitBalloon.com ported to Jekyll, a static site generator.

To build the site:

1. git clone https://github.com/BitBalloon/jekyll-homepage.git
2. cd jekyll-homepage
3. bundle install
4. jekyll build

To run a preview server, follow the same steps but run `jekyll serve --watch` instead of step 4.

# Deploying to BitBalloon

From the root of the repository

1. gem install bitballoon
2. bitballoon deploy _site

And *Boom* your very own BitBalloon site is live.