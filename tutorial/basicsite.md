---
layout: default
title: Making a Basic Static Site
---

# Making a Basic Static Site

I will attempt to guide you through creating a very basic static website (that
is, one which doesn't have any kind of user system, databases, etc., and just
contains pages of text and visuals). It's very cool to have your own personal
website and the barrier to entry is lower today than it has ever been. You will
not need to pay a cent to get your site up and running.

I will assume no technical knowledge, and will provide instructions for Windows
and Ubuntu Linux (all other Linux users should already know how to adapt the
instructions for their own conditions). If you've never done any programming or
engaged in more technical web activity, this guide should be suitable for you.

## Creating the actual website

First: what actually *is* a website?

Well, it's actually rather simple. A website is a collection of files and
directories (sometimes called folders), referencing each other in a way that
gives them an overall "cohesion". This collection of files is then stored on a
server, and the server's network is made available to the general public. When
you access a website through your browser, all you are doing is downloading
files and getting your browser to display them in a fancy way.

Knowing this, we can be more precise about *static* websites. A static website
is just a site where the server's files don't need to be refreshed
automatically upon an end user interaction. You, as the website creator, just
change those files manually and upload them to the server[^1].

So, we can actually move onto creating the site now.

The technology we'll be using is called GitHub Pages, and in order to you it,
you need to [create a GitHub account](https://github.com/signup). If you plan to
do any kind of programming or software development, you should already have a
GitHub account.

When you sign up, note your username - importantly, not your *display name*, but
your actual GitHub *username*. If you navigate to your profile on the site, your
username is the latter part of the URL - so since my profile is
`https://github.com/tirimid`, my GitHub username is `tirimid`.

Once you've noted down your username, [create a new GitHub repository](https://github.com/new).
The reason your GitHub username is so important is that the name of this
repository must be `{username}.github.io`. So, since my username is `tirimid`, I
would fill the "Repository name" field with `tirimid.github.io`[^2]. Make sure
that it is set to *public*, *not private*, otherwise it will not be accessible
on the internet.

The name of your repository, `{username}.github.io`, is the address at which you
will be able to find it online. But there's not much use trying to view it right
now, as there isn't any content on the site yet.

Speaking of which...

[^1]: Not *necessarily* true, since there are forms of automation and user
      interaction that you can add to a static site, but they don't work in the
      traditional "website" way, and this simple overview will suffice anyway.

[^2]: If you own a webdomain, you still want to name the repository `{username}.github.io`.
      As soon as you get it working, you can change the name of the repository
      and do the necessary configuration to set it up with your domain, which
      will not be explained here. When I created this site, it was first called
      `tirimid.github.io`, and eventually I renamed it to `tirimid.net` when I
      got the domain.

## Adding content to the website

stuff will be added here eventually...

## Making the website look less awful

stuff will be added here eventually...
